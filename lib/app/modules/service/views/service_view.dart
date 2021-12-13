import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/service_controller.dart';

class ServiceView extends GetView<ServiceController> {
  const ServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: GetBuilder<ServiceController>(builder: (controller) {
          return Text(controller.title ?? "");
        }),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: "https://www.luobotech.com/service.html",
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
