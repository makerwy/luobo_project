import 'package:flutter/material.dart';
import 'package:luobo_project/generated/l10n.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).home),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AspectRatio(
                  aspectRatio: 3,
                  child: Swiper(
                    children: images,
                    indicator: CircleSwiperIndicator(),
                  ),
                ),
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                //创建列表项
                return ListTile(
                  title: Text("$index"),
                  onTap: () => debugPrint('$index'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
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
