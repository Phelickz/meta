import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';

class ModernViewTile extends StatelessWidget {
  final String currencyIcon,
      currencyPair,
      currencyPairFull,
      percentageChange,
      bidPrice,
      trend,
      spread;
  final bool isFav;
  final void Function()? onPressed;

  const ModernViewTile(
      {Key? key,
      required this.spread,
      required this.currencyPair,
      required this.percentageChange,
      required this.bidPrice,
      required this.currencyIcon,
      required this.trend,
      required this.currencyPairFull,
      this.isFav = false,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: 16.pWidth(context), vertical: 16.pHeight(context)),
        decoration: BoxDecoration(
          color: isDarkMode
              ? const Color(0xff052844)
              : Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 4,
              offset: Offset(0, 3), // Adjust the offset as needed
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 131.pWidth(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 22.pWidth(context),
                        height: 22.pHeight(context),
                        child: Image.asset(currencyIcon),
                      ),
                      Text(
                        currencyPair,
                        style: CustomThemeData.generateColoredStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            context: context),
                      )
                    ],
                  ),
                  Text(
                    currencyPairFull,
                    style: CustomThemeData.generateColoredStyle(
                        fontSize: 8, context: context),
                  ),
                  Row(
                    children: [
                      Text(
                        percentageChange,
                        style: CustomThemeData.generateColoredStyle(
                            fontSize: 8, context: context),
                      ),
                      Container(
                        height: 3.pHeight(context),
                        width: 75.pWidth(context),
                        color: isDarkMode
                            ? CustomThemeData.darkTheme.scaffoldBackgroundColor
                            : Color(0xffE4E7EC),
                        child: FractionallySizedBox(
                          widthFactor: double.parse(percentageChange) / 100,
                          child: Container(
                            decoration: BoxDecoration(
                                color: trend == "positive"
                                    ? Color(0xff77C5F8)
                                    : Color(
                                        0xffF97066) // Secondary color for progress
                                ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Center(
                child: SizedBox(
              width: 40.pWidth(context),
              height: 40.pHeight(context),
              child: SvgPicture.asset(trend == "positive"
                  ? AssetManager.upTrendChart
                  : AssetManager.downTrendChart),
            )),
            SizedBox(
              width: 20.pWidth(context),
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    bidPrice,
                    style: CustomThemeData.generateColoredStyle(
                        fontSize: 16, context: context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      trend == "positive"
                          ? Icon(
                              Icons.arrow_upward,
                              color: Colors.blue,
                              size: 20,
                            )
                          : Icon(
                              Icons.arrow_downward,
                              color: Colors.red,
                              size: 20,
                            ),
                      Text(
                        spread,
                        style: CustomThemeData.generateColoredStyle(
                            fontSize: 8, context: context),
                      )
                    ],
                  )
                ],
              ),
            ),
            Spacer(),
            InkWell(
              onTap: onPressed,
              child: Icon(
                Icons.star,
                color: isFav ? Colors.yellow : Colors.grey,
              ),
            )
          ],
        ));
  }
}
