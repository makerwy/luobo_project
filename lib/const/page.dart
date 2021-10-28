import 'package:flutter/material.dart';

class Page {
  String title;
  WidgetBuilder builder;
  Page(this.title, Widget child) : builder = ((_) => child);
  Page.builder(this.title, this.builder);

  Widget build(BuildContext context) {
    Widget widget = builder(context);
    return widget;
  }

  Future<T?> openPage<T>(BuildContext context) {
    return Navigator.push(context, MaterialPageRoute(builder: build));
  }
}
