import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = 'http://192.168.0.103/Shelfie-new/public/api'; 
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
     'Accept': 'application/json', 
    };

  // Save token locally
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  // Get token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  // Register
  static Future<Map<String, dynamic>?> register(String name, String email, String password) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'email': email, 'password': password}),
    );

    
    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedResponse = jsonDecode(response.body);

  // Debugging
      return decodedResponse;
    } else {
      return {'message': 'Error: ${response.statusCode}', 'status': response.statusCode};
    }
  } catch (e) {
  
    return {'message': 'Network error', 'status': 500};
  }
}

}