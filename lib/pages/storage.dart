import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:luobo_project/app/routes/app_pages.dart';
import 'package:luobo_project/const/app_theme.dart';
import 'package:luobo_project/generated/locales.g.dart';

class StoragePage extends StatefulWidget {
  const StoragePage({Key? key}) : super(key: key);

  @override
  _StoragePageState createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.storage.tr),
      ),
      backgroundColor: LBColors.white,
      body: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/images/bg_storage_page.png",
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                  const StorageDataView()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StorageDataView extends StatelessWidget {
  const StorageDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    final list1 = [
      LocaleKeys.inStorage.tr,
      LocaleKeys.outStorage.tr,
      LocaleKeys.inventory.tr
    ];
    children.add(StorageDataItemView(
      title: LocaleKeys.storageData.tr,
      list: List.generate(list1.length, (index) {
        return StorageDataItemModel(
            index: index, title: list1[index], count: 0);
      }),
    ));
    final list2 = [LocaleKeys.doing.tr, LocaleKeys.finish.tr];
    children.add(StorageDataItemView(
      title: LocaleKeys.logistisData.tr,
      list: List.generate(list2.length, (index) {
        return StorageDataItemModel(
            index: index, title: list2[index], count: 0);
      }),
      onTap: (index) {
        Get.toNamed(Routes.waybill, arguments: index);
      },
    ));

    const images = [
      "storage_ic_in.png",
      "storage_ic_out.png",
      "storage_ic_logistics.png",
      "storage_ic_monitor.png"
    ];
    final titles = [
      LocaleKeys.inStorageApply.tr,
      LocaleKeys.outStorageApply.tr,
      LocaleKeys.applyTransport.tr,
      LocaleKeys.monitor.tr
    ];
    children.add(const Padding(padding: EdgeInsets.only(bottom: 15)));
    for (var i = 0; i < images.length; i++) {
      var widget = GestureDetector(
        onTap: () {
          debugPrint(titles[i]);
        },
        child: StorageCardMenuItem(
            title: titles[i], asset: "assets/images/${images[i]}"),
      );
      children.add(widget);
    }
    // children.add(const Padding(padding: EdgeInsets.only(bottom: 15)));

    return Column(
      children: children,
    );
  }
}

typedef GestureTapIndexCallback = void Function(int index);

class StorageDataItemModel {
  final int? index;
  final String? title;
  final int? count;
  const StorageDataItemModel({this.index, this.title, this.count});
}

class StorageDataItemView extends StatelessWidget {
  final String? title;
  final List<StorageDataItemModel>? list;
  final GestureTapIndexCallback? onTap;

  const StorageDataItemView({Key? key, this.title, this.list, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 60,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title ?? "",
                  style: const TextStyle(
                    fontSize: 17,
                    color: LBColors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: Wrap(
              // alignment: WrapAlignment.spaceBetween,
              children: (list ?? []).map((e) {
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    if (onTap != null) {
                      onTap!(e.index ?? 0);
                    }
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 3.0,
                    child: StorageMenuItem(
                      number: e.count,
                      title: e.title,
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}

class StorageMenuItem extends StatelessWidget {
  final int? number;
  final String? title;

  const StorageMenuItem({Key? key, this.number, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 7),
          child: Text(
            "${number ?? 0}",
            style: const TextStyle(
                fontSize: 18,
                color: LBColors.white,
                fontWeight: FontWeight.w500),
          ),
        ),
        Text(
          title ?? "",
          style: const TextStyle(
              fontSize: 13,
              color: Color.fromARGB(153, 255, 255, 255),
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class StorageCardMenuItem extends StatelessWidget {
  final String? title;
  final String? asset;
  const StorageCardMenuItem({Key? key, this.title, this.asset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      child: Container(
        color: const Color(0xFFF9F9F9),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 17),
              child: Image.asset(asset ?? ""),
            ),
            Text(title ?? "",
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: LBColors.title)),
          ],
        ),
      ),
    );
  }
}
