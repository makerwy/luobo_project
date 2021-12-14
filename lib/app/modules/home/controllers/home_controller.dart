import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luobo_project/app/routes/app_pages.dart';
import 'package:luobo_project/const/const.dart';
import 'package:luobo_project/model/home_banner_model.dart';
import 'package:luobo_project/model/home_list_model.dart';
import 'package:luobo_project/model/user_info.dart';
import 'package:luobo_project/model/user_model.dart';
import 'package:luobo_project/network/http.dart';
import 'package:luobo_project/network/response.dart';
import 'package:luobo_project/utils/api.dart';
import 'package:luobo_project/utils/local_cache.dart';

class HomeController extends GetxController {
  HomeHeaderInfo? _headInfo;
  List<RecommendGoods>? _recommendList;
  HomeHeaderInfo? get headerInfo => _headInfo;
  List<RecommendGoods>? get recommendList => _recommendList;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _requestGlobalConfig();
    _requestUserInfo();
    requestHomeHeadInfo();
    requestHomeList();
  }

  void setHeaderInfo(HomeHeaderInfo? headInfo) {
    _headInfo = headInfo;
    update();
  }

  void setRecommendList(List<RecommendGoods>? list) {
    _recommendList = list;
    update();
  }

  Future<Result<HomeHeaderInfo>> requestHomeHeadInfo() async {
    try {
      RequestResponse response = await Http.get(HomeApi.main);
      HomeHeaderInfo info = HomeHeaderInfo.fromJson(response.data ?? {});
      setHeaderInfo(info);
      debugPrint("debug ====  " + info.toString());
      return Result.completed(info);
    } on DioError catch (e) {
      debugPrint("debug ====" + e.toString());
      return Result.error(e.error);
    }
  }

  Future requestHomeList() async {
    try {
      RequestResponse response = await Http.get(HomeApi.recommend);
      List<dynamic> list = response.data;
      List<RecommendGoods> goodsList =
          list.map((e) => RecommendGoods.fromJson(e)).toList();
      setRecommendList(goodsList);
      return Result.completed(goodsList);
    } on DioError catch (e) {
      debugPrint("debug ====" + e.toString());
      return Result.error(e.error);
    }
  }

  void _requestUserInfo() async {
    String? token = await LocalCache.getInstance().get(Constant.ACCESS_TOKEN);
    if (token != null) {
      RequestResponse response = await Http.get(MineApi.userProfile);
      if (response.isSuccess) {
        UserModel user = UserModel.fromJson(response.data);
        UserInfo.getInstance().setUser(user);
      } else {
        if (response.retCode == "10002") {
          var data = await Get.toNamed(Routes.login);
          _requestUserInfo();
        }
      }
    }
  }

  _requestGlobalConfig() async {
    RequestResponse response = await Http.get(HomeApi.config);
    LocalCache.getInstance()
        .setString(Constant.monitor, response.data["monitor"]);
    LocalCache.getInstance()
        .setString(Constant.dispatcher, response.data["dispatcher"]);
  }
}
