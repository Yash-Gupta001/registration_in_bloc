import 'package:get/get.dart';
import 'package:rfc_cc/app/utils/share_prefrance.dart';
import 'package:rfc_cc/data/model/status.dart';
import 'package:rfc_cc/ui/controller/auth/authentication_failed_binding.dart';
import 'package:rfc_cc/ui/loader.dart';
import 'package:rfc_cc/ui/view/authentication_failed_page.dart';

import '../../data/file_download/file_download_service.dart';

/*
  Created By Amol Gahukar 15-11-2024
*/
class BaseController extends GetxController {
  var loader = Loader();
  final StorageService storageService = Get.find<StorageService>();
final FileDownloadService fileDownloadService =
      Get.find<FileDownloadService>();
  var authnticationFailed = Rx<Status?>(null);
  var noInternet = Rx<Status?>(null);
  var currentIndex = 0.obs;
  showLoader() {
    loader.showDialog("Loading...");
  }

  @override
  void onInit() {
    super.onInit();
    authnticationFailed.listen((onData) {
      final currentRoute = Get.currentRoute;
      if (currentRoute != "/AuthenticationFailedPage") {
        print(onData?.message!);
        AuthFailedBinding().dependencies();
        Get.to(() => const AuthenticationFailedPage());
      }
    });
  }

  hideLoader() {
    loader.hideProgress();
  }
}
