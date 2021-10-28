import 'package:flutter/material.dart';
import 'package:luobo_project/const/app_theme.dart';
import 'package:luobo_project/generated/l10n.dart';
import 'package:luobo_project/model/home_kind_model.dart';
import 'package:luobo_project/widgets/swiper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final images = [
    "https://picsum.photos/450/150?random=101",
    "https://picsum.photos/450/150?random=200",
    "https://picsum.photos/450/150?random=300",
    "https://picsum.photos/450/150?random=400"
  ]
      .map((e) => GestureDetector(
            child: Image.network(e, fit: BoxFit.fill),
            onTap: () {
              debugPrint(e);
            },
          ))
      .toList();

  final menus = ["奥迪", "奔驰", "本田", "大众", "丰田"]
      .map((e) => HomeKindModel("https://picsum.photos/40", e))
      .toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(S.of(context).home),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: HomeTopHeader(
                banners: images,
                kindList: menus,
              ),
            ),
            SliverList(
              // itemExtent: 50.0,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  //创建列表项
                  return HomeListItem(model: "$index");
                  // return ListTile(
                  //   title: Text("$index"),
                  //   onTap: () => debugPrint('$index'),
                  // );
                },
                childCount: 50,
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Text("move"),
      //   onPressed: () {
      //     setState(() {
      //       index = (index + 1) % 4;
      //     });
      //   },
      // ),
    );
  }
}

class HomeTopHeader extends StatelessWidget {
  final List<Widget> banners;
  final List<HomeKindModel> kindList;
  const HomeTopHeader({Key? key, required this.banners, required this.kindList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AspectRatio(
              aspectRatio: 3,
              child: Swiper(
                speed: 400,
                children: banners,
                indicator: CircleSwiperIndicator(),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: HomeKindMenu(itemList: kindList),
        ),
        const SizedBox(
          width: double.infinity,
          height: 50,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "推荐商品",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: LBColors.title),
            ),
          ),
        ),
      ],
    );
  }
}

class HomeKindMenu extends StatelessWidget {
  final List<HomeKindModel> itemList;
  const HomeKindMenu({Key? key, required this.itemList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    for (var item in itemList) {
      Widget widget = Column(children: [
        Image.network(
          "https://picsum.photos/40",
          width: 27,
          height: 27,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(item.name),
        )
      ]);
      children.add(widget);
    }

    children.add(Row(
      children: const [
        Text(
          "全部品牌",
          style: TextStyle(fontSize: 14, color: LBColors.subtitle),
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: 12,
        )
      ],
    ));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: children,
    );
  }
}

class HomeListItem extends StatelessWidget {
  final String? model;
  const HomeListItem({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Divider(
              height: 3.0,
              thickness: 3.0,
              color: LBColors.line,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Expanded(
                  child: Text(
                    "保时捷718  2020款  Boxster  2.0T 保时捷718  2020款  Boxster  2.0T 保时捷718  2020款  Boxster  2.0T",
                    style: TextStyle(color: LBColors.title, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text("69.81万"),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 7),
            child: SizedBox(
              child: Text(
                "中规期车",
                style: TextStyle(fontSize: 12, color: LBColors.subtitle),
              ),
              width: double.infinity,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: SizedBox(
              child: Text(
                "白色/波尔多红  |  售全国   |   国VI",
                style: TextStyle(color: LBColors.subtitle, fontSize: 12),
              ),
              width: double.infinity,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: SizedBox(
              child: Text(
                "彩标 助力转向 倒影 兔钥匙 Bose 电折后视镜  加热方向盘…",
                style: TextStyle(color: LBColors.subtitle, fontSize: 12),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              width: double.infinity,
            ),
          ),
          const Divider(
            thickness: 2.0,
            height: 2.0,
            color: LBColors.line,
          ),
          SizedBox(
            child: Row(
              children: const [
                Text("北京万通祥和贸易有限公司",
                    style: TextStyle(color: LBColors.title, fontSize: 12)),
              ],
            ),
            width: double.infinity,
            height: 38,
          ),
        ],
      ),
    );
  }
}
