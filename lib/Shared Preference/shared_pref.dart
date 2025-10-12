import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  static const String _isFirstLaunchKey = 'isFirstLaunch';

  static Future<void> setFirstLaunchDone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isFirstLaunchKey, false);
  }

  static Future<bool> isFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isFirstLaunchKey) ?? true;
  }

}
