import 'package:get/get.dart';

import 'package:luobo_project/app/modules/forgetpsw/bindings/forgetpsw_binding.dart';
import 'package:luobo_project/app/modules/forgetpsw/views/forgetpsw_view.dart';
import 'package:luobo_project/app/modules/home/bindings/home_binding.dart';
import 'package:luobo_project/app/modules/home/views/home_view.dart';
import 'package:luobo_project/app/modules/login/bindings/login_binding.dart';
import 'package:luobo_project/app/modules/login/views/login_view.dart';
import 'package:luobo_project/app/modules/register/bindings/register_binding.dart';
import 'package:luobo_project/app/modules/register/bindings/register_binding.dart';
import 'package:luobo_project/app/modules/register/views/register_view.dart';
import 'package:luobo_project/app/modules/register/views/register_view.dart';
import 'package:luobo_project/app/modules/waybill/bindings/waybill_binding.dart';
import 'package:luobo_project/app/modules/waybill/views/waybill_view.dart';
import 'package:luobo_project/main.dart';
import 'package:luobo_project/pages/goods_detail.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.root;

  static final routes = [
    GetPage(
      name: _Paths.waybill,
      page: () => const WaybillView(),
      binding: WaybillBinding(),
    ),
    GetPage(
      name: _Paths.goodsdetail,
      page: () => const GoodsDetailPage(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.root,
      page: () => const TabPage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.register,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.FORGETPSW,
      page: () => ForgetpswView(),
      binding: ForgetpswBinding(),
    ),
  ];
}
