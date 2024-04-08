import 'package:culero/app/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:culero/utils/color.dart';
import 'package:culero/utils/font_size.dart';

class PrimaryTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
final int? maxLength ;
  final TextInputType keyboardType;

  const PrimaryTextFormField({
    super.key,
    required this.hintText,
    required this.onChanged,
     this.controller,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: placehoderText,
      cursorOpacityAnimates: true,
      style: const TextStyle(fontSize: FontSizes.h4),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.lightGrey,
        isDense: true,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: FontSizes.h4,
          color: placehoderText,
        ),
        contentPadding: const EdgeInsets.all(18),
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
        errorBorder:  OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.error)),
        counterText: "",
      ),
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      onEditingComplete: onEditingComplete,
      maxLength: maxLength,
      keyboardType: keyboardType,
    );
  }
}
