import 'package:culero/app/navigation/app_routes.dart';
import 'package:culero/app/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:culero/atoms/indicator/indicator.dart';
import 'package:culero/atoms/text/body_text.dart';
import 'package:culero/atoms/text/heading_text.dart';
import 'package:culero/atoms/text_field/primary_text_form_field.dart';
import 'package:culero/utils/color.dart';
import 'package:culero/utils/font_size.dart';
import 'package:culero/utils/screen_sizes.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInWithEmail extends StatefulWidget {
  const SignInWithEmail({super.key});

  @override
  State<SignInWithEmail> createState() => _SignInWithEmailState();
}

class _SignInWithEmailState extends State<SignInWithEmail> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final formKey = GlobalKey<FormState>();
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    AuthProvider authProvider = AuthProvider();

    String passWord = "";

    return Scaffold(
      key: scaffoldKey, // Assign the key here
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: isMobile(mediaQuery) ? 25 : 75, vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: isMobile(mediaQuery)
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  HeadingText(
                      text: "CULERO",
                      fontSize: 25,
                      fontColor: Theme.of(context).colorScheme.primary),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                width: 582,
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HeadingText(
                          text: "Sign In",
                          fontSize: isMobile(mediaQuery)
                              ? FontSizes.h3
                              : FontSizes.h1),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: isMobile(mediaQuery) ? 50 : 25,
                            horizontal: isMobile(mediaQuery) ? 25 : 0),
                        child: BodyText(
                            text:
                                "Embark on a Journey of Professional Growth and Collaboration!",
                            textAlign: TextAlign.center,
                            fontSize: isMobile(mediaQuery)
                                ? FontSizes.p1
                                : FontSizes.h5),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PrimaryTextFormField(
                          hintText: "Enter your email address",
                          controller: emailController,
                          onChanged: (e) {
                            emailController.text = e;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            final RegExp emailRegex =
                                RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                            if (!emailRegex.hasMatch(value)) {
                              return "Enter valid email";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PrimaryTextFormField(
                          hintText: "Create a password ",
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters long';
                            }
                            return null;
                          },
                          onChanged: (e) {
                            passwordController.text = e;
                          },
                        ),
                      ),
                      (passWord.isNotEmpty)
                          ? Indicator(
                              value: passWord.length / 8,
                              color: passWord.length < 8
                                  ? Colors.red
                                  : Colors.green,
                            )
                          : const SizedBox(height: 9),
                      if (passWord.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 50),
                          child: RichText(
                            text: TextSpan(
                              text:
                                  'Password strength: ${passWord.length < 8 ? "Weak" : "Strong"}',
                              style: const TextStyle(
                                fontSize: FontSizes.h5,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                              ),
                              children: const [
                                TextSpan(
                                  text:
                                      'Try lengthening it or adding numbers and symbols.',
                                  style: TextStyle(
                                    fontSize: FontSizes.p3,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          onPressed: () async {
                            try {
                              final email = emailController.text.trim();
                              final password = passwordController.text.trim();
                              await authProvider.signInUser(
                                  context, email, password);
                              // ignore: use_build_context_synchronously
                              context.go(AppRoute.home.path);
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(e.toString()),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          style: TextButton.styleFrom(
                            minimumSize: const Size(573, 60),
                            foregroundColor: textColor,
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            "Sign In",
                            style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: bodyText1,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            text: 'By continuing, you agree to Culero ',
                            children: [
                              TextSpan(
                                text: 'Terms of Service',
                                style: TextStyle(
                                    fontSize: isMobile(mediaQuery)
                                        ? FontSizes.p3
                                        : FontSizes.p1,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                              const TextSpan(text: ' and '),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                    fontSize: isMobile(mediaQuery)
                                        ? FontSizes.p3
                                        : FontSizes.p1,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                              const TextSpan(text: '.'),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: RichText(
                          text: TextSpan(
                            text: 'Don\'t have an account? ',
                            style: const TextStyle(
                              fontSize: FontSizes.p2, // Set text size to 17
                              color: Colors.black, // Default text color
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign Up',
                                style: const TextStyle(
                                  fontSize: FontSizes.p2, // Set text size to 17
                                  color: Colors
                                      .blue, // Change color to blue for the link
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.go(AppRoute.signup.path);
                                    // Handle sign in action here
                                    // For example, you can navigate to the sign-in screen
                                  },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
