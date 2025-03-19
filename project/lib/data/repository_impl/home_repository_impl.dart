import 'package:rfc_cc/data/local_database/app_database.dart';
import 'package:rfc_cc/data/model/user_info.dart';
import 'package:rfc_cc/data/repository/home_repository.dart';

/*
  Created By Amol Gahukar 20-11-2024
*/
class HomeRepositoryImpl extends HomeRepository {
  AppDatabase appDatabase;
  HomeRepositoryImpl({required this.appDatabase});

  @override
  Future<UserInfo?> getUserInfo() async {
    UserInfo? userInfo = await appDatabase.userDao.getUserInfo();
    return userInfo;
  }
}
