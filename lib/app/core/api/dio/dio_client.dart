import 'package:dio/dio.dart';

import 'token_interceptor.dart';

Dio buildDioClient(String base) {
  final dio = Dio()..options = BaseOptions(baseUrl: base);

  dio.interceptors.addAll([
    LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
    ),
    TokenInterceptor(),
  ]);

  return dio;
}
