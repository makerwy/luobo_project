import 'package:get/get.dart';
import 'package:package_info/package_info.dart';

class AboutController extends GetxController {
  String? appName;
  String? appVersion;
  @override
  void onInit() {
    super.onInit();
    getPackageInfo();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getPackageInfo() async {
    var packageInfo = await PackageInfo.fromPlatform();
    appName = packageInfo.appName;
    appVersion = packageInfo.version;
    update();
  }
}
