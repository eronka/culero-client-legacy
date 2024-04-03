import 'package:culero/app/resources/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// The app's theme.
ThemeData get appTheme => ThemeData(
      colorScheme: appColorScheme,
      textTheme: GoogleFonts.interTextTheme(),
      useMaterial3: true,
    );