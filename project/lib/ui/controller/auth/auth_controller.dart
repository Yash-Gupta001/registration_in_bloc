import 'package:get/get.dart';
import 'package:rfc_cc/app/utils/show_snack_bar.dart';
import 'package:rfc_cc/data/model/initial.dart';
import 'package:rfc_cc/data/model/status.dart';
import 'package:rfc_cc/data/model/user_info.dart';
import 'package:rfc_cc/data/network/operation_callback.dart';
import 'package:rfc_cc/data/repository_impl/auth_repository_impl.dart';
import 'package:rfc_cc/ui/controller/base_controller.dart';

import '../../../app/utils/config.dart';
import '../../view/main_page.dart';
import '../main_page/main_page_binding.dart';

class AuthController extends BaseController {
  AuthRepositoryImpl repository;

  AuthController({required this.repository});

  String password = "admin@123";
  String username = "23SU2270001";

  // String password = "Admin@1234";
  // String username = "312321201003";

  // String password = "Admin@1234";
  // String username = "TAD11";

  loginV2(String username, String password) async {
    showLoader();
    await repository.login(
        username,
        password,
        OperationCallBack<Initial, Status>(
          success: (data) {
            hideLoader();
            var initial = Initial.fromJson(data);
            if (initial.userInfo != null) {
              repository.inserUserInfo(initial.userInfo!);
              UserInfo userInfo = initial.userInfo!;
              storageService.setString(Config.IDNO, userInfo.idNo!);
              storageService.setString(Config.UA_NO, userInfo.uaNo!);
              storageService.setString(Config.UA_TYPE, userInfo.uaType!);
              storageService.setString(Config.TOKEN, userInfo.token!);
              storageService.setString(Config.REG_NO, userInfo.regNo!);
              MainPageBinding().dependencies();
              Get.off(const MainPage());
            } else {}
          },
          error: (data) {
            hideLoader();
          },
          authenticationError: (data) {
            hideLoader();
          },
          noInternet: (data) {
            var status = Status.fromJson(data);
            ShowSnackBar(message: status.message!).showMessage();
            hideLoader();
          },
        ));
  }
}
