import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static StorageUtil _storageUtil;
  static SharedPreferences _preferences;
  static SharedPreferences _preferencesLearning;

  static Future<StorageUtil> getInstance() async {
    if (_storageUtil == null) {
      var secureStorage = StorageUtil._();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil;
  }

  StorageUtil._();
  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
    _preferencesLearning = await SharedPreferences.getInstance();
  }

  // put string
  static Future<bool> putString(String key, String value) {
    if (_preferences == null) return null;
    return _preferences.setString(key, value);
  }

  // get string
  static String getString(String key, {String defValue = ''}) {
    if (_preferences == null) return defValue;
    return _preferences.getString(key) ?? defValue;
  }

  // plus count
  static Future<bool> plusCount(String key, int value) {
    if (_preferencesLearning == null) return null;
    return _preferencesLearning.setInt(key, value);
  }

  // get string
  static int getInt(String key, {int defValue = 0}) {
    if (_preferencesLearning == null) return defValue;
    return _preferencesLearning.getInt(key) ?? defValue;
  }

  // clear string
  static Future<bool> clrString() {
    SharedPreferences prefs = _preferences;
    prefs.clear();
  }
}
