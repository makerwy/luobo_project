import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luobo_project/const/app_theme.dart';
import 'package:luobo_project/generated/locales.g.dart';
import 'package:luobo_project/utils/screen.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  TextEditingController? _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          TextButton(
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent)),
              onPressed: () {
                debugPrint(LocaleKeys.forget_password.tr);
              },
              child: Text(
                LocaleKeys.forget_password.tr,
                style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF584096),
                    fontWeight: FontWeight.normal),
              ))
        ],
      ),
      body: _builderView(context),
    );
  }

  _builderView(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // color: Colors.red,
        height: Screen.height -
            Screen.top -
            Screen.bottom -
            Screen.navigationHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Image.asset("assets/images/login_ic_logo.png"),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(55, 30, 55, 0),
                  child: TextField(
                    controller: _controller,
                    cursorColor: Colors.blue,
                    keyboardType: TextInputType.phone,
                    maxLength: 11,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: LocaleKeys.phone.tr,
                      hintStyle: const TextStyle(fontSize: 14),
                      // border: InputBorder.none,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffeeeeee), width: 0.5),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffeeeeee), width: 0.5),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(55, 0, 55, 0),
                  child: TextField(
                    controller: _controller,
                    cursorColor: Colors.blue,
                    decoration: InputDecoration(
                      hintText: LocaleKeys.input_password.tr,
                      hintStyle: const TextStyle(fontSize: 14),
                      // border: InputBorder.none,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffeeeeee), width: 0.5),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffeeeeee), width: 0.5),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(55, 30, 55, 0),
                  width: MediaQuery.of(context).size.width - 55 * 2,
                  height: 40,
                  child: TextButton(
                    // clipBehavior: Clip.antiAlias,
                    onPressed: () {},
                    child: Text(LocaleKeys.login.tr),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width - 55 * 2,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(LocaleKeys.checkcode_login.tr),
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            minimumSize:
                                MaterialStateProperty.all(const Size(0, 0)),
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            textStyle: MaterialStateProperty.all(
                              const TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(LocaleKeys.register.tr),
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(LBColors.subtitle),
                            minimumSize:
                                MaterialStateProperty.all(const Size(0, 0)),
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            textStyle: MaterialStateProperty.all(
                              const TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  height: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.other_login.tr,
                        style: const TextStyle(
                            color: LBColors.subtitle, fontSize: 14),
                      ),
                      SizedBox(
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/images/login_ic_apple.png"),
                            Image.asset("assets/images/login_ic_wechat.png"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            GetBuilder<LoginController>(builder: (controller) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: controller.changeReadingState,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(controller.isReadingProtocol
                            ? "assets/images/login_ic_select.png"
                            : "assets/images/login_ic_unselect.png")),
                  ),
                  Text.rich(
                    TextSpan(
                      text: LocaleKeys.login_protocol.tr,
                      style:
                          const TextStyle(color: LBColors.title, fontSize: 12),
                      children: [
                        TextSpan(
                            text: LocaleKeys.login_private_protocol.tr,
                            style: const TextStyle(
                                color: LBColors.subtitle, fontSize: 12),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                debugPrint(
                                    LocaleKeys.login_private_protocol.tr);
                              }),
                        TextSpan(
                          text: LocaleKeys.login_service_protocol.tr,
                          style: const TextStyle(
                              color: LBColors.subtitle, fontSize: 12),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              debugPrint(LocaleKeys.login_service_protocol.tr);
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
