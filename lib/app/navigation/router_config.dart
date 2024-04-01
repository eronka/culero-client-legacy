import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/login/view/login_page.dart';
import '../../auth/repository/auth_repository.dart';
import '../../home/view/home_page.dart';
import '../view/splash_page.dart';
import 'app_routes.dart';

part 'router_config.g.dart';

/// A provider for the [GoRouter] configuration.
@riverpod
GoRouter routerConfig(RouterConfigRef ref) {
  final authProvider = ref.watch(firebaseAuthStateChangesStreamProvider);

  return GoRouter(
    initialLocation: AppRoute.splash.path,
    routes: [
      GoRoute(
        path: AppRoute.splash.path,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoute.login.path,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoute.home.path,
        builder: (context, state) => const HomePage(),
      ),
    ],
    redirect: (context, state) {
      // Handle the initial redirect based on the authentication state
      if (state.fullPath == "/") {
        if (authProvider.isLoading) {
          return null;
        }

        if (authProvider.value?.uid != null) {
          return AppRoute.home.path;
        } else {
          return AppRoute.login.path;
        }
      }

      return null;
    },
  );
}
