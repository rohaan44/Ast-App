import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthStorage {
  static const _tokenKey = "auth_token";
  static const _refreshTokenKey = "refresh_token";
  static const _userIdKey = "user_id";

  static const FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true, // Secure for Android
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
    ),
  );

  // SAVE TOKEN
  static Future<void> saveToken(String token) async {
    print(
        "🔐 Saving token: ${token.substring(0, 20)}..."); // Show first 20 chars for security
    await _storage.write(key: _tokenKey, value: token);

    // Verify it was saved
    final savedToken = await _storage.read(key: _tokenKey);
    if (savedToken != null) {
      print("✅ Token saved successfully");
    } else {
      print("❌ Token save FAILED");
    }
  }

  static Future<void> saveRole(String role) async {
    await _storage.write(key: "role", value: role);
  }

  static Future<String?> getRole() async {
    return await _storage.read(key: "role");
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

    print("\n🔍 ========== TOKEN STATUS DEBUG ==========");
    print(
        "Access Token: ${token != null ? '✅ EXISTS (${token.substring(0, 20)}...)' : '❌ NOT FOUND'}");
    print(
        "Refresh Token: ${refreshToken != null ? '✅ EXISTS' : '❌ NOT FOUND'}");
    print("User ID: ${userId ?? '❌ NOT FOUND'}");
    print("==========================================\n");
  }
}
