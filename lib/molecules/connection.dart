import 'package:flutter/material.dart';
import 'package:culero/atoms/card/secondary_card.dart';
import 'package:culero/atoms/text/body_text.dart';
import 'package:culero/atoms/text/heading_text.dart';
import 'package:culero/utils/font_size.dart';

// This is connection widget
class Connection extends StatelessWidget {
  final Map<String, String> data;
  const Connection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SecondaryCard(
      border: false,
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(data['avatar']!),
                    ),
                  ),
                  Positioned(
                      left: 75,
                      top: 70,
                      child: Image.asset(
                        "assets/images/green-tick.png",
                        height: 30,
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    HeadingText(text: data["name"]!),
                    BodyText(
                      text: data["title"]!,
                      fontSize: FontSizes.p3,
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 32),
                child: Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.message_outlined)),
                    const BodyText(text: "Write review"),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz_outlined)),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
