import 'package:get/get.dart';

import '../controllers/tab_controller.dart';

class TabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabPageController>(
      () => TabPageController(),

      ///fenix则是针对那些你不担心在页面变化之间丢失的服务，但当你需要该服务时，你希望它还活着。
      ///所以基本上，它会处理未使用的控制器/服务/类，但当你需要它时，它会 "从灰烬中重新创建 "一个新的实例。
      fenix: true,
    );
  }
}
