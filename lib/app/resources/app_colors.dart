import 'package:flutter/material.dart';

/// The color constants used in the app.
extension AppColor on MaterialColor {
  /// The primary color swatch.
  static const MaterialColor primary = MaterialColor(
    0xFF397AFF,
    {
      100: _primaryL2Color,
      300: _primaryL1Color,
      500: _primaryColor,
    },
  );

  static const _primaryColor = Color(0xFF397AFF);
  static const _primaryL1Color = Color(0xFF95B8FF);
  static const _primaryL2Color = Color(0xFFF5F6F8);

  /// The color swatch of neutral tones.
  static const MaterialColor neutral = MaterialColor(
    0xFF000000,
    {
      100: white,
      300: lightGrey,
      500: grey,
      700: darkGrey,
      900: black,
    },
  );

  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGrey = Color(0xFFF1F1F1);
  static const Color grey = Color(0xFFD9D9D9);
  static const Color darkGrey = Color(0xFF4C4C4C);
  static const Color black = Color(0xFF000000);

  static Color get error => const Color(0xFFDC8E89);
  static Color get success => const Color(0xFF90D093);

  /// The tone lighter than the medium tone by two degrees.
  Color get l2 => this[100]!;

  /// The tone lighter than the medium tone by one degree.
  Color get l1 => this[300]!;

  /// The color's medium tone.
  Color get m => this[500]!;

  /// The tone darker than the medium tone by one degree.
  Color get d1 => this[700]!;

  /// The tone darker than the medium tone by two degrees.
  Color get d2 => this[900]!;
}
