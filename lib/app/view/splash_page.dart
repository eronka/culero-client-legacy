import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// A page shown when the app launches before the initial redirect occurs.
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push('/login');
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
