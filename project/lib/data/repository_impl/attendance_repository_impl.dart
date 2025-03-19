import 'package:rfc_cc/app/utils/constant.dart';
import 'package:rfc_cc/data/local_database/app_database.dart';
import 'package:rfc_cc/data/model/user_info.dart';
import 'package:rfc_cc/data/network/api_request.dart';
import 'package:rfc_cc/data/network/api_service.dart';
import 'package:rfc_cc/data/network/operation_callback.dart';
import 'package:rfc_cc/data/repository/attendance_repository.dart';

class AttendanceRepositoryImpl extends AttendanceRepository {
  AppDatabase appDatabase;
  AttendanceRepositoryImpl({required this.appDatabase});

  @override
  getAttendance(String regNo, OperationCallBack listener) async {
    var query = {"id": regNo};
    await APIService(
            apiPath: Constant.getAttendance,
            methodType: HTTPMethod.post,
            queryData: {},
            contentTypeData: Constant.fromUrlEncode,
            bodyData: query,
            listenerCallback: listener)
        .request();
  }

  @override
  getAttendanceCount(String regNo, OperationCallBack listener) async {
    var query = {"UA_NO": regNo};
    await APIService(
            apiPath: Constant.getAttendanceCount,
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

  @override
  getAttendanceDetail(String regNo, String courseId, String sessionNo,
      OperationCallBack listener) async {
    var query = {"id": regNo, "sub": courseId, "sessionno": sessionNo};
    await APIService(
            apiPath: Constant.getAttendanceBySubject,
            methodType: HTTPMethod.post,
            queryData: {},
            contentTypeData: Constant.fromUrlEncode,
            bodyData: query,
            listenerCallback: listener)
        .request();
  }
}
