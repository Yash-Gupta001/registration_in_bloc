import 'package:get/get.dart';
import 'package:rfc_cc/data/local_database/app_database.dart';
import 'package:rfc_cc/ui/controller/attendance/attendance_controller.dart';
import '../../../data/repository_impl/attendance_repository_impl.dart';

/*
  Created By Amol Gahukar 20-11-2024
*/
class AttendancePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AttendanceController>(
        AttendanceController(
            repository:
                AttendanceRepositoryImpl(appDatabase: Get.find<AppDatabase>())),
        permanent: true);
  }
}
