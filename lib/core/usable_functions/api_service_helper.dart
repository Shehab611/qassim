import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:qassim/core/utils/api_utils/logging_interceptor.dart';
import 'package:qassim/core/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient {
  final String _baseUrl;
  final LoggingInterceptor _loggingInterceptor;
  final SharedPreferences _sharedPreferences;

  final Dio? _dio;
  String? _token;

  DioClient(this._baseUrl,
      this._dio,{
        required LoggingInterceptor loggingInterceptor,
        required SharedPreferences sharedPreferences,
      }) : _sharedPreferences = sharedPreferences, _loggingInterceptor = loggingInterceptor {
    _token = _sharedPreferences.getString(AppConstants.userLoginTokenSharedPreferenceKey);
    if (kDebugMode) {
      print("NNNN $_token");
    }
    _dio!
      ..options.baseUrl = _baseUrl
      ..options.connectTimeout = AppConstants.connectionTimeOut
      ..options.receiveTimeout = AppConstants.connectionTimeOut
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $_token',
        'Accept': 'application/json',
      };
    _dio.interceptors.add(_loggingInterceptor);
  }

  void updateHeader(String? token,) {
    token = token ?? _token;
    _token = token;
    _dio!.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> get(String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio!.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio!.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio!.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await _dio!.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }


}


