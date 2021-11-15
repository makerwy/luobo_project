import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luobo_project/const/app_theme.dart';
import 'package:luobo_project/generated/locales.g.dart';

class MallPage extends StatefulWidget {
  const MallPage({Key? key}) : super(key: key);

  @override
  _MallPageState createState() => _MallPageState();
}

class _MallPageState extends State<MallPage> {
  @override
  Widget build(BuildContext context) {
    var children = <Widget>[const _MallHeaderView()];
    const assets = [
      "assets/images/mall_ic_buyback.png",
      "assets/images/mall_ic_trade.png",
      "assets/images/mall_ic_finance.png",
      "assets/images/mall_ic_apply.png"
    ];
    final titles = [
      LocaleKeys.buybackOrder.tr,
      LocaleKeys.tradeOrder.tr,
      LocaleKeys.finace.tr,
      LocaleKeys.buybackApply.tr
    ];
    children.add(const SizedBox(
      height: 25,
    ));

    for (var i = 0; i < assets.length; i++) {
      Widget widget = Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 10),
        height: 60,
        color: LBColors.line,
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Image.asset(assets[i]),
              ),
              Text(
                titles[i],
                style: const TextStyle(
                    fontSize: 17,
                    color: LBColors.title,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      );
      children.add(widget);
    }

    return Scaffold(
        backgroundColor: LBColors.white,
        appBar: AppBar(
          title: Text(LocaleKeys.mall.tr),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: children,
          ),
        ));
  }
}

class _MallHeaderView extends StatelessWidget {
  const _MallHeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/bg_storage_page.png",
          height: 140,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 45),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _MallHeaderItem(
                  title: LocaleKeys.totalTrade.tr,
                  number: 0,
                ),
                _MallHeaderItem(
                  title: LocaleKeys.remainTrade.tr,
                  number: 0,
                ),
                _MallHeaderItem(
                  title: LocaleKeys.expireTrade.tr,
                  number: 0,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _MallHeaderItem extends StatelessWidget {
  final String title;
  final int number;
  const _MallHeaderItem({Key? key, required this.title, required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 15, color: LBColors.white),
        ),
        const SizedBox(height: 5),
        Text(
          "$number",
          style: const TextStyle(fontSize: 25, color: LBColors.white),
        ),
      ],
    );
  }
}
