import 'package:culero_client/components/atoms/buttons/button_config.dart';
import 'package:flutter/material.dart';
import 'package:culero_client/utils/color.dart';
import 'package:culero_client/utils/route.dart';
import 'package:google_fonts/google_fonts.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          brightness: MediaQuery.platformBrightnessOf(context),
          seedColor: const Color(0xFF2798EA),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.interTextTheme(),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF2798EA),
            minimumSize: const Size.fromHeight(50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ButtonRadius.medium),
            ),
            elevation: 0,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: primaryBg,
          foregroundColor: Colors.black,
          minimumSize: const Size.fromHeight(50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ButtonRadius.medium),
          ),
          elevation: 0,
        )),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            side: const BorderSide(color: primaryBg),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ButtonRadius.medium),
            ),
            elevation: 0,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ButtonRadius.medium),
            ),
            elevation: 0,
          ),
        ),
      ),
      title: 'Culero',
    );
  }
}
