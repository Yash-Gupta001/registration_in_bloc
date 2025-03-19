import 'package:rfc_cc/data/model/user_info.dart';

abstract class MarkAttendanceRepository {
  Future<UserInfo?> getUserInfo();
}
