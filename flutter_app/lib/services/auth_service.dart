import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://localhost:3000'));

  Future<bool> register(String id, String password) async {
    final response = await _dio.post('/register', data: {'id': id, 'password': password});
    return response.data['success'] == true;
  }

  Future<bool> login(String id, String password) async {
    final response = await _dio.post('/login', data: {'id': id, 'password': password});
    if (response.data['success'] == true) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('jwt', response.data['token']);
      await prefs.setInt('login_time', DateTime.now().millisecondsSinceEpoch);
      return true;
    }
    return false;
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');
    final loginTime = prefs.getInt('login_time') ?? 0;
    if (token == null) return false;

    // 24時間以内ならログイン状態維持
    final now = DateTime.now().millisecondsSinceEpoch;
    if (now - loginTime <= 24 * 60 * 60 * 1000) return true;

    // 有効期限切れ
    await logout();
    return false;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwt');
    await prefs.remove('login_time');
  }
}
