import 'package:luobo_project/const/const.dart';
import 'package:luobo_project/utils/local_cache.dart';

class Utils {
  static bool isLogin() {
    String? token = LocalCache.getInstance().get(Constant.ACCESS_TOKEN);
    return token?.isNotEmpty ?? false;
  }
}
