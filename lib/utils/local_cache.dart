import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalCache {
  SharedPreferences? preferences;

  static final LocalCache _instance = LocalCache._internal();
  LocalCache._internal();
  factory LocalCache() {
    return _instance;
  }

  void init() async {
    preferences = await SharedPreferences.getInstance();
  }

  String? getLocalString(String key) {
    return preferences?.getString(key);
  }

  void setLocalString(String key, String value) {
    preferences?.setString(key, value);
  }
}
