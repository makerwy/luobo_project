import 'package:get/get.dart';

import '../controllers/mall_controller.dart';

class MallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MallController>(
      () => MallController(),
    );
  }
}
