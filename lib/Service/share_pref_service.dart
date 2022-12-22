import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
@lazySingleton
class SharePrefService {
  static const ACCESS_TOKEN = 'ACCESS_TOKEN';

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
}
