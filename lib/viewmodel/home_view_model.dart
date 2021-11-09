import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:luobo_project/model/home_banner_model.dart';
import 'package:luobo_project/model/home_list_model.dart';
import 'package:luobo_project/network/http.dart';
import 'package:luobo_project/network/response.dart';

class HomeViewModel extends ChangeNotifier {
  HomeHeaderInfo? _headInfo;
  List<RecommendGoods>? _recommendList;
  HomeHeaderInfo? get headerInfo => _headInfo;
  List<RecommendGoods>? get recommendList => _recommendList;

  void setHeaderInfo(HomeHeaderInfo? headInfo) {
    _headInfo = headInfo;
    notifyListeners();
  }

  void setRecommendList(List<RecommendGoods>? list) {
    _recommendList = list;
    notifyListeners();
  }

  Future<Result<HomeHeaderInfo>> requestHomeHeadInfo() async {
    try {
      RequestResponse response = await Http.get("index/main");
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
      RequestResponse response = await Http.get("index/recommend");
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
}
