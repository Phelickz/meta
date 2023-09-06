import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
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

    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.pHeight(context)),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "-$pairId ",
                        style: CustomThemeData.generateColoredStyle(
                          fontSize: 10,
                          context: context,
                        ),
                      ),
                      TextSpan(
                        text: trend == "positive"
                            ? "$percentageChange %"
                            : "-$percentageChange %",
                        style: CustomThemeData.generateColoredStyle(
                            fontSize: 10,
                            darkTextColor: const Color(0xffF97066),
                            lightTextColor: const Color(0xffF04438),
                            context: context),
                      )
                    ],
                  ),
                ),
                verticalSpaceXXSmall(context),
                Text(
                  currencyPair,
                  style: CustomThemeData.generateColoredStyle(
                      fontSize: McGyver.textSize(context, 2.2),
                      fontWeight: FontWeight.bold,
                      context: context),
                ),
                verticalSpaceXXSmall(context),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "$time | ",
                        style: CustomThemeData.generateColoredStyle(
                            fontSize: 10, context: context),
                      ),
                      TextSpan(
                        text: "Spread: ",
                        style: CustomThemeData.generateColoredStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            context: context),
                      ),
                      TextSpan(
                        text: spread.isEmpty ? '280' : spread,
                        style: CustomThemeData.generateColoredStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 10,
                            context: context),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: askingPricePrimary,
                        style: CustomThemeData.generateColoredStyle(
                            fontSize: McGyver.textSize(context, 2),
                            darkTextColor: const Color(0xff77C5F8),
                            lightTextColor: const Color(0xff20A0F3),
                            context: context),
                      ),
                      TextSpan(
                        text: askingPriceSecondary +
                            '\u00B3', //  https://stackoverflow.com/a/54255383
                        style: CustomThemeData.generateColoredStyle(
                            fontSize: McGyver.textSize(context, 2.7),
                            fontWeight: FontWeight.bold,
                            darkTextColor: const Color(0xff77C5F8),
                            lightTextColor: const Color(0xff20A0F3),
                            context: context),
                        children: const [
                          // TextSpan(
                          //   text: '8',
                          //   style: TextStyle(
                          //     fontSize: 10,
                          //     fontFeatures: [FontFeature.subscripts()],
                          //     color: isDarkMode
                          //         ? const Color(0xff77C5F8)
                          //         : const Color(
                          //             0xff20A0F3,
                          //           ), // Adjust the font size for superscript
                          //     textBaseline: TextBaseline
                          //         .alphabetic, // Use alphabetic baseline for superscript
                          //     fontWeight: FontWeight
                          //         .normal, // You can adjust this as needed
                          //   ),
                          // )
                        ],
                      )
                    ],
                  ),
                ),
                Text(
                  "L: $low",
                  textAlign: TextAlign.end,
                  style: CustomThemeData.generateColoredStyle(
                      fontSize: 10, context: context),
                )
              ],
            ),
            SizedBox(width: 5.pWidth(context)),
            Column(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: sellingPricePrimary,
                          style: CustomThemeData.generateColoredStyle(
                              fontSize: McGyver.textSize(context, 2),
                              darkTextColor: const Color(0xffF97066),
                              lightTextColor: const Color(0xffF04438),
                              context: context)),
                      TextSpan(
                        text: sellingPriceSecondary + '\u00B3',
                        style: CustomThemeData.generateColoredStyle(
                          fontSize: McGyver.textSize(context, 2.7),
                          fontWeight: FontWeight.bold,
                          darkTextColor: const Color(0xffF97066),
                          lightTextColor: const Color(0xffF04438),
                          context: context,
                        ),
                        children: const [
                          // WidgetSpan(
                          //     child: Text(
                          //   sellingPips,
                          //   style: TextStyle(
                          //     fontSize: 10,
                          //     color: isDarkMode
                          //         ? const Color(0xffF97066)
                          //         : const Color(
                          //             0xffF04438), // Adjust the font size for superscript
                          //     textBaseline: TextBaseline
                          //         .alphabetic, // Use alphabetic baseline for superscript
                          //     fontWeight: FontWeight
                          //         .normal, // You can adjust this as needed
                          //   ),
                          // )),
                        ],
                      )
                    ],
                  ),
                ),
                Text(
                  "H: $high",
                  textAlign: TextAlign.end,
                  style: CustomThemeData.generateColoredStyle(
                      fontSize: 10, context: context),
                )
              ],
            ),
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
      ),
    );
  }
}
