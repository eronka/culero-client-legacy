import 'package:flutter/material.dart';


// This is linear indictor background color , value color and height can be changed 

class Indicator extends StatelessWidget {
  final double? value;
  final Color? color;
  final Color backgroundColor;
  final double? height;
  final BorderRadius borderRadius;
  const Indicator({
    super.key,
    this.color,
    this.backgroundColor= Colors.white,
    this.height,
    this.value,
    this.borderRadius = const BorderRadius.all(Radius.circular(25)),
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      minHeight: height,


      backgroundColor: backgroundColor,
      valueColor: AlwaysStoppedAnimation<Color>(color ?? Theme.of(context).colorScheme.secondary),
      borderRadius: borderRadius,
    );
  }
}
