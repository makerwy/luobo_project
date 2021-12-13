import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/display_html_controller.dart';

class DisplayHtmlView extends GetView<DisplayHtmlController> {
  DisplayHtmlView({Key? key, this.url}) : super(key: key);

  String? url;

  @override
  Widget build(BuildContext context) {
    var params = Get.arguments;
    url = params;
    print(params);
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: GetBuilder<DisplayHtmlController>(builder: (controller) {
          return Text(controller.title ?? "");
        }),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: url,
        onWebViewCreated: (webViewController) {
          controller.webViewController = webViewController;
        },
        onPageStarted: (url) {},
        onPageFinished: (url) {
          controller.getTitle();
        },
      ),
    );
  }
}
