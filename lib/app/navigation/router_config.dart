import 'dart:convert';

import 'package:culero/app/provider/auth_provider.dart';
import 'package:culero/app/view/dashboard/home.dart';
import 'package:culero/app/view/registeration/email_is_verfied.dart';
import 'package:culero/app/view/registeration/more_options.dart';
import 'package:culero/app/view/registeration/sign_in_with_email.dart';
import 'package:culero/app/view/registeration/sign_up.dart';
import 'package:culero/app/view/registeration/sign_up_with_email.dart';
import 'package:culero/app/view/registeration/verfy_your_email_address.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'app_routes.dart';

part 'router_config.g.dart';

/// A provider for the [GoRouter] configuration.
@riverpod
GoRouter routerConfig(RouterConfigRef ref) {
  final box = GetStorage();
  final userData = box.read('user');
  String initialLocation = AppRoute.signup.path;

  if (userData != null) {
    final user = jsonDecode(userData);
    if (user.containsKey('token')) {
      initialLocation = AppRoute.home.path;
    }
  }

  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(
        path: AppRoute.home.path,
        builder: (context, state) => const UserInfoScreen(),
      ),
      GoRoute(
        path: AppRoute.signup.path,
        builder: (context, state) => const SignUp(),
      ),
      GoRoute(
        path: AppRoute.emailverified.path,
        builder: (context, state) => const EmailIsVerfied(),
      ),
      GoRoute(
        path: '${AppRoute.verifyemail.path}/:email',
        builder: (context, state) {
          final email = state.pathParameters['email']!;
          return VerfyYourEmail(email: email);
        },
      ),
      GoRoute(
        path: AppRoute.moreoptions.path,
        builder: (context, state) => const MoreOptions(),
      ),
      GoRoute(
        path: AppRoute.signupemail.path,
        builder: (context, state) => const SignUpWithEmail(),
      ),
      GoRoute(
        path: AppRoute.login.path,
        builder: (context, state) => const SignInWithEmail(),
      ),
    ],
    redirect: (context, state) {},
  );
}
