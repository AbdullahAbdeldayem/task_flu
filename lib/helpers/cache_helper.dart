import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future PostData({required String key, required value}) async {
    if (value is bool) return await sharedPreferences.setBool(key, value);
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is double) return await sharedPreferences.setDouble(key, value);
    if (value is List<String>)
      return await sharedPreferences.setStringList(key, value);
  }

  static Future GetData({
    required key,
  }) async {
    return await sharedPreferences.get(key);
  }

  static Future RemoveData({
    required key,
  }) async {
    return await sharedPreferences.remove(key);
  }
}
