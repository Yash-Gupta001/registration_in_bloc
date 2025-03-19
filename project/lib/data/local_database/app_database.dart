import 'dart:async';

import 'package:floor/floor.dart';
import 'package:rfc_cc/data/local_database/dao/user_dao.dart';
import '../model/user_info.dart';
// ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

/*
  Created By Amol Gahukar 22-11-2024
*/
@Database(version: 1, entities: [UserInfo])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}
