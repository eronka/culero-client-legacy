
import 'package:culero/app/navigation/app_routes.dart';
import 'package:culero/app/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';

class UserInfoScreen extends ConsumerStatefulWidget {
  const UserInfoScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends ConsumerState<UserInfoScreen> {
  late Future<Map<String, dynamic>> userInfoFuture;
  AuthProvider authProvider = AuthProvider();
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    userInfoFuture = authProvider.getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: userInfoFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final userInfo = snapshot.data ?? {};
          // Use userInfo here
          return Scaffold(
            appBar: AppBar(
              title: const Text('User Info'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Logged in as: ${userInfo['email']} ${userInfo['name']}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      await authProvider.signOut(context);
                      // ignore: use_build_context_synchronously
                      context.go(AppRoute.login.path);
                    },
                    child: const Text('Logout'),
                  ),
                ],
              ),
            ),
          );
        } else {
          // Loading state
          return const CircularProgressIndicator();
        }
      },
    );
  }
}