import 'package:rfc_cc/data/model/user_info.dart';

/*
  Created By Amol Gahukar 20-11-2024
*/
abstract class HomeRepository {
  Future<UserInfo?> getUserInfo();
}
