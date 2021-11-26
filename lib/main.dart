import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:luobo_project/app/routes/app_pages.dart';
import 'package:luobo_project/generated/locales.g.dart';
import 'package:luobo_project/network/http.dart';
import 'package:luobo_project/utils/api.dart';
import 'package:luobo_project/utils/local_cache.dart';
import 'package:luobo_project/utils/screen.dart';
import 'package:luobo_project/utils/utils.dart';

import 'const/tabbar_config.dart';
import 'const/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocalCache.preInit();
    Http.init(baseUrl: Api.baseUrl, headers: {
      "version": "1.0.0",
      "app_id": "100",
      "app_platform": "iPhone7,1",
      "referer": "luobotech.com"
    });

    return GetMaterialApp(
      // localizationsDelegates: const [
      //   S.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate
      // ],
      // supportedLocales: S.delegate.supportedLocales,
      theme: AppTheme.norTheme,
      darkTheme: AppTheme.darkTheme,
      // home: const TabPage(),
      initialRoute: AppPages.initial,
      // initialBinding: HomeBinding(),
      getPages: AppPages.routes,
      locale: window.locale,
      translationsKeys: AppTranslation.translations,
      localeListResolutionCallback: (locales, supportedLocales) {
        debugPrint('当前系统语言环境:$locales');
        debugPrint('当前系统支持语言环境:$supportedLocales');
        return;
      },
      // routes: Routers.routers,
      // builder: (ctx, child) => GestureDetector(
      //   // Global GestureDetector that will dismiss the keyboard
      //   onTap: () {
      //     hideKeyboard(context);
      //   },
      //   child: Text("data"),
      // ),
      builder: EasyLoading.init(
          builder: (ctx, child) => GestureDetector(
                // Global GestureDetector that will dismiss the keyboard
                onTap: () {
                  hideKeyboard(context);
                },
                child: child,
              )),
    );
  }
}

void hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Screen.preInit(context);
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: Tabbar.pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 12,
        selectedFontSize: 12,
        //在全局的主题配置中配置后 这里再配置会覆盖全局的配置
        // unselectedItemColor: const Color(0xff9497A0),
        // selectedItemColor: const Color(0xff444854),
        type: BottomNavigationBarType.fixed,
        enableFeedback: false,
        items: Tabbar.items,
        currentIndex: _currentIndex,
        onTap: (index) {
          if (Utils.isLogin()) {
            setState(() {
              _currentIndex = index;
            });
          } else {
            Get.toNamed(Routes.login);
          }
        },
      ),
    );
  }
}
