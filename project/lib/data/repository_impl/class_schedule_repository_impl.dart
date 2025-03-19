import 'package:rfc_cc/data/network/operation_callback.dart';

import '../../app/utils/constant.dart';
import '../local_database/app_database.dart';
import '../model/user_info.dart';
import '../network/api_request.dart';
import '../network/api_service.dart';
import '../repository/class_schedule_repository.dart';

class ClassScheduleRepositoryImpl extends ClassScheduleRepository {
  AppDatabase appDatabase;
  ClassScheduleRepositoryImpl({required this.appDatabase});

  @override
  getStudentClassSchedule(
      String regNo, String sessionNo, OperationCallBack listener) async {
    var query = {"id": regNo, "sessionno": sessionNo};
    await APIService(
            apiPath: Constant.getStudentClassSchedule,
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
