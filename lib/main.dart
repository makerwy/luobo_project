import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:luobo_project/const/routers.dart';
import 'package:luobo_project/generated/l10n.dart';
import 'package:luobo_project/network/http.dart';
import 'package:luobo_project/utils/api.dart';
import 'package:luobo_project/utils/local_cache.dart';
import 'package:luobo_project/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';

import 'const/tabbar_config.dart';
import 'const/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocalCache().init();
    Http.init(baseUrl: Api.baseUrl, headers: {
      "version": "1.0.0",
      "app_id": "100",
      "app_platform": "iPhone7,1",
      "referer": "luobotech.com"
    });

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: AppTheme.norTheme,
        darkTheme: AppTheme.darkTheme,
        // home: const TabPage(),
        initialRoute: RouterNames.root,
        routes: Routers.routers,
        builder: EasyLoading.init(),
      ),
    );
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
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
