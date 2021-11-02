import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:luobo_project/const/app_theme.dart';
import 'package:luobo_project/widgets/swiper.dart';
import 'package:url_launcher/url_launcher.dart';

class GoodsDetailPage extends StatelessWidget {
  const GoodsDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Text('商品详情'),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )),
      body: GoodsDetailContent(),
    );
  }
}

class GoodsDetailContent extends StatelessWidget {
  GoodsDetailContent({Key? key}) : super(key: key);

  final images = [
    "https://picsum.photos/375/380?random=101",
    "https://picsum.photos/375/280?random=200",
    "https://picsum.photos/375/280?random=300",
    "https://picsum.photos/375/280?random=400"
  ]
      .map((e) => GestureDetector(
            // child: Image.network(e, fit: BoxFit.fill),
            child: CachedNetworkImage(
              imageUrl: e,
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
              debugPrint(e);
            },
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 375 / 280,
                child: Swiper(
                  children: images,
                  indicator: CircleSwiperIndicator(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: SizedBox(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "保时捷718  2020款  Boxster  2.0T",
                      style: TextStyle(
                          fontSize: 17,
                          color: LBColors.title,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 7.5,
                thickness: 7.5,
                color: LBColors.line,
              ),
              SizedBox(
                height: 48,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Icon(
                              Icons.business,
                              color: LBColors.main,
                              size: 16,
                            ),
                          ),
                          Text("杭州萝泊贸易有限公司",
                              style: TextStyle(
                                  fontSize: 14, color: LBColors.title)),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: LBColors.subtitle,
                        size: 11,
                      )
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 7.5,
                thickness: 7.5,
                color: LBColors.line,
              ),
              const SizedBox(
                height: 40,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "商品详情",
                      style: TextStyle(
                          fontSize: 14,
                          color: LBColors.title,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              const GoodsDetailItem(
                title: "价格",
                content: "¥69.81万",
              ),
              const GoodsDetailItem(
                title: "规格",
                content: "2020款  Boxster  2.0T",
              ),
              const GoodsDetailItem(
                title: "颜色",
                content: "黑色",
              ),
              const GoodsDetailItem(
                title: "车规",
                content: "中规",
              ),
              const Divider(
                thickness: 80,
                height: 80,
                color: LBColors.clear,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(LBColors.main),
              // shape: MaterialStateProperty.all(const StadiumBorder(
              //   side:
              //       BorderSide(style: BorderStyle.solid, color: LBColors.main),
              // )),
              minimumSize: MaterialStateProperty.all(const Size(280, 40)),
              //点击水波纹颜色
              // overlayColor: MaterialStateProperty.all(const Color(0x00000000)),
              //设置边框
              // side: MaterialStateProperty.all(const BorderSide()),
              //外边框装饰 会覆盖 side 配置的样式
              //StadiumBorder两端半圆的边框
              //CircleBorder圆形边框
              //RoundedRectangleBorder圆角矩形边框
              //BeveledRectangleBorder带斜角的长方形边框
              shape: MaterialStateProperty.all(const StadiumBorder()),
              //设置阴影
              elevation: MaterialStateProperty.all(10),
            ),
            onPressed: () {
              launch("tel://13516829309");
            },
            child: const Text("电话咨询"),
          ),
        )
      ],
      alignment: Alignment.bottomCenter,
    );
  }
}

class GoodsDetailItem extends StatelessWidget {
  const GoodsDetailItem({Key? key, this.title, this.content}) : super(key: key);

  final String? title;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 60,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 70),
                child: Text(
                  title ?? "",
                  style:
                      const TextStyle(fontSize: 15, color: LBColors.subtitle),
                ),
              ),
              Text(
                content ?? "",
                style: const TextStyle(fontSize: 15, color: LBColors.title),
              ),
            ],
          ),
        ),
        const Divider(
          indent: 18,
          endIndent: 18,
          height: 2,
          thickness: 2,
          color: LBColors.line,
        )
      ],
    );
  }
}
