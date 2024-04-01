import 'package:flutter/material.dart';

/// The login page shown when the user is not authenticated.
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login'),
          ],
        ),
      ),
    );
  }
}
