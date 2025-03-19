import '../model/user_info.dart';
import '../network/operation_callback.dart';

abstract class ProfileRepository {
  getStudentDetaile(String regNo, OperationCallBack listener);
  Future<UserInfo?> getUserInfo();
}
