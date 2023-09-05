import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
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
    return Card(
      elevation: 0,
      color: isDarkMode ? const Color(0xff052844) : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: isDarkMode ? const Color(0xff052844) : Colors.black12,
        ),
      ),
      child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 16.pWidth(context), vertical: 16.pHeight(context)),
          decoration: BoxDecoration(
            color: isDarkMode ? const Color(0xff052844) : Colors.white,
            borderRadius: BorderRadius.circular(8),
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
                        horizontalSpaceXXSmall(context),
                        Text(
                          currencyPair,
                          style: CustomThemeData.generateColoredStyle(
                              fontSize: McGyver.textSize(context, 2),
                              fontWeight: FontWeight.bold,
                              context: context),
                        )
                      ],
                    ),
                    verticalSpaceXXSmall(context),
                    Text(
                      currencyPairFull,
                      style: CustomThemeData.generateColoredStyle(
                        fontSize: McGyver.textSize(context, 1.1),
                        context: context,
                        lightTextColor: const Color(0xff667085),
                      ),
                    ),
                    verticalSpaceXXSmall(context),
                    Row(
                      children: [
                        Text(
                          percentageChange + '%',
                          style: CustomThemeData.generateColoredStyle(
                              fontSize: 8, context: context),
                        ),
                        horizontalSpaceXXSmall(context),
                        Container(
                          height: 4.pHeight(context),
                          width: 75.pWidth(context),
                          color: isDarkMode
                              ? CustomThemeData
                                  .darkTheme.scaffoldBackgroundColor
                              : const Color(0xffE4E7EC),
                          child: FractionallySizedBox(
                            widthFactor: double.parse(percentageChange) / 100,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: trend == "positive"
                                      ? const Color(0xff77C5F8)
                                      : const Color(
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
              const Spacer(),
              Center(
                child: SizedBox(
                  width: 40.pWidth(context),
                  height: 40.pHeight(context),
                  child: SvgPicture.asset(trend == "positive"
                      ? AssetManager.upTrendChart
                      : AssetManager.downTrendChart),
                ),
              ),
              const Spacer(),
              // SizedBox(
              //   width: 20.pWidth(context),
              // ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      bidPrice,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: McGyver.textSize(context, 2),
                          context: context),
                    ),
                    verticalSpaceXXSmall(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        trend == "positive"
                            ? const Icon(
                                Icons.arrow_upward,
                                color: Colors.blue,
                                size: 20,
                              )
                            : const Icon(
                                Icons.arrow_downward,
                                color: Colors.red,
                                size: 20,
                              ),
                        Text(
                          spread + '%',
                          style: CustomThemeData.generateColoredStyle(
                              fontSize: McGyver.textSize(context, 1.3),
                              context: context),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: onPressed,
                child: Icon(
                  Icons.star,
                  color: isFav ? Colors.yellow : Colors.grey,
                ),
              )
            ],
          )),
    );
  }
}
