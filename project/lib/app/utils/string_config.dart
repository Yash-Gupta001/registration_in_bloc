import 'dart:convert';

import 'package:flutter/services.dart';

/*
  Created By Amol Gahukar 22-11-2024
*/
class StringConfig {
  static Map<String, dynamic> _config = {};

  static Future<void> loadConfig() async {
    const String flavor = String.fromEnvironment('FLAVOR');
    const configPath = String.fromEnvironment('CONFIG_PATH',
        defaultValue: 'assets/config/$flavor/string.json');
    final configString = await rootBundle.loadString(configPath);
    _config = json.decode(configString);
  }

  static String getLabel(String key, {String defaultValue = ''}) {
    return _config[key] ?? defaultValue;
  }

  ///Title
  static String titleMarkAttendance = "Mark Attendance";

  ///

  static String lblCoreElective = "Core/Elective";
  static String lblOpenGlobalElective = "Open/Global Elective";
  static String lblSelectCorseType = "Select Course Type";
}
