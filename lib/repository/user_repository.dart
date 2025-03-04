import 'package:registration_in_bloc/floor_database/dao/userdao.dart';
import 'package:registration_in_bloc/floor_database/entity/user_entity.dart';

class UserRepository {
  final UserDao userDao;

  UserRepository({required this.userDao});
  // Your authenticate function where you query the database for user authentication
  Future<UserEntity?> authenticate({required String username, required String password}) async {
    try {
      final user = await userDao.findUserByusernameAndPassword(username, password);
      return user; 
    } 
    catch (error) {
      throw Exception('Authentication failed');
    }
  }
}
