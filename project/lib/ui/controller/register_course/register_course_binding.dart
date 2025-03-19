import 'package:get/get.dart';
import 'package:rfc_cc/data/repository_impl/register_course_repository_impl.dart';
import 'package:rfc_cc/ui/controller/register_course/register_course_controller.dart';
import '../../../data/local_database/app_database.dart';

class RegisterCourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterCourseController>(() => RegisterCourseController(
        repository: RegisterCourseRepositoryImpl(
            appDatabase: Get.find<AppDatabase>())));
  }
}
