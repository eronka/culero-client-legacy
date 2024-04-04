import 'package:culero/app/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:culero/utils/color.dart';
import 'package:culero/utils/font_size.dart';


class SearchTextField extends StatelessWidget {
  final Color? backgroundColor;
  final String hintText;
  final TextEditingController controller;
  final VoidCallback? onTap;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final VoidCallback? onSuffixTap;
  final Iterable<Widget>? trailing;

  const SearchTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.backgroundColor,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.onSuffixTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: hintText,
      trailing: trailing,
      side:  MaterialStatePropertyAll<BorderSide>(BorderSide(color: Theme.of(context).colorScheme.primary)),
      elevation: const MaterialStatePropertyAll<double>(0),
      textStyle: const MaterialStatePropertyAll<TextStyle>(TextStyle(fontSize: FontSizes.h4)),
      hintStyle: const MaterialStatePropertyAll<TextStyle>(TextStyle(fontStyle: FontStyle.italic, fontSize: FontSizes.h4, color: placehoderText)),
      backgroundColor: MaterialStatePropertyAll<Color>(backgroundColor ?? AppColor.white),
      padding: const MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(horizontal: 16.0)),
      leading: const Icon(Icons.search, color: placehoderText),
      onTap: onTap,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      controller:controller ,

    );
  }
}
