import 'package:culero/app/resources/app_colors.dart';
import 'package:flutter/material.dart';

// This card has white color background and it can be changed and it has
// border with default border color and it also can be changed
class SecondaryCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final bool border;
  final double? height;
  final double? width;
  final Color? borderColor;
  final Color? color;
  const SecondaryCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(8),
    this.border = true,
    this.height,
    this.width,
    this.borderColor,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? AppColor.white,
        borderRadius: BorderRadius.circular(15),
        border: border
            ? Border.all(
                color: borderColor ?? Theme.of(context).colorScheme.primary,
                width: 1)
            : null,
      ),
      child: child,
    );
  }
}
