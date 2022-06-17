import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferncesService {
  static late SharedPreferences _preferences;

  static void init() async {
    _preferences = await SharedPreferences.getInstance();
  }
}
