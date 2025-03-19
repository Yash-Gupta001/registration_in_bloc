import 'package:get/get.dart';
import 'package:rfc_cc/ui/controller/class_schedule/class_schedule_controller.dart';
import '../../../data/local_database/app_database.dart';
import '../../../data/repository_impl/class_schedule_repository_impl.dart';

class ClassSchedulePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ClassScheduleController>(
        ClassScheduleController(
            repository: ClassScheduleRepositoryImpl(
                appDatabase: Get.find<AppDatabase>())),
        permanent: true);
  }
}
