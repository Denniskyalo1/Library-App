import 'package:shared_preferences/shared_preferences.dart';

class UserDetails{
 static Future<void> storeUserDetails(String name, String email, String token, String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('email', email);
    await prefs.setString('token', token);
    await prefs.setString('role', role);
 }

 static Future<Map<String, String?>> getUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('name');
    String? email = prefs.getString('email');
    String? token = prefs.getString('token');
    String? role = prefs.getString('role');
    
    return {'name': name, 'email': email, 'token': token, 'role': role};
  }

  static Future<void> clearUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('name');
    await prefs.remove('email');
    await prefs.remove('token');
    await prefs.remove('role');
  }

}