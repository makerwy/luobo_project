import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:luobo_project/app/modules/home/bindings/home_binding.dart';
import 'package:luobo_project/app/modules/home/views/home_view.dart';
import 'package:luobo_project/main.dart';
import 'package:luobo_project/pages/goods_detail.dart';

class Routers {
  static final Map<String, WidgetBuilder> routers = {
    RouterNames.root: (ctx) => const TabPage(),
    RouterNames.home: (ctx) => const HomeView(),
    RouterNames.goodsdetail: (ctx) => const GoodsDetailPage()
  };
  static final List<GetPage> getPages = [
    GetPage(
        name: RouterNames.root,
        page: () => const TabPage(),
        binding: HomeBinding()),
    GetPage(
        name: RouterNames.home,
        page: () => const HomeView(),
        binding: HomeBinding()),
    GetPage(name: RouterNames.goodsdetail, page: () => const GoodsDetailPage()),
  ];
}

class RouterNames {
  static const root = "/root";
  static const home = "/home";
  static const goodsdetail = "/goods/detail";
}
