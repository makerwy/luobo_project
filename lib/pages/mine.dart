import 'package:flutter/material.dart';
import 'package:luobo_project/const/app_theme.dart';
import 'package:luobo_project/generated/l10n.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text(S.of(context).mine),
      // ),
      body: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const MineHeaderView(),
              MineMenuView(
                title: S.current.myOrder,
                map: {
                  S.current.totalOrder: "assets/images/order_ic_all.png",
                  S.current.waitdeliver: "assets/images/order_ic_wait.png",
                  S.current.delivered: "assets/images/order_ic_fahuo.png",
                  S.current.signed: "assets/images/order_ic_sign.png"
                },
              ),
              MineMenuView(
                title: S.current.myService,
                map: {
                  S.current.myAssets: "assets/images/mine_ic_zichang.png",
                  S.current.contact: "assets/images/mine_ic_kefu.png",
                  S.current.settings: "assets/images/mine_ic_private.png",
                  S.current.aboutUs: "assets/images/mine_ic_us.png",
                  S.current.logout: "assets/images/mine_ic_logout.png",
                  S.current.exit: "assets/images/mine_ic_exit.png"
                },
              ),
            ],
          ),
        ),
      ),
    );
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.red,
                radius: 30,
                backgroundImage:
                    NetworkImage("https://picsum.photos/id/237/200/200"),
                // child: Image.network(
                //   "https://picsum.photos/id/237/200/200",
                //   fit: BoxFit.fitWidth,
                // ),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "wangyang",
                    style: TextStyle(
                        fontSize: 19,
                        color: LBColors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    S.current.check,
                    style: const TextStyle(fontSize: 14, color: LBColors.white),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: LBColors.white,
                    size: 13,
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class MineMenuView extends StatelessWidget {
  final String title;
  final Map<String, String> map;
  const MineMenuView({Key? key, required this.title, required this.map})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: const Color(0xFFF9F9F9),
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
          children: map.keys.map((e) {
            return SizedBox(
              width: MediaQuery.of(context).size.width / 4.0,
              height: 80,
              child: MineMenuItem(
                title: e,
                asset: map[e] ?? "",
                // color: Colors.red,
              ),
            );
          }).toList(),
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
