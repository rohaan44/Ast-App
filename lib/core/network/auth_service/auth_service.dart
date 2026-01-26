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
      encryptedSharedPreferences: true, // Secure for Android
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
    ),
  );
  static Future<void> init() async {
    _accessToken = await _storage.read(key: _tokenKey);
    _refreshToken = await _storage.read(key: _refreshTokenKey);
    _userId = await _storage.read(key: _userIdKey);
    _role = await _storage.read(key: _roleKey);
    debugPrint("🚀 AuthStorage Initialized: Tokens Loaded in Memory");
  }

  // SAVE TOKEN
  static Future<void> saveToken(String token) async {
    debugPrint(
        "🔐 Saving token: ${token.substring(0, 20)}..."); // Show first 20 chars for security
    await _storage.write(key: _tokenKey, value: token);

    // Verify it was saved
    final savedToken = await _storage.read(key: _tokenKey);
    if (savedToken != null) {
      debugPrint("✅ Token saved successfully");
    } else {
      debugPrint("❌ Token save FAILED");
    }
  }

  static Future<void> saveRole(String role) async {
    await _storage.write(key: _roleKey, value: role);
  }

  static Future<String?> getRole() async {
    return await _storage.read(key: _roleKey);
  }

  // GET TOKEN
  static Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  // DELETE TOKEN
  static Future<void> clearToken() async {
    await _storage.delete(key: _tokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }

  // SAVE REFRESH TOKEN
  static Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: _refreshTokenKey, value: token);
  }

  // GET REFRESH TOKEN
  static Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  // SAVE USER ID
  static Future<void> saveUserId(String userId) async {
    await _storage.write(key: _userIdKey, value: userId);
  }

  // GET USER ID
  static Future<String?> getUserId() async {
    return await _storage.read(key: _userIdKey);
  }

  // CLEAR ALL AUTH DATA
  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }

  // DEBUG: Check if token exists
  static Future<void> debugTokenStatus() async {
    final token = await getToken();
    final refreshToken = await getRefreshToken();
    final userId = await getUserId();

    debugPrint("\n🔍 ========== TOKEN STATUS DEBUG ==========");
    debugPrint(
        "Access Token: ${token != null ? '✅ EXISTS (${token.substring(0, 20)}...)' : '❌ NOT FOUND'}");
    debugPrint(
        "Refresh Token: ${refreshToken != null ? '✅ EXISTS' : '❌ NOT FOUND'}");
    debugPrint("User ID: ${userId ?? '❌ NOT FOUND'}");
    debugPrint("==========================================\n");
  }
}
