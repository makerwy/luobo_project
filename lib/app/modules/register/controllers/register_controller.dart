import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luobo_project/app/routes/app_pages.dart';
import 'package:luobo_project/const/const.dart';
import 'package:luobo_project/network/http.dart';
import 'package:luobo_project/network/response.dart';
import 'package:luobo_project/utils/api.dart';
import 'package:luobo_project/utils/local_cache.dart';
import 'package:luobo_project/utils/toast.dart';

class RegisterController extends GetxController {
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
        queryParameters: {"type": "reg", "mobile": phone});
    if (response.isSuccess) {
      LBToast.showToast(msg: "验证码发送成功");
      startTimer();
    } else {
      LBToast.showToast(msg: response.errorMsg ?? "");
    }
    return response;
  }

  Future<RequestResponse?> requestRegister() async {
    var phone = phoneController?.text;
    if (phone == null || phone.isEmpty) {
      LBToast.showToast(msg: "请输入手机号码");
      return null;
    }
    var code = checkController?.text;
    if (code == null || code.isEmpty) {
      LBToast.showToast(msg: "请输入验证码");
      return null;
    }
    var password = pswController?.text;
    if (password == null || password.isEmpty) {
      LBToast.showToast(msg: "请输入密码");
      return null;
    }
    if (password.length < 6 || password.length > 16) {
      LBToast.showToast(msg: "请输入6-16位密码");
      return null;
    }

    RequestResponse response = await Http.post(
      RegisterApi.register,
      queryParameters: {
        "code": code,
        "mobile": phone,
        "password": password,
      },
    );
    if (response.isSuccess) {
      LBToast.showToast(msg: "账号注册成功");
      var token = response.data as String;
      LocalCache.getInstance().setString(Constant.ACCESS_TOKEN, token);
      //一直返回上一个页面 直到page == Routes.tab
      Get.until(ModalRoute.withName(Routes.tab));
      //push到下个页面 之前页面全部删除
      // Get.offAllNamed(Routes.tab);
    } else {
      LBToast.showToast(msg: response.errorMsg ?? "");
    }
    return response;
  }

  startTimer() {
    enable = false;
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
    enable = true;
    _timer?.cancel();
    _timer = null;
  }
}
