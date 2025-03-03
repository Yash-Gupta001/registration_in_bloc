import 'dart:async';
import 'dart:typed_data';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../dao/employeedao.dart';
import '../entity/employee_entity.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [EmployeeEntity])
abstract class AppDatabase extends FloorDatabase {
  EmployeeDao get employeeDao;
}
 

// flutter packages pub run build_runner build