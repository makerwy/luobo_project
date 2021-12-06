import 'package:get/get.dart';
import 'package:luobo_project/model/user_info.dart';

import '../controllers/mine_controller.dart';

class MineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MineController>(
      () => MineController(),
    );
    Get.lazyPut<UserInfo>(() => UserInfo.getInstance());
  }
}
