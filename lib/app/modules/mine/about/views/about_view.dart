import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:luobo_project/app/routes/app_pages.dart';
import 'package:luobo_project/const/app_theme.dart';
import 'package:luobo_project/const/const.dart';
import 'package:luobo_project/widgets/placeholder_divider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text('关于我们'),
        centerTitle: true,
      ),
      body: _buildContentView(),
    );
  }

  _buildContentView() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 90),
                child: Image.asset("assets/images/login_ic_logo.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: GetBuilder<AboutController>(
                  builder: (controller) {
                    return Text(
                      controller.appName ?? "",
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: GetBuilder<AboutController>(
                  builder: (controller) {
                    return Text(
                      "Version " + (controller.appVersion ?? ""),
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    );
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  launch(Constant.kAppStoreURL);
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 38, vertical: 28),
                  height: 45,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const LineDivider.line(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "版本更新",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                              color: LBColors.title,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: LBColors.subtitle,
                          ),
                        ],
                      ),
                      const LineDivider.line(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              _buildRichText("用户使用协议", () {
                Get.toNamed(Routes.DISPLAY_HTML, arguments: HTML.useragreement);
              }),
              _buildRichText("隐私保护政策", () {
                Get.toNamed(Routes.DISPLAY_HTML, arguments: HTML.policy);
              }),
              const Divider(
                thickness: 12,
                height: 12,
                color: LBColors.clear,
              ),
              const Text(
                "萝泊科技 版权所有",
                style: TextStyle(
                  fontSize: 12,
                  color: LBColors.subtitle,
                ),
              ),
              const PlaceholderDivider.space(height: 2),
              const Text(
                "copyright©️2020-2021Luobo.all rights reserved",
                style: TextStyle(
                  fontSize: 12,
                  color: LBColors.subtitle,
                ),
              ),
              const PlaceholderDivider.space(height: 25),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRichText(String content, VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      child: Text.rich(
        TextSpan(
          text: "《",
          style: const TextStyle(
            fontSize: 12,
            color: LBColors.subtitle,
          ),
          children: [
            TextSpan(
              text: content,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xff6885B0),
              ),
            ),
            const TextSpan(
              text: "》",
              style: TextStyle(
                fontSize: 12,
                color: LBColors.subtitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
