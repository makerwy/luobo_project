class Api {
  static const String baseUrl = "https://api.luobotech.com/api/";
}

class LoginApi {
  static const String phoneLogin = "merchant/login";
  static const String otherLogin = "auth/other_login.htm";
  static const String bindMobile = "auth/bind_mobile.htm";
  static const String sendMsg = "sms/send_msg";
}

class RegisterApi {
  static const String register = "merchant/reg";
}

class MineApi {
  static const String userProfile = "user/profile";
}

class HomeApi {
  static const String main = "index/main";
  static const String recommend = "index/recommend";
  static const String config = "index/config";
}
