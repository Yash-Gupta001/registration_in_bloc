import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

class PermissionService {
  /// Request specified permissions, including storage permissions for documents and images
  static Future<bool> requestPermissions({
    List<Permission>? permissions,
  }) async {
    // If no specific permissions are provided, default to storage permissions
    permissions ??= await _getDefaultStoragePermissions();

    Map<Permission, PermissionStatus> statuses = await permissions.request();

    bool allGranted = true;
    List<Permission> deniedPermissions = [];

    statuses.forEach((permission, status) {
      if (!status.isGranted) {
        allGranted = false;
        deniedPermissions.add(permission);
      }
    });

    if (!allGranted) {
      // Re-request denied permissions
      Map<Permission, PermissionStatus> reRequestStatuses =
          await deniedPermissions.request();

      reRequestStatuses.forEach((permission, status) {
        if (!status.isGranted) {
          // If still denied, open app settings
          openAppSettings();
        }
      });
    }

    return allGranted;
  }

  /// Get default storage permissions based on platform and SDK version
  static Future<List<Permission>> _getDefaultStoragePermissions() async {
    if (Platform.isAndroid) {
      return await _isAndroid13OrHigher()
          ? [Permission.photos]
          : [Permission.storage];
    } else if (Platform.isIOS) {
      return [Permission.photos];
    }
    return [];
  }

  /// Check if storage permission is granted
  static Future<bool> hasStoragePermission() async {
    if (Platform.isAndroid) {
      if (await _isAndroid13OrHigher()) {
        return await Permission.photos.isGranted;
      } else {
        return await Permission.storage.isGranted;
      }
    }

    if (Platform.isIOS) {
      return await Permission.photos.isGranted;
    }

    return false;
  }

  // Private helper methods
  static Future<bool> _isAndroid13OrHigher() async {
    if (Platform.isAndroid) {
      final deviceInfo = DeviceInfoPlugin();
      final androidInfo = await deviceInfo.androidInfo;
      return androidInfo.version.sdkInt >= 33;
    }
    return false;
  }
}
