import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DisplayHtmlController extends GetxController {
  WebViewController? webViewController;
  String? title;

  getTitle() async {
    title = await webViewController?.getTitle();
    update();
  }
}
