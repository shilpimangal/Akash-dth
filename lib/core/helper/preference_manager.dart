import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void saveStringData(String key , String value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(key, value);
  }

  Future<String?> getStringData(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key);
  }

  void removeStringData(String key) async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove(key);
  }
}