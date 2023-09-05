import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';

class AdvancedViewTile extends StatelessWidget {
  final String percentageChange,
      currencyPair,
      spread,
      time,
      pairId,
      askingPricePrimary,
      askingPriceSecondary,
      sellingPricePrimary,
      askingPips,
      sellingPips,
      sellingPriceSecondary,
      low,
      trend,
      high;
  final bool isFav;
  final VoidCallback? onPressed;

  const AdvancedViewTile(
      {Key? key,
      required this.time,
      required this.askingPricePrimary,
      required this.askingPriceSecondary,
      required this.currencyPair,
      required this.high,
      required this.low,
      required this.pairId,
      required this.percentageChange,
      required this.sellingPricePrimary,
      required this.sellingPriceSecondary,
      required this.askingPips,
      required this.sellingPips,
      required this.isFav,
      required this.spread,
      required this.trend,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.pHeight(context)),
      child: Row(
        children: [
          Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "-$pairId ",
                    style: CustomThemeData.generateColoredStyle(
                        fontSize: 8, context: context)),
                TextSpan(
                    text: trend == "positive"
                        ? "$percentageChange %"
                        : "-$percentageChange %",
                    style: CustomThemeData.generateColoredStyle(
                        fontSize: 8,
                        darkTextColor: Color(0xffF97066),
                        lightTextColor: Color(0xffF04438),
                        context: context))
              ])),
              Text(currencyPair,
                  style: CustomThemeData.generateColoredStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      context: context)),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "$time | ",
                    style: CustomThemeData.generateColoredStyle(
                        fontSize: 8, context: context)),
                TextSpan(
                    text: "Spread: ",
                    style: CustomThemeData.generateColoredStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 8,
                        context: context)),
                TextSpan(text: spread)
              ])),
            ],
          )),
          SizedBox(
            width: 65.pWidth(context),
          ),
          Container(
              child: Column(
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: askingPricePrimary,
                    style: CustomThemeData.generateColoredStyle(
                        fontSize: 16,
                        darkTextColor: Color(0xff77C5F8),
                        lightTextColor: Color(0xff20A0F3),
                        context: context)),
                TextSpan(
                    text: askingPriceSecondary,
                    style: CustomThemeData.generateColoredStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        darkTextColor: Color(0xff77C5F8),
                        lightTextColor: Color(0xff20A0F3),
                        context: context),
                    children: [
                      WidgetSpan(
                          child: Text(
                        askingPips,
                        style: TextStyle(
                          fontSize: 10,
                          color: isDarkMode
                              ? Color(0xff77C5F8)
                              : Color(
                                  0xff20A0F3), // Adjust the font size for superscript
                          textBaseline: TextBaseline
                              .alphabetic, // Use alphabetic baseline for superscript
                          fontWeight: FontWeight
                              .normal, // You can adjust this as needed
                        ),
                      )),
                    ])
              ])),
              Text(
                "L: $low",
                textAlign: TextAlign.end,
                style: CustomThemeData.generateColoredStyle(
                    fontSize: 10, context: context),
              )
            ],
          )),
          SizedBox(width: 5.pWidth(context)),
          Container(
              child: Column(
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: sellingPricePrimary,
                    style: CustomThemeData.generateColoredStyle(
                        fontSize: 16,
                        darkTextColor: Color(0xffF97066),
                        lightTextColor: Color(0xffF04438),
                        context: context)),
                TextSpan(
                    text: sellingPriceSecondary,
                    style: CustomThemeData.generateColoredStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        darkTextColor: Color(0xffF97066),
                        lightTextColor: Color(0xffF04438),
                        context: context),
                    children: [
                      WidgetSpan(
                          child: Text(
                        sellingPips,
                        style: TextStyle(
                          fontSize: 10,
                          color: isDarkMode
                              ? Color(0xffF97066)
                              : Color(
                                  0xffF04438), // Adjust the font size for superscript
                          textBaseline: TextBaseline
                              .alphabetic, // Use alphabetic baseline for superscript
                          fontWeight: FontWeight
                              .normal, // You can adjust this as needed
                        ),
                      )),
                    ])
              ])),
              Text(
                "H: $high",
                textAlign: TextAlign.end,
                style: CustomThemeData.generateColoredStyle(
                    fontSize: 10, context: context),
              )
            ],
          )),
          SizedBox(
            width: 14.pWidth(context),
          ),
          InkWell(
            onTap: onPressed,
            child: Icon(
              Icons.star,
              color: isFav ? Colors.yellow : Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
