import 'package:flutter/material.dart';
import 'package:luobo_project/const/app_theme.dart';
import 'package:luobo_project/generated/l10n.dart';

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
        title: Text(S.of(context).storage),
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
    children.add(StorageDataItemView(
      title: S.current.storageData,
      map: {
        S.current.inStorage: 0,
        S.current.outStorage: 0,
        S.current.inventory: 0
      },
    ));
    children.add(StorageDataItemView(
      title: S.current.logistisData,
      map: {S.current.doing: 0, S.current.finish: 0},
    ));

    const images = [
      "storage_ic_in.png",
      "storage_ic_out.png",
      "storage_ic_logistics.png",
      "storage_ic_monitor.png"
    ];
    final titles = [
      S.current.inStorageApply,
      S.current.outStorageApply,
      S.current.applyTransport,
      S.current.monitor
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

class StorageDataItemView extends StatelessWidget {
  final String? title;
  final Map<String, int>? map;
  const StorageDataItemView({Key? key, this.title, this.map}) : super(key: key);

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
              children: (map ?? {}).keys.map((e) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width / 3.0,
                  child: StorageMenuItem(
                    number: map?[e],
                    title: e,
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
                fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          title ?? "",
          style: const TextStyle(
              fontSize: 13,
              color: Color.fromARGB(153, 255, 255, 255),
              fontWeight: FontWeight.bold),
        )
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
                    fontWeight: FontWeight.bold,
                    color: LBColors.title)),
          ],
        ),
      ),
    );
  }
}
