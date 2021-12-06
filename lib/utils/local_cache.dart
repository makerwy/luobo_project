import 'package:shared_preferences/shared_preferences.dart';

class LocalCache {
  SharedPreferences? _sharedPreferences;
  static LocalCache? _instance;

  static LocalCache getInstance() {
    _instance ??= LocalCache._();
    return _instance!;
  }

  LocalCache._();

  // LocalCache._pre(SharedPreferences preferences) {
  //   _sharedPreferences = preferences;
  // }

  // static Future<LocalCache> preInit() async {
  //   if (_instance == null) {
  //     SharedPreferences preferences = await SharedPreferences.getInstance();
  //     _instance = LocalCache._pre(preferences);
  //   }
  //   return _instance!;
  // }

  init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  Future<T?> get<T>(String key) async {
    await init();
    dynamic result = _sharedPreferences?.get(key);
    if (result != null) {
      return result as T;
    }
    return null;
  }

  remove(String key) async {
    await init();
    _sharedPreferences?.remove(key);
  }

  void setBool(String key, bool value) async {
    await init();
    _sharedPreferences?.setBool(key, value);
  }

  void setInt(String key, int value) async {
    await init();
    _sharedPreferences?.setInt(key, value);
  }

  void setDouble(String key, double value) async {
    await init();
    _sharedPreferences?.setDouble(key, value);
  }

  void setString(String key, String value) async {
    await init();
    _sharedPreferences?.setString(key, value);
  }

  void setStringList(String key, List<String> value) async {
    await init();
    _sharedPreferences?.setStringList(key, value);
  }
}
