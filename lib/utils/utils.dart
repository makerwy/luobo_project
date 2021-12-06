import 'package:luobo_project/const/const.dart';
import 'package:luobo_project/utils/local_cache.dart';

class Utils {
  static Future<bool> isLogin() async {
    String? token = await LocalCache.getInstance().get(Constant.ACCESS_TOKEN);
    return token?.isNotEmpty ?? false;
  }
}
