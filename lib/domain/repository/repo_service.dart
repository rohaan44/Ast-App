import 'dart:developer';

import 'package:ast_official/core/network/network_properties/network_properties.dart';
import 'package:ast_official/core/network/network_services/dio_helper.dart';
import 'package:ast_official/data/models/get_all_users.dart';
import 'package:ast_official/data/models/map_model.dart';
import 'package:ast_official/data/models/products_model.dart';
import 'package:ast_official/data/models/response_model.dart';
import 'package:ast_official/services/api_cache.dart';

class Repository {
  static final DioHelper _dioHelper = DioHelper();

//For Data which is coming as a List

  Future<List<Products>> getAPI(bool isCacheOn) async {
    const cacheKey = "products";
    try {
      if (isCacheOn) {
        final cacheData = CacheService.getResponse(cacheKey);

        if (cacheData != null) {
          _updateProductsCache(
              cacheKey, "${NetworkProperties.baseUrl}/products");
          log("Caching data");
          return (cacheData as List).map((e) => Products.fromJson(e)).toList();
        }
      }
      final response =
          await _dioHelper.get(url: "${NetworkProperties.baseUrl}/products");
      if (response != null && isCacheOn) {
        log("Api data");
        await CacheService.saveResponse(cacheKey, response);
      }
      return List<Products>.from(response.map((e) => Products.fromJson(e)));
    } catch (e) {
      return [];
    }
  }
//Data coming from Map

  Future<MapModel?> getMapData(bool isCacheOn) async {
    const cacheKey = "map_data";
    try {
      if (isCacheOn) {
        final cacheData = CacheService.getResponse(cacheKey);
        if (cacheData != null && cacheData is Map<String, dynamic>) {
          log("📦 Returning cached MapModel");
          return MapModel.fromJson(cacheData);
        }
      }
      final response =
          await _dioHelper.get(url: "${NetworkProperties.baseMapUrl}page=2");
      if (response != null && response is Map<String, dynamic>) {
        // ✅ 3. Save API response into cache
        if (isCacheOn) {
          await CacheService.saveResponse(cacheKey, response);
          log("✅ API response cached");
        }
        return MapModel.fromJson(response);
      }
      return null;
    } catch (e) {
      log(" Error in getMapData: $e");
      return null;
    }
  }

//********************************************* */
/*For Data which is coming in Map in Post API*/
 
  Future postApi(Object reqBody) async {
    var response = await _dioHelper.post(
        url: "${NetworkProperties.baseUrl}/users", requestBody: reqBody);
    return response;
  }

/*For Data which is coming from the response of Post api*/
  Future<ResponseModel> getResponse(int id) async { 
    var response =
        await _dioHelper.get(url: "${NetworkProperties.baseUrl}/users/$id");
    return ResponseModel.fromJson(response);
  }

//*******************Put Api Update flow*******************************//
//Get All Users here
  Future<List<GetAllUsers>> getAllUsers() async {
    List response =
        await _dioHelper.get(url: "${NetworkProperties.baseUrl}/users");
    return List<GetAllUsers>.from(response.map((e) => GetAllUsers.fromJson(e)));
  }

  Future putApi(Object obj, int id) async {
    var response = await _dioHelper.put(
        url: "${NetworkProperties.baseUrl}/users/$id", requestBody: obj);
    return response;
  }

  //******************Delete Api***************/

  Future deleteApi(int id) async {
    var response = await _dioHelper.put(
      url: "${NetworkProperties.baseUrl}/users/$id",
    );
    return response;
  }

///////////////////////////For Updated Cache ///////////////////

  Future<void> _updateProductsCache(String cacheKey, String url) async {
    try {
      final response = await _dioHelper.get(
        url: url,
      );
      if (response != null) {
        await CacheService.saveResponse(cacheKey, response);
      }
    } catch (e) {
      // Ignore errors, keep old cache
    }
  }
}
