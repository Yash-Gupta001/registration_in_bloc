import 'package:rfc_cc/data/model/user_info.dart';

import 'package:rfc_cc/data/network/operation_callback.dart';

import '../../app/utils/constant.dart';
import '../local_database/app_database.dart';
import '../network/api_request.dart';
import '../network/api_service.dart';
import '../repository/register_course_repository.dart';

class RegisterCourseRepositoryImpl extends RegisterCourseRepository {
  AppDatabase appDatabase;
  RegisterCourseRepositoryImpl({required this.appDatabase});

  @override
  getStudentregisterCourse(String regNo, OperationCallBack listener) async {
    var query = {"id": regNo};
    await APIService(
            apiPath: Constant.getRegisterCourses,
            methodType: HTTPMethod.post,
            queryData: {},
            contentTypeData: Constant.fromUrlEncode,
            bodyData: query,
            listenerCallback: listener)
        .request();
  }

  @override
  Future<UserInfo?> getUserInfo() async {
    UserInfo? userInfo = await appDatabase.userDao.getUserInfo();
    return userInfo;
  }
}
