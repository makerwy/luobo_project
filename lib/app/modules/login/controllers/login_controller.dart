import 'package:get/get.dart';

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
}
