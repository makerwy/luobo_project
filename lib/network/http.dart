import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:luobo_project/network/network.dart';
import 'package:luobo_project/network/response.dart';

class Http {
  static void init({
    required String baseUrl,
    int connectTimeout = 5000,
    int receiveTimeout = 5000,
    Map<String, dynamic>? headers,
    List<Interceptor>? interceptors,
  }) {
    Network().init(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      headers: headers,
      interceptors: interceptors,
    );
  }

  static void cancelRequests({required CancelToken token}) {
    Network().cancelRequests(token: token);
  }

  static RequestResponse _getMap(dynamic jsonString) {
    return RequestResponse.fromJson(json.decode(jsonString));
  }

  static Future<RequestResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? progressCallback,
  }) async {
    Response response = await Network().get(path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        progressCallback: progressCallback);
    debugPrint("path === " + response.data);
    return _getMap(response.data);
  }

  static Future post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    Response response = await Network().post(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
    return _getMap(response.data);
  }

  static Future put(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    Response response = await Network().put(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
    return _getMap(response.data);
  }

  Future patch(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    Response response = await Network().patch(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
    return _getMap(response.data);
  }

  Future delete(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Response response = await Network().delete(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken);
    return _getMap(response.data);
  }
}
