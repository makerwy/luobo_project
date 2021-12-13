import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:luobo_project/app/routes/app_pages.dart';
import 'package:luobo_project/const/const.dart';
import 'package:luobo_project/model/user_info.dart';
import 'package:luobo_project/model/user_model.dart';
import 'package:luobo_project/network/http.dart';
import 'package:luobo_project/network/response.dart';
import 'package:luobo_project/utils/api.dart';
import 'package:luobo_project/utils/local_cache.dart';
import 'package:luobo_project/utils/toast.dart';

class LoginController extends GetxController {
  var isReadingProtocol = true.obs;

  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  FocusNode phoneNode = FocusNode();
  FocusNode passwordNode = FocusNode();

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
    isReadingProtocol.toggle();
  }

  void toRegisterPage() => Get.toNamed(Routes.register);
  void toForgetpswPage() => Get.toNamed(Routes.forgetpsw);

  void requestLogin() async {
    String phone = phoneController.text;
    if (phone.isEmpty) {
      LBToast.showToast(msg: "请输入手机号码");
      return null;
    }
    String password = passwordController.text;
    if (password.isEmpty) {
      LBToast.showToast(msg: "请输入密码");
      return;
    }
    if (isReadingProtocol.value == false) {
      LBToast.showToast(msg: "未同意《用户隐私政策》《萝泊服务协议》");
      return;
    }

    RequestResponse response = await Http.post(
      LoginApi.phoneLogin,
      queryParameters: {
        "mobile": phone,
        "password": password,
        "type": password,
      },
    );

    if (!response.isSuccess) {
      LBToast.showToast(msg: response.errorMsg ?? "");
      return;
    }
    UserModel userModel = UserModel.fromJson(response.data);
    LocalCache.getInstance()
        .setString(Constant.ACCESS_TOKEN, userModel.accessToken ?? "");
    UserInfo.getInstance().setUser(userModel);
    Get.back();
  }
}
