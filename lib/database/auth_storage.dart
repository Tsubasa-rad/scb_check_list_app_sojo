// 認証済みかを保存

import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveAuthStatus(bool isAuthenticated, String text) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('isAuthenticated', isAuthenticated);
  prefs.setString('userName', text);
}
void logOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isAuthenticated', false);
  }