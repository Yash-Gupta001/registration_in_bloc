import 'package:rfc_cc/app/utils/constant.dart';
import 'package:rfc_cc/data/local_database/app_database.dart';
import 'package:rfc_cc/data/model/user_info.dart';
import 'package:rfc_cc/data/network/api_request.dart';
import 'package:rfc_cc/data/network/api_service.dart';
import 'package:rfc_cc/data/network/operation_callback.dart';
import 'package:rfc_cc/data/repository/auth_repository.dart';

/*
  Created By Amol Gahukar 15-11-2024
*/
class AuthRepositoryImpl extends AuthRepository {
  AppDatabase appDatabase;
  AuthRepositoryImpl({required this.appDatabase});

  @override
  login(String username, String password, OperationCallBack listener) async {
    var query = {"username": username, "password": password};
    await APIService(
            apiPath: Constant.login,
            methodType: HTTPMethod.post,
            queryData: {},
            contentTypeData: Constant.fromUrlEncode,
            bodyData: query,
            listenerCallback: listener)
        .request();

    //return Initial.fromJson(request);
  }

  @override
  Future<void> deleteUserInfo(UserInfo userInfo) async {
    appDatabase.userDao.deleteUser(userInfo);
  }

  @override
  Future<void> inserUserInfo(UserInfo userInfo) async {
    appDatabase.userDao.insertUser(userInfo);
  }

  @override
  Future<UserInfo?> getUserInfo() async {
    UserInfo? userInfo = await appDatabase.userDao.getUserInfo();
    return userInfo;
  }
}
