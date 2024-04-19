import 'package:culero/app/resources/app_colors.dart';
import 'package:flutter/material.dart';

/// The color scheme for the app.
ColorScheme get appColorScheme => ColorScheme.light(
      primary: AppColor.primary,
      onPrimary: AppColor.white,
      background: AppColor.primary.l2,
      onBackground: AppColor.darkGrey,
      error: AppColor.error,
      onError: AppColor.black,
      errorContainer: AppColor.error,
      onErrorContainer: AppColor.black,
      secondary: AppColor.primary.l1,
      onSecondary: AppColor.black,
      outline: AppColor.lightGrey,
      outlineVariant: AppColor.darkGrey,
      surface: AppColor.white,
      onSurface: AppColor.darkGrey,
      surfaceTint: AppColor.darkGrey,
      tertiary: AppColor.success,
      onTertiary: AppColor.black,
      primaryContainer: AppColor.primary,
      onPrimaryContainer: AppColor.white,
      secondaryContainer: AppColor.white,
      onSecondaryContainer: AppColor.darkGrey,
      scrim: AppColor.darkGrey,
      
    );
