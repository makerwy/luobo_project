import 'package:get/get.dart';

import 'package:luobo_project/app/modules/forgetpsw/bindings/forgetpsw_binding.dart';
import 'package:luobo_project/app/modules/forgetpsw/views/forgetpsw_view.dart';
import 'package:luobo_project/app/modules/goods_detail/bindings/goods_detail_binding.dart';
import 'package:luobo_project/app/modules/goods_detail/views/goods_detail_view.dart';
import 'package:luobo_project/app/modules/home/bindings/home_binding.dart';
import 'package:luobo_project/app/modules/home/views/home_view.dart';
import 'package:luobo_project/app/modules/login/bindings/login_binding.dart';
import 'package:luobo_project/app/modules/login/views/login_view.dart';
import 'package:luobo_project/app/modules/mall/bindings/mall_binding.dart';
import 'package:luobo_project/app/modules/mall/views/mall_view.dart';
import 'package:luobo_project/app/modules/mine/bindings/mine_binding.dart';
import 'package:luobo_project/app/modules/mine/views/mine_view.dart';
import 'package:luobo_project/app/modules/register/bindings/register_binding.dart';
import 'package:luobo_project/app/modules/register/views/register_view.dart';
import 'package:luobo_project/app/modules/storage/bindings/storage_binding.dart';
import 'package:luobo_project/app/modules/storage/views/storage_view.dart';
import 'package:luobo_project/app/modules/tab/bindings/tab_binding.dart';
import 'package:luobo_project/app/modules/tab/views/tab_view.dart';
import 'package:luobo_project/app/modules/waybill/bindings/waybill_binding.dart';
import 'package:luobo_project/app/modules/waybill/views/waybill_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.tab;

  static final routes = [
    GetPage(
      name: _Paths.waybill,
      page: () => const WaybillView(),
      binding: WaybillBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.root,
      page: () => const TabView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.register,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.forgetpsw,
      page: () => ForgetpswView(),
      binding: ForgetpswBinding(),
    ),
    GetPage(
      name: _Paths.mine,
      page: () => const MineView(),
      binding: MineBinding(),
    ),
    GetPage(
      name: _Paths.mall,
      page: () => const MallView(),
      binding: MallBinding(),
    ),
    GetPage(
      name: _Paths.storage,
      page: () => const StorageView(),
      binding: StorageBinding(),
    ),
    GetPage(
      name: _Paths.goodsDetail,
      page: () => const GoodsDetailView(),
      binding: GoodsDetailBinding(),
    ),
    GetPage(
      name: _Paths.tab,
      page: () => const TabView(),
      binding: TabBinding(),
    ),
  ];
}
