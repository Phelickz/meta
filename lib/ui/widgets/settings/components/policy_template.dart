import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';

class PolicyTemplate extends StatelessWidget {
  final String title;
  final int index;
  final String titleDescription;
  final String subtitle;
  final String subtitleDescription;
  final int subTitleCount;
  const PolicyTemplate(
      {Key? key,
      required this.index,
      required this.title,
      required this.subtitle,
      required this.subtitleDescription,
      required this.subTitleCount,
      required this.titleDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${index + 1}. $title",
            style: CustomThemeData.generateColoredStyle(
                fontSize: 16, context: context, fontWeight: FontWeight.bold),
          ),
          Text(
            titleDescription,
            style: CustomThemeData.generateColoredStyle(
                fontSize: 12, context: context),
          ),
          SizedBox(
            height: 5.pHeight(context),
          ),
          SizedBox(
            width: double.infinity,
            child: ListView.builder(
                itemCount: subTitleCount,
                itemBuilder: (context, index) {
                  return RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: " . $subtitle:",
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 12,
                          context: context,
                          fontWeight: FontWeight.w700),
                    )
                  ]));
                }),
          )
        ],
      ),
    );
  }
}
