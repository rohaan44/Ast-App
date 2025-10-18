import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';


class CacheService {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<String>('api_cache');
  }

  static Future<void> saveResponse(String key, dynamic data) async {
    final box = Hive.box<String>('api_cache');
    await box.put(key, jsonEncode(data));
  }

  static dynamic getResponse(String key) {
    final box = Hive.box<String>('api_cache');
    final jsonStr = box.get(key);
    if (jsonStr == null) return null;
    return jsonDecode(jsonStr);
  }
}
