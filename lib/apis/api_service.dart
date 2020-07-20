import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:givefit/utils/constants.dart';
import 'package:givefit/utils/preference_utils.dart';


import '../utils/app_config.dart';

class ApiService {
  Dio _dio;
  String tag = "API call :";
  CancelToken _cancelToken;
  static final Dio mDio = Dio();

  // make this a singleton class
  static final ApiService _instance = ApiService._internal();

  factory ApiService() {
    mDio.options.headers['authorization'] = '';
    return _instance;
  }

  ApiService._internal() {
    _dio = initApiServiceDio();
  }

  Dio initApiServiceDio() {
    _cancelToken = CancelToken();
    final baseOption = BaseOptions(
      connectTimeout: 30 * 1000,
      receiveTimeout: 30 * 1000,
      baseUrl: "http://3.104.132.100/givefit/web/api/users/",
      contentType: 'application/json',
      headers: {
        'authorization': '',
      },
    );
    mDio.options = baseOption;
    final mInterceptorsWrapper = InterceptorsWrapper(
      onRequest: (options) async {
        debugPrint("$tag ${options.baseUrl.toString() + options.path}",
            wrapWidth: 1024);
        debugPrint("$tag ${options.data.toString()}", wrapWidth: 1024);
        return options;
      },
      onResponse: (response) async {
        debugPrint("Code  ${response.statusCode.toString()}", wrapWidth: 1024);
        debugPrint("Response ${response.toString()}", wrapWidth: 1024);

        return response;
      },
      onError: (e) async {
        debugPrint("$tag ${e.error.toString()}", wrapWidth: 1024);
        debugPrint("$tag ${e.response.toString()}", wrapWidth: 1024);
        return e;
      },
    );
    mDio.interceptors.add(mInterceptorsWrapper);
    return mDio;
  }

  void cancelRequests({CancelToken cancelToken}) {
    cancelToken == null
        ? _cancelToken.cancel('Cancelled')
        : cancelToken.cancel();
  }

  Future<Response> get(
    String endUrl, {
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
  }) async {
    return await (_dio.get(
      endUrl,
      queryParameters: params,
      cancelToken: cancelToken ?? _cancelToken,
      options: options,
    )).catchError((e) {
      throw e;
    });
  }

  Future<Response> post(
    String endUrl, {
    FormData data,
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
  }) async {
    try {
      return await (_dio.post(
        endUrl,
        data: data,
        queryParameters: params,
        cancelToken: cancelToken ?? _cancelToken,
        options: options,
      ));
    } on DioError {
      rethrow;
    }
  }

  Future<Response> multipartPost(
    String endUrl, {
    FormData data,
    CancelToken cancelToken,
    Options options,
  }) async {
    try {
      return await (_dio.post(
        endUrl,
        data: data,
        cancelToken: cancelToken ?? _cancelToken,
        options: options,
      ));
    } on DioError {
      rethrow;
    }
  }
}
