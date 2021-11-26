import 'package:get/get.dart';

import '../controllers/waybill_controller.dart';

class WaybillBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaybillController>(
      () => WaybillController(),
    );
  }
}
