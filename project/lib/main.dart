import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rfc_cc/app/utils/color_config.dart';
import 'package:rfc_cc/app/utils/share_prefrance.dart';
import 'package:rfc_cc/app/utils/string_config.dart';
import 'package:rfc_cc/data/local_database/app_database.dart';
import 'package:rfc_cc/data/network/connectivity_service.dart';
import 'package:rfc_cc/ui/view/app.dart';

import 'data/file_download/file_download_service.dart';
import 'data/network/base_url.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // if (Platform.isIOS) {
  //   SystemUiOverlayStyle.dark.copyWith(
  //       systemNavigationBarColor:
  //           Colors.white, // Set to match your app background
  //       systemNavigationBarIconBrightness: Brightness.light,
  //       statusBarColor: ColorConfig.primaryColor,
  //       statusBarIconBrightness: Brightness.light,
  //       statusBarBrightness: Brightness.light);
  // } else {
  //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //     statusBarColor: ColorConfig.primaryColor,
  //     statusBarIconBrightness: Brightness.light,
  //     systemNavigationBarColor: Colors.white,
  //     statusBarBrightness: Brightness.light,
  //     systemNavigationBarIconBrightness: Brightness.light,
  //   ));
  // }

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.white,
    statusBarBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
  ));

  BaseUrl.setEnvironment("Test");
  // BaseUrl.setEnvironment("Prod");
  //debugPaintSizeEnabled = true;
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.top]);
  final storageService = StorageService();
  await storageService.init();
  final fileDownloadService = FileDownloadService();
  Get.put<FileDownloadService>(fileDownloadService);
  // Register it with GetX
  Get.put<StorageService>(storageService);
  final database = await $FloorAppDatabase.databaseBuilder('rfc.db').build();
  Get.put<AppDatabase>(database);
  Get.put<ConnectivityService>(ConnectivityService());
  StringConfig.loadConfig();
  ColorConfig.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const App());
  });
}
