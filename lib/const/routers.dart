import 'package:flutter/material.dart';
import 'package:luobo_project/main.dart';
import 'package:luobo_project/pages/goos_detail.dart';
import 'package:luobo_project/pages/home.dart';

class Routers {
  static final Map<String, WidgetBuilder> routers = {
    RouterNames.root: (ctx) => const TabPage(),
    RouterNames.home: (ctx) => const HomePage(),
    RouterNames.goodsdetail: (ctx) => const GoodsDetailPage()
  };
}

class RouterNames {
  static const root = "/root";
  static const home = "/home";
  static const goodsdetail = "/goods/detail";
}
