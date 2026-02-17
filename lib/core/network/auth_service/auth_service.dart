import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthStorage {
  static const _tokenKey = "auth_token";
  static const _refreshTokenKey = "refresh_token";
  static const _userIdKey = "user_id";
  static const _roleKey = "role";

  static String? _accessToken;
  static String? _refreshToken;
  static String? _userId;
  static String? _role;

  static const FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
    ),
  );

  static Future<void> init() async {
    try {
      _accessToken = await _storage.read(key: _tokenKey);
      _refreshToken = await _storage.read(key: _refreshTokenKey);
      _userId = await _storage.read(key: _userIdKey);
      _role = await _storage.read(key: _roleKey);
      debugPrint("🚀 AuthStorage Initialized: Tokens Loaded in Memory");
      debugPrint(
          "📍 Initial Access Token: ${_accessToken != null ? 'Present' : 'Missing'}");
    } catch (e) {
      debugPrint("❌ AuthStorage Init Error: $e");
    }
  }

  // SAVE TOKEN
  static Future<void> saveToken(String token) async {
    try {
      debugPrint("🔐 Saving access token...");
      await _storage.write(key: _tokenKey, value: token);
      _accessToken = token; // Update memory cache

      // Verify it was saved
      final savedToken = await _storage.read(key: _tokenKey);
      if (savedToken != null) {
        debugPrint("✅ Access Token saved and verified in storage");
      } else {
        debugPrint("❌ Access Token save FAILED verification");
      }
    } catch (e) {
      debugPrint("❌ Error in saveToken: $e");
    }
  }

  static Future<void> saveRole(String role) async {
    try {
      await _storage.write(key: _roleKey, value: role);
      _role = role;
    } catch (e) {
      debugPrint("❌ Error in saveRole: $e");
    }
  }

  static Future<String?> getRole() async {
    if (_role != null) return _role;
    _role = await _storage.read(key: _roleKey);
    return _role;
  }

  // GET TOKEN
  static Future<String?> getToken() async {
    try {
      if (_accessToken != null) return _accessToken;
      _accessToken = await _storage.read(key: _tokenKey);
      return _accessToken;
    } catch (e) {
      debugPrint("❌ Error in getToken: $e");
      return null;
    }
  }

  // SAVE REFRESH TOKEN
  static Future<void> saveRefreshToken(String token) async {
    try {
      await _storage.write(key: _refreshTokenKey, value: token);
      _refreshToken = token;
      debugPrint("✅ Refresh Token saved");
    } catch (e) {
      debugPrint("❌ Error in saveRefreshToken: $e");
    }
  }

  // GET REFRESH TOKEN
  static Future<String?> getRefreshToken() async {
    try {
      if (_refreshToken != null) return _refreshToken;
      _refreshToken = await _storage.read(key: _refreshTokenKey);
      return _refreshToken;
    } catch (e) {
      debugPrint("❌ Error in getRefreshToken: $e");
      return null;
    }
  }

  // SAVE USER ID
  static Future<void> saveUserId(String userId) async {
    try {
      await _storage.write(key: _userIdKey, value: userId);
      _userId = userId;
      debugPrint("✅ User ID saved: $userId");
    } catch (e) {
      debugPrint("❌ Error in saveUserId: $e");
    }
  }

  // GET USER ID
  static Future<String?> getUserId() async {
    try {
      if (_userId != null) return _userId;
      _userId = await _storage.read(key: _userIdKey);
      return _userId;
    } catch (e) {
      debugPrint("❌ Error in getUserId: $e");
      return null;
    }
  }

  // CLEAR ALL AUTH DATA
  static Future<void> clearAll() async {
    try {
      debugPrint("🧹 Clearing all auth storage data...");
      await _storage.deleteAll();
      _accessToken = null;
      _refreshToken = null;
      _userId = null;
      _role = null;
    } catch (e) {
      debugPrint("❌ Error in clearAll: $e");
    }
  }

  // DEBUG: Check if token exists
  static Future<void> debugTokenStatus() async {
    final token = await getToken();
    final refreshToken = await getRefreshToken();
    final userId = await getUserId();
    final role = await getRole();

    debugPrint("\n🔍 ========== TOKEN STATUS DEBUG ==========");
    debugPrint("Memory Access Token: ${_accessToken != null ? '✅' : '❌'}");
    debugPrint("Storage Access Token: ${token != null ? '✅' : '❌'}");
    debugPrint("Refresh Token: ${refreshToken != null ? '✅' : '❌'}");
    debugPrint("User ID: ${userId ?? '❌'}");
    debugPrint("Role: ${role ?? '❌'}");
    debugPrint("==========================================\n");
  }
}
