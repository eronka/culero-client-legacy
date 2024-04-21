import 'package:culero/app/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthProvider {
  final GetStorage box = GetStorage();
  static const String baseUrl = 'http://localhost:4200/api/auth';
  final String signInUrl = '$baseUrl/sign-in';
  final String signUpUrl = '$baseUrl/sign-up';
  final String verifyEmailUrl = '$baseUrl/verify-email';

  Future<Map<String, dynamic>> getUserInfo() async {
    final String? userJson = box.read('user');
    if (userJson != null) {
      return jsonDecode(userJson) as Map<String, dynamic>;
    }
    return {};
  }

  Future<bool> signUp({required String email, required String password}) async {
    final Uri url = Uri.parse(signUpUrl);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    final responseData = jsonDecode(response.body);
    if (responseData['message'] != null) {
      throw Exception(responseData['message']);
    }
    return true;
  }

  Future<bool> verifyEmail(
      {required String email, required String code}) async {
    final Uri url = Uri.parse(verifyEmailUrl);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'code': code}),
    );
    final responseData = jsonDecode(response.body);

    if (responseData['message'] != null) {
      throw Exception(responseData['message']);
    }
    if (responseData['token'] == null) {
      throw Exception(responseData['message']);
    } else {
      final user = jsonEncode({
        'token': responseData['token'],
        'name': responseData['name'],
        'email': responseData['email'],
      });
      await box.write('user', user);
    }
    return true;
  }

  Future<void> signInUser(
      BuildContext context, String email, String password) async {
    final Uri url = Uri.parse(signInUrl);
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      final responseData = jsonDecode(response.body);

      if (responseData['token'] == null) {
        throw Exception(responseData['message']);
      } else {
        final user = jsonEncode({
          'token': responseData['token'],
          'name': responseData['name'],
          'email': responseData['email'],
        });
        await box.write('user', user);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signOut(BuildContext context) async {
    await box.remove('user');
  }
}
