import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luobo_project/app/modules/waybill/controllers/waybill_controller.dart';

class WaybillView extends StatefulWidget {
  const WaybillView({Key? key}) : super(key: key);
  @override
  _WaybillViewState createState() => _WaybillViewState();
}

class _WaybillViewState extends State<WaybillView>
    with TickerProviderStateMixin {
  TabController? _controller;
  var categoryList = ["进行中", "已完成", "全部"];

  int count = Get.find<WaybillController>().count;

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: 3, vsync: this);
    if (Get.arguments != null) {
      int index = Get.arguments;
      _controller?.index = index;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('waybill_list'.tr),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    spreadRadius: 2,
                    color: Colors.black12,
                  ),
                ],
              ),
              height: 40,
              child: LBTabBar(
                tabs: categoryList,
                controller: _controller,
              ),
            ),
            Expanded(
              child: TabBarView(
                  controller: _controller,
                  children: categoryList.map((tab) {
                    return Container(
                        // color: Colors.red,
                        child: Center(
                            child: Text(tab,
                                style: const TextStyle(fontSize: 25))));
                  }).toList()),
            ),
          ],
        ),
      ),
    );
  }
}

class LBTabBar extends StatelessWidget {
  final List<String> tabs;
  TabController? controller;

  LBTabBar({Key? key, required this.tabs, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Color(int.parse("0xFF097BEF")),
      unselectedLabelColor: Color(int.parse("0xFF0F0F0F")),
      // isScrollable: true,
      indicatorColor: Colors.blue,
      indicatorSize: TabBarIndicatorSize.label,
      // indicator: const BoxDecoration(
      //   color: Colors.yellow,
      //   border: BoxBorder()
      // ),
      // indicator: UnderlineIndicator(
      //     strokeCap: StrokeCap.round,
      //     borderSide: BorderSide(color: primary, width: 3),
      //     insets: EdgeInsets.only(left: 15, right: 15)),
      tabs: tabs.map((e) {
        return Tab(
            child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text(
                  e,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                )));
      }).toList(),
      controller: controller,
    );
  }
}
