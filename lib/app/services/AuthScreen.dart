import 'package:culero/app/services/api_service.dart';
import 'package:flutter/material.dart';


class RegistrationScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _register() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    
    bool success = await APIService.registerUser(email, password);
    if (success) {
      // Navigate to success screen
    } else {
      // Show error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(controller: emailController),
            TextField(controller: passwordController),
            ElevatedButton(
              onPressed: _register,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}