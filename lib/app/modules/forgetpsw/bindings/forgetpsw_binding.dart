import 'package:get/get.dart';

import '../controllers/forgetpsw_controller.dart';

class ForgetpswBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetpswController>(
      () => ForgetpswController(),
    );
  }
}
