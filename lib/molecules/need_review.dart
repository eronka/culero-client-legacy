import 'package:flutter/material.dart';
import 'package:culero/atoms/text/body_text.dart';
import 'package:culero/atoms/text/heading_text.dart';
import 'package:culero/utils/font_size.dart';

class NeedReview extends StatelessWidget {
  final Map<String, String> data;
  const NeedReview({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage(data['avatar']!),
      ),
      title: HeadingText(text: data['name']!, fontSize: FontSizes.p2),
      subtitle: BodyText(text: data['title']!, fontSize: FontSizes.p2),
      trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.rate_review_outlined),
          iconSize: 30),
    );
  }
}
