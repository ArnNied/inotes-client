import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static Future<String?> get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('session') ?? "";
  }

  static Future<void> set(String session) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('session', session);
  }

  static Future<void> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('session');
  }
}
