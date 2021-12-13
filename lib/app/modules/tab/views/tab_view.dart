import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:luobo_project/app/routes/app_pages.dart';
import 'package:luobo_project/const/tabbar_config.dart';
import 'package:luobo_project/utils/screen.dart';
import 'package:luobo_project/utils/utils.dart';

import '../controllers/tab_controller.dart';

class TabView extends GetView<TabPageController> {
  const TabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Screen.preInit(context);
    return Scaffold(
      body: GetBuilder<TabPageController>(
        builder: (controller) {
          return IndexedStack(
            index: controller.currentIndex,
            children: Tabbar.pages,
          );
        },
      ),
      bottomNavigationBar: GetBuilder<TabPageController>(builder: (controller) {
        return BottomNavigationBar(
          unselectedFontSize: 12,
          selectedFontSize: 12,
          //在全局的主题配置中配置后 这里再配置会覆盖全局的配置
          // unselectedItemColor: const Color(0xff9497A0),
          // selectedItemColor: const Color(0xff444854),
          type: BottomNavigationBarType.fixed,
          enableFeedback: false,
          items: Tabbar.items,
          currentIndex: controller.currentIndex,
          onTap: (index) async {
            if (index > 0 && !await Utils.isLogin()) {
              Get.toNamed(Routes.login);
            } else {
              controller.changeIndex(index);
            }
          },
        );
      }),
    );
  }
}
