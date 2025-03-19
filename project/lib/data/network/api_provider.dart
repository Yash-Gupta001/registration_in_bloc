import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:rfc_cc/data/model/status.dart';
import 'package:rfc_cc/data/network/api_request.dart';
import 'package:rfc_cc/data/network/connectivity_service.dart';
import 'package:rfc_cc/data/network/operation_callback.dart';

class APIProvider {
  static const requestTimeOut = Duration(seconds: 60);
  final _client = GetConnect(timeout: requestTimeOut);

  final ConnectivityService connectivityService =
      Get.find<ConnectivityService>();

  static final _singleton = APIProvider();
  static APIProvider get instance => _singleton;

  Future request(APIRequest request) async {
    if (kDebugMode) {
      print("URL =>  ${request.url}");
      print("Header =>  ${request.headers}");
      print("Query =>  ${request.query}");
      print("Body =>  ${request.body}");
    }

    if (!await connectivityService.isInternetAvailable()) {
      request.listener.noInternet(networkError());
      return;
    }
    try {
      final response = await _client.request(
        request.url,
        contentType: request.contentType,
        request.method.string,
        headers: request.headers,
        query: request.query,
        body: request.body,
      );
      if (kDebugMode) {
        print("Code =>  ${response.statusCode}");
        print("Response =>  ${response.body}");
      }
      _returnResponse(response, request.listener);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    }
  }

  _returnResponse<T, V>(
      Response<dynamic> response, OperationCallBack<T, V> listener) {
    switch (response.statusCode) {
      case 200:
        listener.success(response.body);
      case 400:
        listener.error(response.body);
      case 401:
      case 403:
        listener
            .authenticationError(getDefaultResponse("Athentication Failes"));
      case 404:
        listener.error(getDefaultResponse("Not found"));
      case 500:
      case 307:
        listener.error(response.body);
      default:
        listener.error(getDefaultResponse(
            "Error occurred while Communication with Server with StatusCode : ${response.statusCode} - ${response.statusText}"));
    }
  }
}

Map<String, dynamic> getDefaultResponse(String message) {
  return Status(message: message, id: 0, isErrorInService: true).toJson();
}

Map<String, dynamic> networkError() {
  return Status(message: "Oops! You're Offline", id: 0, isErrorInService: true)
      .toJson();
}

T parseJson<T>(
    Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJson) {
  return fromJson(json);
}

class AppException implements Exception {
  final code;
  final message;
  final details;

  AppException({this.code, this.message, this.details});

  @override
  String toString() {
    return "[$code]: $message \n $details";
  }
}

class FetchDataException extends AppException {
  FetchDataException(String? details)
      : super(
          code: "fetch-data",
          message: "Error During Communication",
          details: details,
        );
}

class BadRequestException extends AppException {
  BadRequestException(String? details)
      : super(
          code: "invalid-request",
          message: "Invalid Request",
          details: details,
        );
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String? details)
      : super(
          code: "unauthorised",
          message: "Unauthorised",
          details: details,
        );
}

class InvalidInputException extends AppException {
  InvalidInputException(String? details)
      : super(
          code: "invalid-input",
          message: "Invalid Input",
          details: details,
        );
}

class AuthenticationException extends AppException {
  AuthenticationException(String? details)
      : super(
          code: "authentication-failed",
          message: "Authentication Failed",
          details: details,
        );
}

class TimeOutException extends AppException {
  TimeOutException(String? details)
      : super(
          code: "request-timeout",
          message: "Request TimeOut",
          details: details,
        );
}
