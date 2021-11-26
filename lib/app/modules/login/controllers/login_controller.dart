import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:luobo_project/app/routes/app_pages.dart';

class LoginController extends GetxController {
  bool isReadingProtocol = false;

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

  void changeReadingState() {
    isReadingProtocol = !isReadingProtocol;
    update();
  }

  void toRegisterPage() => Get.toNamed(Routes.register);
  void toForgetpswPage() => Get.toNamed(Routes.forgetpsw);
}
