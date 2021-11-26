import 'package:flutter/material.dart';

class Screen {
  static Screen? _instance;
  static BuildContext? _context;
  Screen._();
  static Screen getInstance() {
    _instance ??= Screen._();
    return _instance!;
  }

  static void preInit(BuildContext context) {
    _context = context;
  }

  static double get width {
    if (_context != null) {
      return MediaQuery.of(_context!).size.width;
    }
    return 0;
  }

  static double get height {
    if (_context != null) {
      return MediaQuery.of(_context!).size.height;
    }
    return 0;
  }

  static double get top {
    if (_context != null) {
      return MediaQuery.of(_context!).padding.top;
    }
    return 0;
  }

  static double get bottom {
    if (_context != null) {
      return MediaQuery.of(_context!).padding.bottom;
    }
    return 0;
  }

  static double get navigationHeight => 56;
  static double get bottomNavigationHeight => 56;

  // static double getWidth() {
  //   return Screen.getInstance().width;
  // }

  // static double getHeight() {
  //   return Screen.getInstance().height;
  // }

  // static double getTop() {
  //   return Screen.getInstance().top;
  // }

  // static double getBottom() {
  //   return Screen.getInstance().bottom;
  // }

  // static double getNavigationHeight() {
  //   return Screen.getInstance().navigationHeight;
  // }

  // static double getBottomNavigationHeight() {
  //   return Screen.getInstance().bottomNavigationHeight;
  // }
}
