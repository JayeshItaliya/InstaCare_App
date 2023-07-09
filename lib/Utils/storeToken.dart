import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static const String userLoginToken = "userLoginToken";
  static const String firstName = "firstName";
  static const String lastName = "lastName";
  static const String profileImage = "profileImage";
  static const String role = "role";
  static const String loginValue = "loginValue";
  static const String fullName = "fullName";
  static const String status = "status";



  static SharedPreferences? preferences;

  static createSharedPref() {
    SharedPreferences.getInstance().then((pref) {
      StorageUtil.preferences = pref;
    });
  }

  static setData(String key, dynamic value) {
    if (StorageUtil.preferences != null) {
      if (value is String) {
        StorageUtil.preferences!.setString(key, value);
      } else if (value is int) {
        StorageUtil.preferences!.setInt(key, value);
      } else if (value is double) {
        StorageUtil.preferences!.setDouble(key, value);
      } else if (value is bool) {
        StorageUtil.preferences!.setBool(key, value);
      } else {
        StorageUtil.preferences!.setString(key, value);
      }
    }
  }

  static Future<dynamic> getData(String key) async {
    if (StorageUtil.preferences == null) {
      return null;
    } else {
      return StorageUtil.preferences!.get(key);
    }
  }

  static void clearData() {
    if(StorageUtil.preferences == null) {
      SharedPreferences.getInstance().then((value) {
        value.clear();
      });
    }else{
      StorageUtil.preferences!.clear();
    }
  }
}