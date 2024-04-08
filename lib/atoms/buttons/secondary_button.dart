import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app/resources/app_colors.dart';
import 'button_config.dart';


// Button has borders of primary color and background of transperant.
class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  final Color? titleColor;
  final ButtonSize size;

  final double radius;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,

    this.titleColor,
    this.size = ButtonSize.md,
    this.radius = ButtonRadius.medium,
  });

  double _buttonHeight(ButtonSize size) {
    switch (size) {
      case ButtonSize.sm:
        return 40.0;
      case ButtonSize.md:
        return 50.0;
      case ButtonSize.lg:
        return 60.0;
      default:
        return 50.0;
    }
  }

  TextStyle _titleStyle(Color titleColor, ButtonSize size) {
    switch (size) {
      case ButtonSize.sm:
        return TextStyle(fontWeight: FontWeight.w300, color: titleColor, fontSize: 14);

      case ButtonSize.md:
        return TextStyle(fontWeight: FontWeight.w400, color: titleColor, fontSize: 18);

      case ButtonSize.lg:
        return TextStyle(fontWeight: FontWeight.w500, color: titleColor, fontSize: 20);

      default:
        return TextStyle(fontWeight: FontWeight.w400, color: titleColor, fontSize: 18);
    }
  }

  @override
  Widget build(BuildContext context) {
    return  TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            fixedSize: Size.fromHeight(_buttonHeight(size)),
          foregroundColor: titleColor ?? AppColor.black,
          backgroundColor: Colors
              .transparent,
          side: BorderSide(color: Theme.of(context).colorScheme.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            textStyle: _titleStyle(titleColor ?? AppColor.black, size),
          ),
        ),

    );
  }
}
