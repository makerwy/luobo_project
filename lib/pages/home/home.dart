import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luobo_project/const/app_theme.dart';
import 'package:luobo_project/const/routers.dart';
import 'package:luobo_project/generated/locales.g.dart';
import 'package:luobo_project/model/home_banner_model.dart';
import 'package:luobo_project/model/home_list_model.dart';
import 'package:luobo_project/pages/home/home_controller.dart';
import 'package:luobo_project/utils/toast.dart';
import 'package:luobo_project/widgets/swiper.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(LocaleKeys.home.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          slivers: [
            GetBuilder<HomeController>(
                builder: (controller) => SliverToBoxAdapter(
                      child: HomeTopHeader(
                        banners: (controller.headerInfo?.banner ?? [])
                            .map((e) => GestureDetector(
                                  // child: Image.network(e, fit: BoxFit.fill),
                                  child: CachedNetworkImage(
                                    // imageUrl: e.picture ?? "",
                                    imageUrl:
                                        "https://picsum.photos/450/150?random=${Random().nextInt(200)}",
                                    fit: BoxFit.cover,
                                    placeholder: (ctx, r) {
                                      return const Center(
                                          child: SizedBox(
                                        child: CircularProgressIndicator(),
                                        width: 40,
                                      ));
                                    },
                                  ),
                                  onTap: () {
                                    // LBToast.showToast(msg: e);
                                    LBToast.showLoading();
                                  },
                                ))
                            .toList(),
                        kindList: controller.headerInfo?.brandList ?? [],
                      ),
                    )),
            GetBuilder<HomeController>(
              builder: (controller) => SliverList(
                // itemExtent: 50.0,
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    //创建列表项
                    return GestureDetector(
                      child:
                          HomeListItem(model: controller.recommendList?[index]),
                      onTap: () {
                        Get.toNamed(RouterNames.goodsdetail);
                        // Navigator.of(context)
                        //     .pushNamed(RouterNames.goodsdetail);
                      },
                    );
                    // return ListTile(
                    //   title: Text("$index"),
                    //   onTap: () => debugPrint('$index'),
                    // );
                  },
                  childCount: controller.recommendList?.length ?? 0,
                ),
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
  final List<HomeBanner> kindList;
  const HomeTopHeader({Key? key, required this.banners, required this.kindList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (banners.isEmpty && kindList.isEmpty) {
      return Container();
    }
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
                  fontWeight: FontWeight.w500,
                  color: LBColors.title),
            ),
          ),
        ),
      ],
    );
  }
}

class HomeKindMenu extends StatelessWidget {
  final List<HomeBanner> itemList;
  const HomeKindMenu({Key? key, required this.itemList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    for (var item in itemList) {
      Widget widget = Column(children: [
        CachedNetworkImage(
          // imageUrl: item.logoUrl ?? "",
          imageUrl: "https://picsum.photos/40",
          fit: BoxFit.cover,
          width: 27,
          height: 27,
          placeholder: (ctx, r) => Container(
            width: 27,
            height: 27,
            color: Colors.red,
          ),
        ),
        // Image.network(
        //   "https://picsum.photos/40",
        //   width: 27,
        //   height: 27,
        //   fit: BoxFit.cover,
        // ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(item.name ?? ""),
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
  final RecommendGoods? model;
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
              children: <Widget>[
                Expanded(
                  child: Text(
                    model?.name ?? "",
                    style: const TextStyle(color: LBColors.title, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                RichText(
                    text: TextSpan(
                        text: "${model?.price ?? 0}",
                        style: const TextStyle(
                            fontSize: 16, color: LBColors.c_ce5c3c),
                        children: const [
                      TextSpan(
                          text: "元",
                          style: TextStyle(
                              fontSize: 13, color: LBColors.c_ce5c3c)),
                    ])),
                // const Text("69.81万"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 7),
            child: SizedBox(
              child: Text(
                model?.skuName ?? "",
                style: const TextStyle(fontSize: 12, color: LBColors.title),
              ),
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: SizedBox(
              child: Text(
                model?.categoryName ?? "",
                style: const TextStyle(color: LBColors.subtitle, fontSize: 12),
              ),
              width: double.infinity,
            ),
          ),
          Offstage(
            offstage: model?.service == null,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: SizedBox(
                child: Text(
                  model?.service ?? "",
                  style:
                      const TextStyle(color: LBColors.subtitle, fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                width: double.infinity,
              ),
            ),
          ),
          const Divider(
            thickness: 2.0,
            height: 2.0,
            color: LBColors.line,
          ),
          SizedBox(
            child: Row(
              children: [
                Text(model?.merchantName ?? "",
                    style:
                        const TextStyle(color: LBColors.title, fontSize: 12)),
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
