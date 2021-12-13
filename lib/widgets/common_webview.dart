import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CommonWebView extends StatelessWidget {
  CommonWebView({Key? key, this.initialUrl}) : super(key: key);
  WebViewController? _webViewController;
  String? initialUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: WebView(
        initialUrl: initialUrl,
        onWebViewCreated: (webViewController) {
          _webViewController = webViewController;
        },
        onPageStarted: (url) {},
        onPageFinished: (url) {},
      ),
    );
  }

  Future<String?> getTitle() async {
    var title = await _webViewController?.getTitle();
    return title;
  }
}
