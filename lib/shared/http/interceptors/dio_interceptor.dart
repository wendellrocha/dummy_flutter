import 'dart:convert';

import 'package:dio/dio.dart';

import '../errors/http_error.dart';

class DioInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    var data = err.response?.data is String
        ? json.decode(err.response?.data)
        : err.response?.data;

    switch (err.type) {
      case DioErrorType.receiveTimeout:
      case DioErrorType.connectionTimeout:
        throw HttpError(
          message: 'timeoutError',
          statusCode: 408,
          requestOptions: err.requestOptions,
        );
      case DioErrorType.cancel:
        throw HttpError(
          message: 'requestCancelledError',
          statusCode: 500,
          requestOptions: err.requestOptions,
        );
      default:
        throw HttpError(
          message: data['message'],
          statusCode: err.response?.statusCode,
          requestOptions: err.requestOptions,
        );
    }
  }
}
