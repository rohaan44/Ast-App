import 'dart:convert';
import 'package:dio/dio.dart';

Dio getDio() {
  Dio dio = Dio();
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      print("******API URL*****\n ${options.uri}\n");
      print("******API Headers*****\n ${options.headers}\n");
      print("******API Data***** \n ${jsonEncode(options.data)}");
      return handler.next(options);
    },
    onResponse: (response, handler) {
      print("******API Response******\n ${response.data}");
      return handler.next(response);
    },
    onError: (error, handler) {
      print(
          "******Error StatusCode******\n ${error.response?.statusCode ?? ""}");
      print("******Error Response******\n ${error.response?.data ?? ""}");
      return handler.next(error);
    },
  ));
  return dio;
}
