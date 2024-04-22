import 'package:culero/app/navigation/app_routes.dart';
import 'package:culero/app/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:culero/atoms/text/body_text.dart';
import 'package:culero/atoms/text/heading_text.dart';
import 'package:culero/atoms/text_field/primary_text_form_field.dart';
import 'package:culero/utils/color.dart';
import 'package:culero/utils/font_size.dart';
import 'package:culero/utils/screen_sizes.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class VerfyYourEmail extends StatelessWidget {
  final String email;
  const VerfyYourEmail({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerCodeOne = TextEditingController();
    final TextEditingController controllerCodeTwo = TextEditingController();
    final TextEditingController controllerCodeThree = TextEditingController();
    final TextEditingController controllerCodeFour = TextEditingController();
    final TextEditingController controllerCodeFive = TextEditingController();
    final TextEditingController controllerCodeSix = TextEditingController();

    AuthProvider authProvider = AuthProvider();
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: isMobile(mediaQuery) ? 25 : 75, vertical: 25),
        child: Column(
          mainAxisAlignment: isMobile(mediaQuery)
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
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
                child: Column(
                  mainAxisAlignment: isMobile(mediaQuery)
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HeadingText(
                        text: "Verify your email address",
                        fontSize:
                            isMobile(mediaQuery) ? FontSizes.h3 : FontSizes.h1),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: isMobile(mediaQuery) ? 20 : 25,
                          horizontal: isMobile(mediaQuery) ? 25 : 0),
                      child: Column(
                        children: [
                          BodyText(
                              text: "We've sent a verification code to $email",
                              textAlign: TextAlign.center,
                              fontSize: isMobile(mediaQuery)
                                  ? FontSizes.p1
                                  : FontSizes.h5),
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: isMobile(mediaQuery) ? 25 : 0),
                              child: BodyText(
                                  text: "Not you?",
                                  textAlign: TextAlign.center,
                                  fontSize: isMobile(mediaQuery)
                                      ? FontSizes.p1
                                      : FontSizes.h5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: isMobile(mediaQuery) ? 20 : 25,
                          horizontal: isMobile(mediaQuery) ? 25 : 0),
                      child: HeadingText(
                          textAlign: TextAlign.center,
                          text:
                              "Please enter the code below to confirm your email address",
                          fontSize: isMobile(mediaQuery)
                              ? FontSizes.p1
                              : FontSizes.h5),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 72,
                              height: 72,
                              child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: PrimaryTextFormField(
                                      controller: controllerCodeOne,
                                      maxLength: 1,
                                      hintText: "",
                                      onChanged: (e) {
                                        controllerCodeOne.text = e;
                                      }))),
                          SizedBox(
                              width: 72,
                              height: 72,
                              child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: PrimaryTextFormField(
                                      controller: controllerCodeTwo,
                                      maxLength: 1,
                                      hintText: "",
                                      onChanged: (e) {
                                        controllerCodeTwo.text = e;
                                      }))),
                          SizedBox(
                              width: 72,
                              height: 72,
                              child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: PrimaryTextFormField(
                                      controller: controllerCodeThree,
                                      maxLength: 1,
                                      hintText: "",
                                      onChanged: (e) {
                                        controllerCodeThree.text = e;
                                      }))),
                          SizedBox(
                              width: 72,
                              height: 72,
                              child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: PrimaryTextFormField(
                                      controller: controllerCodeFour,
                                      maxLength: 1,
                                      hintText: "",
                                      onChanged: (e) {
                                        controllerCodeFour.text = e;
                                      }))),
                          SizedBox(
                              width: 72,
                              height: 72,
                              child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: PrimaryTextFormField(
                                      controller: controllerCodeFive,
                                      maxLength: 1,
                                      hintText: "",
                                      onChanged: (e) {
                                        controllerCodeFive.text = e;
                                      }))),
                          SizedBox(
                              width: 72,
                              height: 72,
                              child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: PrimaryTextFormField(
                                      controller: controllerCodeSix,
                                      maxLength: 1,
                                      hintText: "",
                                      onChanged: (e) {
                                        controllerCodeSix.text = e;
                                      }))),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () async {
                          final code = (controllerCodeOne.text +
                                  controllerCodeTwo.text +
                                  controllerCodeThree.text +
                                  controllerCodeFour.text +
                                  controllerCodeFive.text +
                                  controllerCodeSix.text)
                              .trim();
                          try {
                            final response = await authProvider.verifyEmail(
                                email: email, code: code);
                            if (response) {
                              // ignore: use_build_context_synchronously
                              context.go(AppRoute.emailverified.path);
                            }
                          } catch (e) {
                            // ignore: use_build_context_synchronously
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
                          "Verfy Email",
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
                          text: "Didn't receive the code?",
                          style: const TextStyle(
                            fontSize: FontSizes.p2, // Set text size to 17
                            color: Colors.black, // Default text color
                          ),
                          children: [
                            TextSpan(
                              text: 'Resend Code',
                              style: const TextStyle(
                                fontSize: FontSizes.p2, // Set text size to 17
                                color: Colors
                                    .blue, // Change color to blue for the link
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
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
            )
          ],
        ),
      ),
    );
  }
}