import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/user_model.dart';

@Injectable()
@lazySingleton
class SharePrefService {
  static const ACCESS_TOKEN = 'ACCESS_TOKEN';
  static const ROLE = 'ROLE';
  static const USERNAME = "USERNAME";
  static const EMAIL = "EMAIL";
  static const ID = "ID";
  final SharedPreferences _instance;

  SharePrefService(this._instance);

  SharedPreferences getInstance() {
    return _instance;
  }

  void logout() {
    /// Make sure to remove item that should not persist when user logout
    _instance.remove(ACCESS_TOKEN);
  }

  Future<void> setAccessToken(String token) async {
    await _instance.setString(ACCESS_TOKEN, token);
  }

  String getAccessToken() {
    return _instance.getString(ACCESS_TOKEN) ?? '';
  }

  Future<void> setRole(String role) async {
    await _instance.setString(ROLE, role.toLowerCase());
  }

  String getRole() {
    return _instance.getString(ROLE) ?? '';
  }

  Future<void> setUsername(String username) async {
    await _instance.setString(USERNAME, username);
  }

  String getUsername() {
    return _instance.getString(USERNAME) ?? '';
  }

  Future<void> setEmail(String email) async {
    await _instance.setString(EMAIL, email);
  }

  String getEmail() {
    return _instance.getString(EMAIL) ?? '';
  }
  Future<void> setId(String id) async {
    await _instance.setString(ID, id);
  }

  String getId() {
    return _instance.getString(ID) ?? '';
  }
}
