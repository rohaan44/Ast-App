
import 'package:ast_official/core/network/network_services/api_interceptors.dart';
import 'package:dio/dio.dart';
class DioHelper {
  Dio dio = getDio();

  Options option = Options(
      receiveDataWhenStatusError: true,
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      contentType: "application/json");
  Map<String, dynamic> headers = {"isAuthRequired": "Bearer token"};

  Future get({required String url, bool isAuthRequired = false}) async {
    if (isAuthRequired) {
      option.headers = headers;
    }
    try {
      Response response = await dio.get(url, options: option);
      return response.data;
    } catch (e) {
      return null;
    }
  }

  Future post({required String url,Object? requestBody,
      bool isAuthRequired = false}) async {
    if (isAuthRequired) {
      option.headers = headers;
    }
    try {
      Response response;
      if (requestBody == null) {
        response = await dio.post(url, options: option);
      } else {
      response = await dio.post(url,data:requestBody ,options: option);
        
      }
      return response.data;
    } catch (e) {
      return null;
    }
  }
    Future put({required String url,Object? requestBody,
      bool isAuthRequired = false}) async {
    if (isAuthRequired) {
      option.headers = headers;
    }
    try {
      Response response;
      if (requestBody == null) {
        response = await dio.put(url, options: option);
      } else {
      response = await dio.put(url,data:requestBody ,options: option);
        
      }
      return response.data;
    } catch (e) {
      return null;
    }
  }
    Future patch({required String url,Object? requestBody,
      bool isAuthRequired = false}) async {
    if (isAuthRequired) {
      option.headers = headers;
    }
    try {
      Response response;
      if (requestBody == null) {
        response = await dio.patch(url, options: option);
      } else {
      response = await dio.patch(url,data:requestBody ,options: option);
        
      }
      return response.data;
    } catch (e) {
      return null;
    }
  }

  Future delete({required String url,Object? requestBody,
      bool isAuthRequired = false}) async {
    if (isAuthRequired) {
      option.headers = headers;
    }
    try {
      Response response;
      if (requestBody == null) {
        response = await dio.delete(url, options: option);
      } else {
      response = await dio.delete(url,data:requestBody ,options: option);
        
      }
      return response.data;
    } catch (e) {
      return null;
    }
  }
 
}
