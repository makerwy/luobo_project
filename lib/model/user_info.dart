import 'package:luobo_project/model/user_model.dart';
import 'package:get/get.dart';

class UserInfo {
  static final UserInfo _instance = UserInfo._();
  UserInfo._();
  static UserInfo getInstance() => _instance;

  var user = Rx<UserModel?>(null);

  void setUser(UserModel? user) {
    this.user.value = user;
  }
}
