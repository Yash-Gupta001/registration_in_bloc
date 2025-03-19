import 'package:rfc_cc/data/model/user_info.dart';

import 'package:rfc_cc/data/network/operation_callback.dart';

import '../../app/utils/constant.dart';
import '../local_database/app_database.dart';
import '../network/api_request.dart';
import '../network/api_service.dart';
import '../repository/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  AppDatabase appDatabase;
  ProfileRepositoryImpl({required this.appDatabase});

  @override
  getStudentDetaile(String regNo, OperationCallBack listener) async {
    var query = {"id": regNo};
    await APIService(
            apiPath: Constant.getStudentInformation,
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
