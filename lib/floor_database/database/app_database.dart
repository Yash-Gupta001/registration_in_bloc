import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../dao/userdao.dart';
import '../entity/user_entity.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [UserEntity])
abstract class AppDatabase extends FloorDatabase {
  UserDao get usereDao;
}
 
// flutter packages pub run build_runner build