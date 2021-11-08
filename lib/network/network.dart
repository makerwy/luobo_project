import 'dart:async';

import 'package:dio/dio.dart';
import 'package:luobo_project/network/error.dart';
import 'package:luobo_project/utils/local_cache.dart';

class Network {
  static final Network _instance = Network._internal();
  factory Network() => _instance;

  static late final Dio dio;
  final CancelToken _cancelToken = CancelToken();

  Network._internal() {
    BaseOptions options = BaseOptions();
    dio = Dio(options);
    dio.interceptors.add(ErrorInterceptor());
  }

  void init({
    String? baseUrl,
    int? connectTimeout,
    int? receiveTimeout,
    Map<String, dynamic>? headers,
    List<Interceptor>? interceptors,
  }) {
    dio.options = dio.options.copyWith(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        headers: headers ?? {});
    if (interceptors != null && interceptors.isNotEmpty) {
      dio.interceptors.addAll(interceptors);
    }
  }

  // 关闭dio
  void cancelRequests({required CancelToken token}) {
    _cancelToken.cancel("cancelled");
  }

  Map<String, dynamic>? _getAuthorizationHeader() {
    Map<String, dynamic>? headers;
    String? accessToken = LocalCache().getLocalString("accessToken");
    if (accessToken != null) {
      headers = {
        'Authorization': 'Bearer $accessToken',
      };
    }
    return headers;
  }

  Options _getRequestOptions(Options? options) {
    Options requestOptions = options ?? Options();
    Map<String, dynamic>? _authorization = _getAuthorizationHeader();
    if (_authorization != null) {
      requestOptions = requestOptions.copyWith(headers: _authorization);
    }
    return requestOptions;
  }

  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? progressCallback,
  }) async {
    Options requestOptions = _getRequestOptions(options);
    // requestOptions = requestOptions.copyWith(
    //   extra: {
    //     // "refresh": refresh,
    //     // "noCache": noCache,
    //     // "cacheKey": cacheKey,
    //     // "cacheDisk": cacheDisk,
    //   },
    // );
    Response response = await dio.get(path,
        queryParameters: queryParameters,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken,
        onReceiveProgress: progressCallback);
    return response.data;
  }

  Future post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    Options requestOptions = _getRequestOptions(options);
    Response response = await dio.post(path,
        data: data,
        queryParameters: queryParameters,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
    return response.data;
  }

  Future put(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    Options requestOptions = _getRequestOptions(options);
    Response response = await dio.put(path,
        data: data,
        queryParameters: queryParameters,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
    return response.data;
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
    Options requestOptions = _getRequestOptions(options);
    Response response = await dio.patch(path,
        data: data,
        queryParameters: queryParameters,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
    return response.data;
  }

  Future delete(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = _getRequestOptions(options);
    Response response = await dio.delete(path,
        data: data,
        queryParameters: queryParameters,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }
}
