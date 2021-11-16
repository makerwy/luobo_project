import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:luobo_project/main.dart';
import 'package:luobo_project/pages/goods_detail.dart';
import 'package:luobo_project/pages/home/home.dart';
import 'package:luobo_project/pages/home/home_binding.dart';

class Routers {
  static final Map<String, WidgetBuilder> routers = {
    RouterNames.root: (ctx) => const TabPage(),
    RouterNames.home: (ctx) => const HomePage(),
    RouterNames.goodsdetail: (ctx) => const GoodsDetailPage()
  };
  static final List<GetPage> getPages = [
    GetPage(
        name: RouterNames.root,
        page: () => const TabPage(),
        binding: HomeBinding()),
    GetPage(
        name: RouterNames.home,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(name: RouterNames.goodsdetail, page: () => const GoodsDetailPage()),
  ];
}

class RouterNames {
  static const root = "/root";
  static const home = "/home";
  static const goodsdetail = "/goods/detail";
}
