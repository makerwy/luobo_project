import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:luobo_project/app/routes/app_pages.dart';
import 'package:luobo_project/const/app_theme.dart';
import 'package:luobo_project/generated/locales.g.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.register.tr),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: LBColors.black,
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildDiveider(),
          _buildChildContainer(
              child: TextField(
            controller: controller.phoneController,
            keyboardType: TextInputType.phone,
            maxLength: 11,
            decoration: InputDecoration(
              hintText: LocaleKeys.phone.tr,
              border: InputBorder.none,
              counterText: "",
            ),
          )),
          _buildDiveider(),
          _buildChildContainer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.checkController,
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: LocaleKeys.input_checkcode.tr,
                      border: InputBorder.none,
                      counterText: "",
                    ),
                  ),
                ),
                GetBuilder<RegisterController>(
                  builder: (controller) {
                    return TextButton(
                      onPressed:
                          controller.enable ? controller.requestSendCode : null,
                      child: controller.isCountdown
                          ? Text("${controller.senconds}s")
                          : Text(LocaleKeys.get_checkcode.tr),
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          _buildDiveider(),
          _buildChildContainer(
            child: TextField(
              controller: controller.pswController,
              obscureText: true,
              maxLength: 16,
              decoration: InputDecoration(
                hintText: LocaleKeys.input_password.tr,
                border: InputBorder.none,
                counterText: "",
              ),
            ),
          ),
          _buildDiveider(),
          _buildChildContainer(
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "密码必须是6-16位的数字、字符组合(不能是纯数字)",
                  style: TextStyle(
                    color: LBColors.subhead,
                    fontSize: 14,
                  ),
                ),
              ),
              height: 40,
              color: LBColors.clear),
          _buildTextButton(),
        ],
      ),
    );
  }

  Divider _buildDiveider() {
    return const Divider(
      thickness: 0.5,
      height: 0.5,
      color: LBColors.line,
    );
  }

  Container _buildChildContainer(
      {required Widget child,
      double height = 50,
      Color color = LBColors.white}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: height,
      color: color,
      child: child,
    );
  }

  Widget _buildTextButton() {
    return Container(
      width: 160,
      height: 44,
      margin: const EdgeInsets.only(top: 30),
      child: TextButton(
        onPressed: controller.requestRegister,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
          ),
        ),
        child: const Text(
          "完成",
          style: TextStyle(
            color: LBColors.white,
            fontSize: AppTheme.largeFontSize,
          ),
        ),
      ),
    );
  }
}
