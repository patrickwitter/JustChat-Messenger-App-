import 'package:shared_preferences/shared_preferences.dart';
import 'package:messengerapp/constants/shared_preferenceskey.dart';

class SharedPreferncesService {
  static late SharedPreferences _preferences;

  static void init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  //save data
  Future<bool> saveUserName(String getUserName) async {
    return _preferences.setString(SharedPrefKey.userNameKey, getUserName);
  }

  Future<bool> saveUserEmail(String getUseremail) async {
    return _preferences.setString(SharedPrefKey.userEmailKey, getUseremail);
  }

  Future<bool> saveUserId(String getUserId) async {
    return _preferences.setString(SharedPrefKey.userIdKey, getUserId);
  }

  Future<bool> saveDisplayName(String getDisplayName) async {
    return _preferences.setString(SharedPrefKey.displayNameKey, getDisplayName);
  }

  Future<bool> saveUserProfileUrl(String getUserProfile) async {
    return _preferences.setString(
        SharedPrefKey.userProfilePicKey, getUserProfile);
  }

  // get data
  Future<String> getUserName() async {
    return _preferences.getString(SharedPrefKey.userNameKey) ?? "";
  }

  Future<String> getUserEmail() async {
    return _preferences.getString(SharedPrefKey.userEmailKey) ?? "";
  }

  Future<String> getUserId() async {
    return _preferences.getString(SharedPrefKey.userIdKey) ?? "";
  }

  Future<String> getDisplayName() async {
    return _preferences.getString(SharedPrefKey.displayNameKey) ?? "";
  }

  Future<String> getUserProfileUrl() async {
    return _preferences.getString(SharedPrefKey.userProfilePicKey) ?? "";
  }

  Future<bool> deleteUserInfo() async {
    return await _preferences.clear();
  }
}
