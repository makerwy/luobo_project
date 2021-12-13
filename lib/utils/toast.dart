import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LBToast {
  static void showToast({
    required String msg,
    Toast? toastLength,
    int timeInSecForIosWeb = 1,
    double? fontSize,
    ToastGravity? gravity = ToastGravity.CENTER,
    Color? backgroundColor,
    Color? textColor,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: toastLength,
      fontSize: fontSize,
      timeInSecForIosWeb: timeInSecForIosWeb,
      gravity: gravity,
      backgroundColor: backgroundColor,
      textColor: textColor,
    );
  }

  static void showLoading() {
    EasyLoading.show(status: "loading...", maskType: EasyLoadingMaskType.clear);
  }
}
