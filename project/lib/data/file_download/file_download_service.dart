import 'dart:io';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import 'package:http/http.dart' as http;

import '../../permission/permission_service.dart';

class FileDownloadService {
  // Download progress observable
  final RxDouble downloadProgress = 0.0.obs;
  final RxBool isDownloading = false.obs;

  Future<void> downloadFileInBackground(String url, String fileName) async {
    try {
      var status = await PermissionService.requestPermissions(permissions: []);
      if (!status) {
        Get.snackbar("Permission Denied", "Storage access is required.");
        return;
      }
      isDownloading.value = true;
      downloadProgress.value = 0;

      final rootIsolateToken = ServicesBinding.rootIsolateToken!;

      // Create a receive port for progress updates
      final receivePort = ReceivePort();
      final result = await compute(
        _downloadFile,
        DownloadParams(
            url: url,
            fileName: fileName,
            sendPort: receivePort.sendPort,
            rootIsolateToken: rootIsolateToken),
      );

      // Listen for progress updates
      receivePort.listen((progress) {
        if (progress is double) {
          downloadProgress.value = progress;
          print(progress);
        }
      });

      if (result.success) {
        Get.snackbar(
          "Download Complete",
          "File saved to: ${result.filePath}",
          snackPosition: SnackPosition.BOTTOM,
        );
        // Open file after download
        await OpenFile.open(result.filePath);
      } else {
        Get.snackbar(
          "Download Failed",
          result.error ?? "Unknown error occurred",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to download file: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isDownloading.value = false;
    }
  }
}

// Parameters class for download
class DownloadParams {
  final String url;
  final String fileName;
  final SendPort sendPort;
  final RootIsolateToken rootIsolateToken;

  DownloadParams(
      {required this.url,
      required this.fileName,
      required this.sendPort,
      required this.rootIsolateToken});
}

// Result class for download
class DownloadResult {
  final bool success;
  final String? filePath;
  final String? error;

  DownloadResult({
    required this.success,
    this.filePath,
    this.error,
  });
}

// Background download function
Future<DownloadResult> _downloadFile(DownloadParams params) async {
  try {
    BackgroundIsolateBinaryMessenger.ensureInitialized(params.rootIsolateToken);
    final client = http.Client();
    final request = http.Request('GET', Uri.parse(params.url));
    final response = await client.send(request);

    if (response.statusCode != 200) {
      return DownloadResult(
        success: false,
        error: 'Failed to download: Status ${response.statusCode}',
      );
    }

    final contentLength = response.contentLength ?? 0;
    int received = 0;

    // Get appropriate directory based on platform
    Directory? dir;
    if (Platform.isAndroid) {
      dir = Directory('/storage/emulated/0/Download');
    } else if (Platform.isIOS) {
      dir = await getApplicationDocumentsDirectory();
    } else {
      dir = await getDownloadsDirectory();
    }

    if (dir == null) {
      return DownloadResult(
        success: false,
        error: 'Could not access downloads directory',
      );
    }

    // Create directory if it doesn't exist
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }

    final String filePath = "${dir.path}/${params.fileName}";
    final File file = File(filePath);
    final sink = file.openWrite();

    await for (final chunk in response.stream) {
      sink.add(chunk);
      received += chunk.length;
      if (contentLength > 0) {
        final progress = (received / contentLength) * 100;
        params.sendPort.send(progress);
      }
    }

    await sink.close();
    client.close();

    return DownloadResult(
      success: true,
      filePath: filePath,
    );
  } catch (e) {
    print(e.toString());
    return DownloadResult(
      success: false,
      error: e.toString(),
    );
  }
}
