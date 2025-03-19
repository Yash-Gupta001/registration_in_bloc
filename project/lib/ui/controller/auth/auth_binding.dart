import 'package:get/get.dart';
import 'package:rfc_cc/data/repository_impl/auth_repository_impl.dart';
import 'package:rfc_cc/ui/controller/auth/auth_controller.dart';

import '../../../data/local_database/app_database.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(
        AuthController(
            repository:
                AuthRepositoryImpl(appDatabase: Get.find<AppDatabase>())),
        permanent: true);
  }
}
