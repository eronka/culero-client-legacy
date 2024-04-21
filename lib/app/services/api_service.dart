import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  static const String baseURL = 'https://your-api-url.com';

  // Function to make a POST request with JSON body
  static Future<bool> _makePostRequest(String url, Map<String, String> body) async {
    final response = await http.post(
      Uri.parse('$baseURL/$url'),
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return true; // Successful request
    } else {
      throw Exception('API request failed with status code: ${response.statusCode}'); // Throw exception for error handling
    }
  }

  // Function to register a new user
  static Future<bool> registerUser(String email, String password) async {
    return await _makePostRequest('register', {'email': email, 'password': password});
  }

  // Function to log in a user
  static Future<bool> loginUser(String email, String password) async {
    return await _makePostRequest('login', {'email': email, 'password': password});
  }
}
