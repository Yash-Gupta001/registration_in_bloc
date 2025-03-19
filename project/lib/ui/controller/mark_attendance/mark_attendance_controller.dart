import 'package:get/get.dart';
import '../../../data/repository_impl/mark_attendance_repository_impl.dart';
import '../base_controller.dart';

class MarkAttendanceController extends BaseController {
  MarkAttendanceRepositoryImpl repository;
  var selectedStatus = '1'.obs;

  MarkAttendanceController({required this.repository});

  @override
  void onInit() {
    super.onInit();
  }
}
