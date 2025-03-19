import 'package:rfc_cc/data/model/user_info.dart';
import 'package:rfc_cc/data/network/operation_callback.dart';

/*
  Created By Amol Gahukar 20-11-2024
*/
abstract class AuthRepository {
  login(String username, String password, OperationCallBack listener);
  Future<void> inserUserInfo(UserInfo userInfo);
  Future<void> deleteUserInfo(UserInfo userInfo);
  Future<UserInfo?> getUserInfo();
}
