import 'package:luobo_project/network/app_exception.dart';
import 'dart:convert';

class Result<T> {
  RequestStatus retCode;
  T? data;
  AppException? exception;
  Result.completed(this.data) : retCode = RequestStatus.success;
  Result.error(this.exception) : retCode = RequestStatus.error;

  @override
  String toString() {
    return "retCode : $retCode \n Message : $exception \n Data : $data";
  }
}

enum RequestStatus { success, error }

class RequestResponse<T> {
  RequestResponse({
    this.data,
    this.retCode,
  });

  T? data;
  String? retCode;

  bool get isSuccess {
    return retCode == "0";
  }

  factory RequestResponse.fromJson(Map<String, dynamic> json) =>
      RequestResponse(
        data: json["data"],
        retCode: json["retCode"],
      );

  Map<String, dynamic> toJson() => {
        "data": json.encode(data),
        "retCode": retCode,
      };
}
