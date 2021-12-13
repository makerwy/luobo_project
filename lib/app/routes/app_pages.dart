import 'package:get/get.dart';

import '../modules/display_html/bindings/display_html_binding.dart';
import '../modules/display_html/views/display_html_view.dart';
import '../modules/forgetpsw/bindings/forgetpsw_binding.dart';
import '../modules/forgetpsw/views/forgetpsw_view.dart';
import '../modules/goods_detail/bindings/goods_detail_binding.dart';
import '../modules/goods_detail/views/goods_detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/mall/bindings/mall_binding.dart';
import '../modules/mall/views/mall_view.dart';
import '../modules/mine/about/bindings/about_binding.dart';
import '../modules/mine/about/views/about_view.dart';
import '../modules/mine/bindings/mine_binding.dart';
import '../modules/mine/views/mine_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/service/bindings/service_binding.dart';
import '../modules/service/views/service_view.dart';
import '../modules/storage/bindings/storage_binding.dart';
import '../modules/storage/views/storage_view.dart';
import '../modules/tab/bindings/tab_binding.dart';
import '../modules/tab/views/tab_view.dart';
import '../modules/waybill/bindings/waybill_binding.dart';
import '../modules/waybill/views/waybill_view.dart';

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
      name: _Paths.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.register,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.forgetpsw,
      page: () => const ForgetpswView(),
      binding: ForgetpswBinding(),
    ),
    GetPage(
        name: _Paths.mine,
        page: () => const MineView(),
        binding: MineBinding(),
        children: [
          GetPage(
            name: _Paths.about,
            page: () => AboutView(),
            binding: AboutBinding(),
          ),
        ]),
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
      bindings: [
        TabBinding(),
        HomeBinding(),
      ],
    ),
    GetPage(
      name: _Paths.service,
      page: () => ServiceView(),
      binding: ServiceBinding(),
    ),
    GetPage(
      name: _Paths.DISPLAY_HTML,
      page: () => DisplayHtmlView(),
      binding: DisplayHtmlBinding(),
    ),
  ];
}
