import 'package:floor/floor.dart';

import '../entity/employee_entity.dart';

@dao
abstract class EmployeeDao {

  // query find all employees
  @Query('SELECT * FROM employee_entity')
  Future<List<EmployeeEntity>> findAllEmployees();

  // print all employees
  @Query('SELECT * FROM employee_entity')
  Future<List<EmployeeEntity>> printAllEmployees();

  // insert an employee
  @insert
  Future<void> insertEmployee(EmployeeEntity employee);

  // update an employee
  @update
  Future<void> updateEmployee(EmployeeEntity employee);

  // delete an employee
  @delete
  Future<void> deleteEmployee(EmployeeEntity employee);

  // Query to find an employee by their UID and password
  @Query(
      'SELECT * FROM employee_entity WHERE uid = :uid AND password = :password')
  Future<EmployeeEntity?> findEmployeeByUidAndPassword(
      String uid, String password);

  // Query to find an employee by their UID
  @Query('SELECT * FROM employee_entity WHERE uid = :uid')
  Future<EmployeeEntity?> findEmployeeByUid(String uid);

  // delete all employees from the database
  @Query('DELETE FROM employee_entity')
  Future<void> deleteAllEmployees();
}
