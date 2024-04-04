import 'package:culero/app/view/registeration/email_is_verfied.dart';
import 'package:culero/app/view/registeration/more_options.dart';
import 'package:culero/app/view/registeration/sign_up.dart';
import 'package:culero/app/view/registeration/sign_up_with_email.dart';
import 'package:culero/app/view/registeration/verfy_your_email_address.dart';
import 'package:culero/components/component_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


import '../view/home_page.dart';
import 'app_routes.dart';

part 'router_config.g.dart';

/// A provider for the [GoRouter] configuration.
@riverpod
GoRouter routerConfig(RouterConfigRef ref) {
  // final authProvider = ref.watch(firebaseAuthStateChangesStreamProvider);

  return GoRouter(
    initialLocation: AppRoute.home.path,
    routes: [

      GoRoute(
        path: AppRoute.home.path,
        builder: (context, state) => const HomePage(),
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
        path: AppRoute.moreoptions.path,
        builder: (context, state) => const MoreOptions(),
      ),
      GoRoute(
        path: AppRoute.verfyemail.path,
        builder: (context, state) => const VerfyYourEmail(),
      ),
      GoRoute(
        path: AppRoute.signupemail.path,
        builder: (context, state) => const SignUpWithEmail(),
      ),
    ],
    redirect: (context, state) {
      // TODO: Uncomment code below to redirect the user to the login page
      // Handle the initial redirect based on the authentication state
      // if (state.fullPath == "/") {
      //   if (authProvider.isLoading) {
      //     return null;
      //   }

      //   if (authProvider.value?.uid != null) {
      //     return AppRoute.home.path;
      //   } else {
      //     return AppRoute.login.path;
      //   }
      // }

      return null;
    },
  );
}
