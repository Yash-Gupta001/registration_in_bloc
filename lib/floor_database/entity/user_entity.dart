import 'package:floor/floor.dart';

@Entity(tableName: 'user_entity')
class UserEntity {
  @PrimaryKey(autoGenerate: true)
  int? id;

  final String name;
  final String email;
  final String phone;
  final String username; 
  final String password;

  UserEntity({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.username,
  });

  @override
  String toString() {
    return 'User(id: $id, uid: $username, name: $name)';
  }
}
