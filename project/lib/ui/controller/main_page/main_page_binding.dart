import 'package:get/get.dart';
import 'package:rfc_cc/ui/controller/main_page/main_page_controller.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainPageController>(MainPageController(), permanent: true);
  }
}
