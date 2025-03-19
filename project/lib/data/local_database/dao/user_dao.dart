import 'package:floor/floor.dart';
import 'package:rfc_cc/data/model/user_info.dart';

/*
  Created By Amol Gahukar 22-11-2024
*/
@dao
abstract class UserDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertUser(UserInfo user);

  @delete
  Future<void> deleteUser(UserInfo user);

  @Query('SELECT * FROM user')
  Future<UserInfo?> getUserInfo();
}
