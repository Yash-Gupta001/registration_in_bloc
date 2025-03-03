import 'package:floor/floor.dart';

@Entity(tableName: 'employee_entity')
class EmployeeEntity {
  @PrimaryKey(autoGenerate: true)
  int? id;

  final String name;
  final String email;
  final String phone;
  final String uid; // username
  final String password;

  EmployeeEntity({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.uid,
  });

  @override
  String toString() {
    return 'Employee(id: $id, uid: $uid, name: $name)';
  }
}
