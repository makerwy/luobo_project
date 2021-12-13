import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ServiceController extends GetxController {
  WebViewController? webViewController;
  String? title;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getTitle() async {
    title = await webViewController?.getTitle();
    update();
  }
}
