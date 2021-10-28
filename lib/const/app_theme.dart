//主题设置
import 'package:flutter/material.dart';

class AppTheme {
  static const double bodyFontSize = 14.0;
  static const double smallFontSize = 16;
  static const double normalFontSize = 20;
  static const double largeFontSize = 24;

  static const MaterialColor norPrimarySwatch =
      MaterialColor(0xFFFF0000, <int, Color>{
    50: Color(0xFFFFEBEE),
    100: Color(0xFFFFCDD2),
    200: Color(0xFFEF9A9A),
    300: Color(0xFFE57373),
    400: Color(0xFFEF5350),
    500: Color(0xFFFF0000),
    600: Color(0xFFE53935),
    700: Color(0xFFD32F2F),
    800: Color(0xFFC62828),
    900: Color(0xFFB71C1C),
  });

  static const MaterialColor darkPrimarySwatch =
      MaterialColor(0xFFFF0000, <int, Color>{
    50: Color(0xFFFFEBEE),
    100: Color(0xFFFFCDD2),
    200: Color(0xFFEF9A9A),
    300: Color(0xFFE57373),
    400: Color(0xFFEF5350),
    500: Color(0xFFFF0000),
    600: Color(0xFFE53935),
    700: Color(0xFFD32F2F),
    800: Color(0xFFC62828),
    900: Color(0xFFB71C1C),
  });

  static const AppBarTheme norAppBarTheme = AppBarTheme(
      backgroundColor: Colors.white,
      shadowColor: Color(0x00000000),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ));
  static const AppBarTheme darkAppBarTheme = AppBarTheme(
      backgroundColor: Colors.black,
      shadowColor: Color(0x00000000),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ));

  static const BottomNavigationBarThemeData norBottomBarTheme =
      BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    unselectedItemColor: Color(0xff9497A0),
    selectedItemColor: Color(0xff444854),
  );
  static const BottomNavigationBarThemeData darkBottomBarTheme =
      BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    unselectedItemColor: Color(0xff444854),
    selectedItemColor: Color(0xff9497A0),
  );

  //normal
  static final ThemeData norTheme = ThemeData(
      primarySwatch: norPrimarySwatch,
      primaryColor: const Color(0xFFFF0000),
      splashColor: const Color(0x00000000), //去除点击tab时的水波纹动画
      appBarTheme: norAppBarTheme,
      bottomNavigationBarTheme: norBottomBarTheme);

  //dark
  static final ThemeData darkTheme = ThemeData(
    primarySwatch: darkPrimarySwatch,
    primaryColor: const Color(0xFFFF0000),
    splashColor: const Color(0x00000000), //去除点击tab时的水波纹动画
    appBarTheme: darkAppBarTheme,
    bottomNavigationBarTheme: darkBottomBarTheme,
  );
}

class LBColors {
  static const Color main = Color(0xFF097BEF);
  static const Color title = Color(0xFF333333);
  static const Color subtitle = Color(0xFF888888);
  static const Color line = Color(0xFFF9F9F9);
  static const Color c_ce5c3c = Color(0xFFCE5C3C);
}
