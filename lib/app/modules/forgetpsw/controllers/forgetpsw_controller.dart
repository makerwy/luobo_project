import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luobo_project/network/http.dart';
import 'package:luobo_project/network/response.dart';
import 'package:luobo_project/utils/api.dart';
import 'package:luobo_project/utils/toast.dart';

class ForgetpswController extends GetxController {
  TextEditingController? phoneController;
  TextEditingController? checkController;
  TextEditingController? pswController;

  Timer? _timer;
  int senconds = 60;
  bool isCountdown = false;
  bool enable = true;

  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
    checkController = TextEditingController();
    pswController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    phoneController = null;
    checkController = null;
    pswController = null;
    cancelTimer();
    super.onClose();
  }

  Future<RequestResponse?> requestSendCode() async {
    var phone = phoneController?.text;
    if (phone == null || phone.isEmpty) {
      LBToast.showToast(msg: "请输入手机号码");
      return null;
    }
    RequestResponse response = await Http.post(LoginApi.sendMsg,
        queryParameters: {"type": "findPsw", "mobile": phone});
    if (response.isSuccess) {
      startTimer();
    }
    return response;
  }

  startTimer() {
    isCountdown = true;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        senconds--;
        if (senconds == 0) {
          cancelTimer();
        }
        update();
      },
    );
  }

  cancelTimer() {
    isCountdown = false;
    senconds = 60;
    _timer?.cancel();
    _timer = null;
  }
}
