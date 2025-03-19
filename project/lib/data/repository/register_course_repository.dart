import '../model/user_info.dart';
import '../network/operation_callback.dart';

abstract class RegisterCourseRepository {
  getStudentregisterCourse(String regNo, OperationCallBack listener);
  Future<UserInfo?> getUserInfo();
}
