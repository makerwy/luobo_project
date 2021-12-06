import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:luobo_project/app/modules/home/views/home_view.dart';
import 'package:luobo_project/app/modules/mall/views/mall_view.dart';
import 'package:luobo_project/app/modules/mine/views/mine_view.dart';
import 'package:luobo_project/app/modules/storage/views/storage_view.dart';
import 'package:luobo_project/generated/locales.g.dart';

class Tabbar {
  static const List<Widget> pages = [
    HomeView(),
    StorageView(),
    MallView(),
    MineView(),
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
