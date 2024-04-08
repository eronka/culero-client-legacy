import 'package:flutter/material.dart';
import 'package:culero/utils/color.dart';
import 'package:culero/utils/font_size.dart';
import 'package:google_fonts/google_fonts.dart';


// Heading text it can be used as title.
class HeadingText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color fontColor;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final TextAlign textAlign;
  const HeadingText({
    super.key,
    required this.text,
    this.fontColor = textColor,
    this.fontSize = FontSizes.h3,
    this.fontWeight = FontWeight.w600,
    this.fontStyle = FontStyle.normal,
    this.textAlign = TextAlign.justify,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      style: GoogleFonts.inter(
        textStyle: TextStyle(
          color: fontColor,
          fontStyle: fontStyle,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
