import 'package:culero/app/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:culero/atoms/text/body_text.dart';
import 'package:culero/atoms/text/heading_text.dart';
import 'package:culero/utils/color.dart';
import 'package:culero/utils/font_size.dart';
import 'package:culero/utils/screen_sizes.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';


class EmailIsVerfied extends StatelessWidget {
  const EmailIsVerfied({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: isMobile(mediaQuery) ? 25 : 75, vertical: 25),
        child: Column(
           mainAxisAlignment:isMobile(mediaQuery)? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: isMobile(mediaQuery) ? MainAxisAlignment.center : MainAxisAlignment.start,
                children:  [
                  HeadingText(text: "CULERO", fontSize: 25, fontColor: Theme.of(context).colorScheme.primary),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                width: 582,
                child: Column(
                  mainAxisAlignment:isMobile(mediaQuery)? MainAxisAlignment.start : MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HeadingText(text: "Congratulations", fontSize: isMobile(mediaQuery) ? FontSizes.h3 : FontSizes.h1),
                    HeadingText(text: "Your Email is Verified!", fontSize: isMobile(mediaQuery) ? FontSizes.h3 : FontSizes.h1),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 25, horizontal: isMobile(mediaQuery) ? 25 : 0),
                      child: BodyText(text: "You're all set to explore Culero and connect with professionals from various fields", textAlign: TextAlign.center, fontSize: isMobile(mediaQuery) ? FontSizes.p1 : FontSizes.h5),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Image.asset("assets/images/verified.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25,bottom: 20),
                      child: TextButton(
                        onPressed: () {
                          context.go(AppRoute.home.path);
                        },
                        style: TextButton.styleFrom(
                          minimumSize: const Size(573, 60),
                          foregroundColor: textColor,
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          "Complete your profile",
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(fontWeight: FontWeight.bold, color: bodyText1, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                          text: 'By continuing, you agree to Culero',
                          children: [
                            TextSpan(
                              text: 'Terms of Service',
                              style: TextStyle(fontSize: isMobile(mediaQuery) ? FontSizes.p3 : FontSizes.p1, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                            ),
                            const TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(fontSize: isMobile(mediaQuery) ? FontSizes.p3 : FontSizes.p1, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
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
                                color: Colors.blue, // Change color to blue for the link
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