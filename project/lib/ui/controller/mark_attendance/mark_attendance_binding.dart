import 'package:get/get.dart';

import '../../../data/local_database/app_database.dart';
import '../../../data/repository_impl/mark_attendance_repository_impl.dart';
import 'mark_attendance_controller.dart';

class MarkAttendanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MarkAttendanceController(
        repository: MarkAttendanceRepositoryImpl(
            appDatabase: Get.find<AppDatabase>())));
  }
}
