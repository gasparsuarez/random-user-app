import 'dart:developer';

import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  Dio get dio => _dio;

  ///
  /// Client configuration
  ///
  DioClient(this._dio) {
    _dio
      ..options = BaseOptions(baseUrl: 'https://randomuser.me/api/')
      ..interceptors.add(
        InterceptorsWrapper(
          onError: (error, handler) {
            log(error.toString());
            return handler.next(error);
          },
        ),
      );
  }
}
