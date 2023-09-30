import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';

class AdvancedViewTile extends StatefulWidget {
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
  State<AdvancedViewTile> createState() => _AdvancedViewTileState();
}

class _AdvancedViewTileState extends State<AdvancedViewTile> {
  bool _showStar = false;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                      text: "-${widget.pairId} ",
                      style: CustomThemeData.generateColoredStyle(
                        fontSize: 10,
                        context: context,
                      ),
                    ),
                    TextSpan(
                      text: widget.trend == "positive"
                          ? "${widget.percentageChange} %"
                          : "-${widget.percentageChange} %",
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
                widget.currencyPair,
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
                      text: "${widget.time} | ",
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 10, context: context),
                    ),
                    TextSpan(
                      text: LocaleKeys.spread.tr(),
                      style: CustomThemeData.generateColoredStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          context: context),
                    ),
                    TextSpan(
                      text: widget.spread.isEmpty ? '280' : widget.spread,
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
          SizedBox(width: 5.pWidth(context)),
          const Spacer(),
          Column(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.askingPricePrimary,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: McGyver.textSize(context, 2),
                          darkTextColor: const Color(0xff77C5F8),
                          lightTextColor: const Color(0xff20A0F3),
                          context: context),
                    ),
                    TextSpan(
                      text: widget.askingPriceSecondary +
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
                "L: ${widget.low}",
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
                        text: widget.sellingPricePrimary,
                        style: CustomThemeData.generateColoredStyle(
                            fontSize: McGyver.textSize(context, 2),
                            darkTextColor: const Color(0xffF97066),
                            lightTextColor: const Color(0xffF04438),
                            context: context)),
                    TextSpan(
                      text: widget.sellingPriceSecondary + '\u00B3',
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
                "H: ${widget.high}",
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
            onTap: () {
              setState(() {
                _showStar = !_showStar;
              });
            },
            child: Icon(
              Icons.star,
              color: _showStar ? Colors.amber : Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
