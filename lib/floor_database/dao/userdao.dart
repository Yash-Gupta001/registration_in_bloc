import 'package:floor/floor.dart';

import '../entity/user_entity.dart';

@dao
abstract class UserDao {

  // query find all user
  @Query('SELECT * FROM user_entity')
  Future<List<UserEntity>> findAllEmployees();

  // print all user
  @Query('SELECT * FROM user_entity')
  Future<List<UserEntity>> printAllEmployees();

  // insert an user
  @insert
  Future<void> insertUser(UserEntity user);

  // update an user
  @update
  Future<void> updateUser(UserEntity user);

  // delete an user
  @delete
  Future<void> deleteUser(UserEntity user);

  // Query to find an user by their UID and password
  @Query(
      'SELECT * FROM user_entity WHERE username = :username AND password = :password')
  Future<UserEntity?> findUserByusernameAndPassword(
      String username, String password);

  // Query to find an User by their UID
  @Query('SELECT * FROM user_entity WHERE username = :username')
  Future<UserEntity?> findUserByusername(String username);

  // delete all user from the database
  @Query('DELETE FROM user_entity')
  Future<void> deleteAllUser();
}
