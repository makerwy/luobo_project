import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luobo_project/app/routes/app_pages.dart';
import 'package:luobo_project/const/app_theme.dart';
import 'package:luobo_project/const/const.dart';
import 'package:luobo_project/const/typedef.dart';
import 'package:luobo_project/generated/locales.g.dart';
import 'package:luobo_project/model/user_info.dart';
import 'package:luobo_project/utils/local_cache.dart';
import '../controllers/mine_controller.dart';

class MineView extends GetView<MineController> {
  const MineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text(cLocaleKeys.mine.tr),
      // ),
      body: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const MineHeaderView(),
              MineMenuView(
                title: LocaleKeys.myOrder.tr,
                subtitles: [
                  LocaleKeys.totalOrder.tr,
                  LocaleKeys.waitdeliver.tr,
                  LocaleKeys.delivered.tr,
                  LocaleKeys.signed.tr
                ],
                assets: const [
                  "assets/images/order_ic_all.png",
                  "assets/images/order_ic_wait.png",
                  "assets/images/order_ic_fahuo.png",
                  "assets/images/order_ic_sign.png",
                ],
                onTap: (index) {
                  print(index);
                },
              ),
              MineMenuView(
                title: LocaleKeys.myService.tr,
                subtitles: [
                  LocaleKeys.myAssets.tr,
                  LocaleKeys.contact.tr,
                  LocaleKeys.settings.tr,
                  LocaleKeys.aboutUs.tr,
                  LocaleKeys.logout.tr,
                  LocaleKeys.exit.tr,
                ],
                assets: const [
                  "assets/images/mine_ic_zichang.png",
                  "assets/images/mine_ic_kefu.png",
                  "assets/images/mine_ic_private.png",
                  "assets/images/mine_ic_us.png",
                  "assets/images/mine_ic_logout.png",
                  "assets/images/mine_ic_exit.png",
                ],
                onTap: onTap,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTap(index) {
    switch (index) {
      case 5:
        LocalCache.getInstance().remove(Constant.ACCESS_TOKEN);
        Get.toNamed(Routes.login);
        break;
      default:
        break;
    }
  }
}

class MineHeaderView extends StatelessWidget {
  const MineHeaderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/bg_mine_page.png",
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 40,
          left: 20,
          right: 20,
          height: 60,
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // CachedNetworkImage(
                //   imageUrl: "https://cdn.luobotech.com/" +
                //       (UserInfo.getInstance().user.value?.signboard ?? ""),
                //   width: 60,
                //   height: 60,
                //   placeholder: (context, url) =>
                //       Image.asset(Constant.Default_Avatar),
                // ),
                Image.asset(Constant.Default_Avatar),
                // child: Image.network(
                //   "https://picsum.photos/id/237/200/200",
                //   fit: BoxFit.fitWidth,
                // ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      UserInfo.getInstance().user.value?.contactName ?? "",
                      style: const TextStyle(
                          fontSize: 19,
                          color: LBColors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Offstage(
                  offstage:
                      UserInfo.getInstance().user.value?.auditState != "agree",
                  child: Row(
                    children: [
                      Text(
                        LocaleKeys.check.tr,
                        style: const TextStyle(
                            fontSize: 14, color: LBColors.white),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: LBColors.white,
                        size: 13,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MineMenuView extends StatelessWidget {
  final String title;
  // final Map<String, String> map;
  final List<String> subtitles;
  final List<String> assets;
  final IndexCallBack? onTap;
  const MineMenuView(
      {Key? key,
      required this.title,
      required this.subtitles,
      required this.assets,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    for (var i = 0; i < subtitles.length; i++) {
      Widget widget = SizedBox(
        width: MediaQuery.of(context).size.width / 4.0,
        height: 80,
        child: InkWell(
          onTap: () {
            if (onTap != null) onTap!(i);
          },
          child: MineMenuItem(
            title: subtitles[i],
            asset: assets[i],
            // color: Colors.red,
          ),
        ),
      );
      children.add(widget);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: LBColors.view,
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: SizedBox(
              height: 40,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style:
                      const TextStyle(fontSize: 12, color: LBColors.subtitle),
                ),
              ),
            ),
          ),
        ),
        Wrap(
          children: children,
        )
      ],
    );
  }
}

class MineMenuItem extends StatelessWidget {
  final String title;
  final String asset;
  final Color? color;
  const MineMenuItem(
      {Key? key, required this.title, required this.asset, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              asset,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Text(
                title,
                style: const TextStyle(fontSize: 12, color: LBColors.subtitle),
              ),
            )
          ],
        ),
      ),
    );
  }
}
