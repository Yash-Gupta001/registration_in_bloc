import 'package:registration_in_bloc/floor_database/dao/userdao.dart';
import 'package:registration_in_bloc/floor_database/entity/user_entity.dart';

class UserRepository {
  final UserDao userDao;

  UserRepository({required this.userDao});
  // authenticate function from you query the database for user authentication
  Future<UserEntity?> authenticate({required String username, required String password}) async {
    try {
      final user = await userDao.findUserByusernameAndPassword(username, password);
      return user; 
    } 
    catch (error) {
      throw Exception('Authentication failed');
    }
  }

  Future<void> addUser(UserEntity user) async {
  try {
    // Check if the username already exists in the database
    final existingUser = await userDao.findUserByusername(user.username);
    
    // If the user already exists, throw an exception
    if (existingUser != null) {
      throw Exception('Username already exists');
    }

    // If the username doesn't exist, insert the new user
    await userDao.insertUser(user);
  } catch (e) {
    // Catch and rethrow any errors
    throw Exception('Failed to add user: $e');
  }
}



}
