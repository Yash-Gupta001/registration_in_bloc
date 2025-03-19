import 'package:get/get.dart';
import 'package:rfc_cc/data/repository_impl/profile_repository_impl.dart';
import 'package:rfc_cc/ui/controller/profile/profile_controller.dart';
import '../../../data/local_database/app_database.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProfileController>(
        ProfileController(
            repository:
                ProfileRepositoryImpl(appDatabase: Get.find<AppDatabase>())),
        permanent: true);
  }
}
