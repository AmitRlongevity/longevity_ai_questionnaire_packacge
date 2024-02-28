//import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
//import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'http/rest_client.dart';

class DioBuilder {
  late final RestClient _client;
  RestClient get client => _client;
  DioBuilder() {
    final dio = Dio();
    _client = RestClient(dio, baseUrl: 'https://dev.api.longevity-ai.com/api/v1');
    dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        request: true,
        responseHeader: true,
        responseBody: true,
        error: true));
    //I need this string for debug purposes. I'll uncomment if I need curl
//    dio.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));
    //Here I add the logger for the debugging
  }
}
