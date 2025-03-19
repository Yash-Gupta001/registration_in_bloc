import 'package:get/get.dart';
import 'package:rfc_cc/data/local_database/app_database.dart';
import 'package:rfc_cc/data/repository_impl/home_repository_impl.dart';
import 'package:rfc_cc/ui/controller/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
        HomeController(
            repository:
                HomeRepositoryImpl(appDatabase: Get.find<AppDatabase>())),
        permanent: true);
  }
}
