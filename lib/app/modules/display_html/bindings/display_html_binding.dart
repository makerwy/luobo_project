import 'package:get/get.dart';

import '../controllers/display_html_controller.dart';

class DisplayHtmlBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DisplayHtmlController>(
      () => DisplayHtmlController(),
    );
  }
}
