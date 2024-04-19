import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:culero/atoms/text/heading_text.dart';
import 'package:culero/atoms/card/secondary_card.dart';
import 'package:culero/atoms/indicator/indicator.dart';
import 'package:culero/utils/color.dart';
import 'package:culero/utils/font_size.dart';

// This is Rating card
class Rating extends StatelessWidget {
  final Map<String, double> data;
  const Rating({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SecondaryCard(
        border: false,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HeadingText(
                        text: data["over_all"].toString(),
                        fontSize: 64,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: HeadingText(
                          text: "/",
                          fontSize: 32,
                        ),
                      ),
                      const HeadingText(
                        text: "5",
                        fontSize: 32,
                      )
                    ],
                  ),
                  const HeadingText(
                    text: "Overall Rate",
                    fontColor: bodyText2,
                    fontSize: FontSizes.h2,
                  )
                ],
              ),
              Row(
                children: [
                  const Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: HeadingText(text: "Professionalism", fontSize: FontSizes.h5, fontColor: bodyText2),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: HeadingText(text: "Reliability", fontSize: FontSizes.h5, fontColor: bodyText2),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: HeadingText(text: "Communication", fontSize: FontSizes.h5, fontColor: bodyText2),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: SizedBox(
                          width: 200,
                          child: Indicator(
                            height: 20,
                            value: data["Professionalism"] ?? 0 / 5,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: SizedBox(
                          width: 200,
                          child: Indicator(
                            height: 20,
                            value: data["Reliability"] ?? 0 / 5,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: SizedBox(
                          width: 200,
                          child: Indicator(
                            height: 20,
                            value: data["Communication"] ?? 0 / 5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HeadingText(
                            text: data["Professionalism"].toString(),
                            fontSize: 24,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: HeadingText(
                              text: "/",
                              fontSize: 13,
                            ),
                          ),
                          const HeadingText(
                            text: "5",
                            fontSize: 13,
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HeadingText(
                            text: data["Reliability"].toString(),
                            fontSize: 24,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: HeadingText(
                              text: "/",
                              fontSize: 13,
                            ),
                          ),
                          const HeadingText(
                            text: "5",
                            fontSize: 13,
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HeadingText(
                            text: data["Communication"].toString(),
                            fontSize: 24,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: HeadingText(
                              text: "/",
                              fontSize: 13,
                            ),
                          ),
                          const HeadingText(
                            text: "5",
                            fontSize: 13,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
