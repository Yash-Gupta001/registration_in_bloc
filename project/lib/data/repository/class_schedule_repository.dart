import 'package:rfc_cc/data/network/operation_callback.dart';

import '../model/user_info.dart';

abstract class ClassScheduleRepository {
  getStudentClassSchedule(
      String regNo, String sessionNo, OperationCallBack listener);
  Future<UserInfo?> getUserInfo();
}
