import 'package:get/get.dart';
import 'package:rfc_cc/ui/controller/auth/authentication_failed_controller.dart';

class AuthFailedBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthFailedController>(AuthFailedController(), permanent: true);
  }
}
