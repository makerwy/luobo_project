import 'package:get/get.dart';

class TabPageController extends GetxController {
  int currentIndex = 0;

  void changeIndex(index) {
    currentIndex = index;
    update();
  }
}
