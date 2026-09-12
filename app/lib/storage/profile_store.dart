import 'package:shared_preferences/shared_preferences.dart';

/// Профиль кандидата — личные данные, поэтому живёт только на устройстве
/// и уходит на бэкенд отдельным полем в каждом /prepare, а не лежит
/// файлом на сервере (там его и не будет: server/profiles/*.yaml
/// специально не попадает в git).
class ProfileStore {
  static const _key = 'candidate_profile_yaml_v1';

  Future<String> load() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key) ?? '';
  }

  Future<void> save(String yamlText) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, yamlText);
  }
}
