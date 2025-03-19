import 'package:rfc_cc/data/model/user_info.dart';
import 'package:rfc_cc/data/network/operation_callback.dart';

abstract class AttendanceRepository {
  getAttendance(String regNo, OperationCallBack listener);
  getAttendanceCount(String regNo, OperationCallBack listener);
  Future<UserInfo?> getUserInfo();
  getAttendanceDetail(String regNo, String courseId, String sessionNo,
      OperationCallBack listener);
}
