import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:luobo_project/generated/locales.g.dart';
import '../pages/home/home.dart';
import '/pages/mall.dart';
import '/pages/mine.dart';
import '/pages/storage.dart';

class Tabbar {
  static const List<Widget> pages = [
    HomePage(),
    StoragePage(),
    MallPage(),
    MinePage()
  ];
  static final items = ["home", "finance", "mall", "my"].map((e) {
    String label = "";
    switch (e) {
      case "home":
        label = LocaleKeys.home.tr;
        break;
      case "finance":
        label = LocaleKeys.storage.tr;
        break;
      case "mall":
        label = LocaleKeys.mall.tr;
        break;
      case "my":
        label = LocaleKeys.mine.tr;
        break;
      default:
    }
    return BottomNavigationBarItem(
        label: label, icon: loadNormalImage(e), activeIcon: loadSelectImage(e));
  }).toList();

  // [
  //   BottomNavigationBarItem(
  //       label: S.current.home,
  //       icon: loadNormalImage("home"),
  //       activeIcon: loadSelectImage("home")),
  //   BottomNavigationBarItem(
  //       label: S.current.storage,
  //       icon: loadNormalImage("finance"),
  //       activeIcon: loadSelectImage("finance")),
  //   BottomNavigationBarItem(
  //       label: S.current.mall,
  //       icon: loadNormalImage("mall"),
  //       activeIcon: loadSelectImage("mall")),
  //   BottomNavigationBarItem(
  //       label: S.current.mine,
  //       icon: loadNormalImage("my"),
  //       activeIcon: loadSelectImage("my")),
  // ];

  static Widget loadNormalImage(String name) {
    //gaplessPlayback 原图片保持不变，直到图片加载完成时替换图片，这样就不会出现闪烁
    return Image.asset("assets/images/tab_${name}_n.png",
        gaplessPlayback: true);
  }

  static Widget loadSelectImage(String name) {
    return Image.asset("assets/images/tab_${name}_s.png",
        gaplessPlayback: true);
  }
}
