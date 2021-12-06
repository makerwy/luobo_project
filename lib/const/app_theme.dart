//主题设置
import 'package:flutter/material.dart';

class AppTheme {
  static const double bodyFontSize = 14.0;
  static const double smallFontSize = 10.0;
  static const double normalFontSize = 16.0;
  static const double largeFontSize = 20.0;

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
      backgroundColor: LBColors.white,
      shadowColor: LBColors.clear,
      titleTextStyle: TextStyle(
        color: LBColors.black,
        fontSize: normalFontSize,
        fontWeight: FontWeight.w500,
      ));
  static const AppBarTheme darkAppBarTheme = AppBarTheme(
      backgroundColor: LBColors.black,
      shadowColor: LBColors.clear,
      titleTextStyle: TextStyle(
        color: LBColors.white,
        fontSize: normalFontSize,
        fontWeight: FontWeight.w500,
      ));

  static const BottomNavigationBarThemeData norBottomBarTheme =
      BottomNavigationBarThemeData(
    backgroundColor: LBColors.white,
    unselectedItemColor: Color(0xff9497A0),
    selectedItemColor: Color(0xff444854),
  );
  static const BottomNavigationBarThemeData darkBottomBarTheme =
      BottomNavigationBarThemeData(
    backgroundColor: LBColors.black,
    unselectedItemColor: Color(0xff444854),
    selectedItemColor: Color(0xff9497A0),
  );

  //normal
  static final ThemeData norTheme = ThemeData(
    brightness: Brightness.light,
    // primarySwatch: norPrimarySwatch,
    primaryColor: LBColors.main,
    splashColor: LBColors.clear, //全局去除按钮点击时的水波纹动画
    highlightColor: LBColors.clear, //全局去除按钮点击时的水波纹动画
    scaffoldBackgroundColor: LBColors.view,
    appBarTheme: norAppBarTheme,
    bottomNavigationBarTheme: norBottomBarTheme,
    textButtonTheme: TextButtonThemeData(
      style: _buildButtonStyle(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: _buildButtonStyle(),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: _buildButtonStyle(),
    ),
  );

  static ButtonStyle _buildButtonStyle() {
    return ButtonStyle(
      overlayColor: MaterialStateProperty.all(LBColors.clear),
    );
  }

  //dark
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    // primarySwatch: darkPrimarySwatch,
    primaryColor: LBColors.main,
    splashColor: LBColors.clear, //全局去除按钮点击时的水波纹动画
    highlightColor: LBColors.clear, //全局去除按钮点击时的水波纹动画
    scaffoldBackgroundColor: LBColors.view,
    appBarTheme: darkAppBarTheme,
    bottomNavigationBarTheme: darkBottomBarTheme,
    textButtonTheme: TextButtonThemeData(
      style: _buildButtonStyle(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: _buildButtonStyle(),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: _buildButtonStyle(),
    ),
  );
}

extension LBColors on Colors {
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color clear = Colors.transparent;

  static const Color main = Color(0xFF097BEF);
  static const Color view = Color(0xFFF9F9F9);
  static const Color title = Color(0xFF333333);
  static const Color subtitle = Color(0xFF666666);
  static const Color subhead = Color(0xFF999999);
  static const Color line = Color(0xFFEEEEEE);
}
