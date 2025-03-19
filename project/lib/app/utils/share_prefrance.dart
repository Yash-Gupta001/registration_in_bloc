import 'package:shared_preferences/shared_preferences.dart';

/*
  Created By Amol Gahukar 22-11-2024
*/
class StorageService {
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Set a value
  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  // Get a value
  String? getString(String key) {
    return _prefs.getString(key);
  }

  // Remove a value
  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }
}
