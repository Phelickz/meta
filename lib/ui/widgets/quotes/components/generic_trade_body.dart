import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/ui/widgets/quotes/components/custom_progress_indicator.dart';
import 'package:meta_trader/ui/widgets/quotes/trade_utils.dart';
import 'package:meta_trader/ui/widgets/textfields/textfield.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/utils/theme.dart';

class GenericTradeBody extends StatelessWidget {
  const GenericTradeBody({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Lot Size",
        style: CustomThemeData.generateStyle(
          fontSize: McGyver.textSize(context, 1.6),
          color: isDarkMode ? Colors.white : const Color(0xFF98A2B3),
          fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.pHeight(context),),
        IncrementContainer(() => null, () => null, const Text("2.0")),

        SizedBox(height: 16.pHeight(context),),

        Row(
          children: [
            Expanded(
              child: 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Stop Loss",
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.6),
                        color: isDarkMode ? Colors.white : const Color(0xFF98A2B3),
                        fontWeight: FontWeight.bold),
                      ),
                  SizedBox(height: 8.pHeight(context),),
                  IncrementContainer(() => null, () => null, const Text("2.0")),
                ],
              ),
            ),
            SizedBox(width: 21.pWidth(context),),
            Expanded(
              child: 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Take Profit",
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.6),
                        color: isDarkMode ? Colors.white : const Color(0xFF98A2B3),
                        fontWeight: FontWeight.bold),
                      ),
                  SizedBox(height: 8.pHeight(context),),
                  IncrementContainer(() => null, () => null, const Text("2.0")),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.pHeight(context),),
        Text("Fill Policy",
        style: CustomThemeData.generateStyle(
          fontSize: McGyver.textSize(context, 1.6),
          color: isDarkMode ? Colors.white : const Color(0xFF98A2B3),
          fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.pHeight(context),),
        Container(
          height: 56.pHeight(context),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isDarkMode ? Colors.white : const Color(0xFF98A2B3)
            )
          ),
          padding: EdgeInsets.symmetric(horizontal: 18.pWidth(context), vertical: 10.pHeight(context)),
          child: Text("Fill or Kill", 
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.6),
            color: const Color(0xff98A2B3),
            fontWeight: FontWeight.w400)
          ),
        ),

        SizedBox(height: 16.pHeight(context),),

// just for testing how the toogle looks like
        'k' == 'o' 
        ? Container(
          height: 56.pHeight(context),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isDarkMode ? Colors.white : const Color(0xFF98A2B3)
            )
          ),
          padding: EdgeInsets.symmetric(horizontal: 18.pWidth(context), vertical: 10.pHeight(context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Duration",
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.6),
                  color: isDarkMode ? Colors.white : const Color(0xFF98A2B3),
                  fontWeight: FontWeight.w400)
              ),
              CupertinoSwitch(value: false, onChanged: (_){},)
            ],
          ),
        )
        : toggleContainer(context, isDarkMode),
      
          SizedBox(height: 32.pHeight(context),),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  children: [
                    showText("63.2", "23", "8"),
                    SizedBox(height: 8.pHeight(context),),
                    sellByMarket(() => null),
                    SizedBox(height: 8.pHeight(context),),
                    const CustomProgressIndicator(progressPercentage: 0.23, color: Color(0xFFF04438)),
                  ],
                ),
              ),
              SizedBox(width: 21.pWidth(context),),
              Expanded(
                child: Column(
                  children: [
                    showText("63.2", "23", "8"),
                    SizedBox(height: 8.pHeight(context),),
                    buyByMarket(() => null),
                    SizedBox(height: 8.pHeight(context),),
                    const CustomProgressIndicator(progressPercentage: 0.77, color: Color(0xFF0C95EF)),
                  ],
                ),
              )
            ],
          )

      ],
    );
  }

  Container toggleContainer(BuildContext context, bool isDarkMode) {
    return Container(
        height: 218.pHeight(context),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isDarkMode ? Colors.white : const Color(0xFF98A2B3)
          )
        ),
        // padding: EdgeInsets.symmetric(horizontal: 18.pWidth(context), vertical: 10.pHeight(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18.pWidth(context),),
              height: 66.pHeight(context),
              width: double.infinity,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Duration",
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 2.2),
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w400)
                  ),
                  CupertinoSwitch(value: true, activeColor: const Color(0xFF0C95EF) ,onChanged: (_){},)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18.pWidth(context), vertical: 5),
              height: 150.pHeight(context),
              width: double.infinity,
              decoration: BoxDecoration(
                color: isDarkMode ? ColorManager.darkHeaderColor : const Color(0xFFF5FBFE),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: 
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text("Time Frame",
                                style: CustomThemeData.generateStyle(
                                  fontSize: McGyver.textSize(context, 1.6),
                                  color: isDarkMode ? Colors.white : const Color(0xFF98A2B3),
                                  fontWeight: FontWeight.bold),
                                ),
                            SizedBox(height: 8.pHeight(context),),
                            IncrementContainer(() => null, () => null, const Text("2.0")),
                          ],
                        ),
                      ),
                      SizedBox(width: 21.pWidth(context),),
                      Expanded(
                        child: 
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text("Current Price",
                                style: CustomThemeData.generateStyle(
                                  fontSize: McGyver.textSize(context, 1.6),
                                  color: isDarkMode ? Colors.white : const Color(0xFF98A2B3),
                                  fontWeight: FontWeight.bold),
                                ),
                            SizedBox(height: 8.pHeight(context),),
                            IncrementContainer(() => null, () => null, const Text("2.0")),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    "In 1 Hour at 10:41 on 29th July 2023 your trade will automatically close",
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.0),
                      color: isDarkMode ? const Color(0xFF98A2B3) : const Color(0xFF20A0F3),
                      fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 10.pHeight(context),)
                ],
              )
            )
          ],
        ),
      );
  }

  Widget sellByMarket(Function() onTap){
    return Builder(
      builder: (context) {
        return InkWell(
          onTap: onTap,
          child: Container(
            height: 48.pHeight(context),
            // width: 154.dWidth(context),
            decoration: BoxDecoration(
              color: const Color(0xFFF04438),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                "Sell by Market",
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.4),
                  color: Colors.white,
                  fontWeight: FontWeight.w400)
            )),
          ),
        );
      }
    );
  }

  Widget buyByMarket(Function() onTap){
    return Builder(
      builder: (context) {
        return InkWell(
          onTap: onTap,
          child: Container(
            height: 48.pHeight(context),
            // width: 154.pWidth(context),
            decoration: BoxDecoration(
              color: const Color(0xFF0C95EF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                "Buy by Market",
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.4),
                  color: Colors.white,
                  fontWeight: FontWeight.w400)
            )),
          ),
        );
      }
    );
  }

  Widget showText(String askingPricePrimary, String askingPriceSecondary, askingPips){
    return Builder(
      builder: (context) {
        var isDarkMode = CustomThemeData.isDarkMode(context);
        return RichText(
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
              TextSpan(
                text: askingPips,
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
              ),
            ])
      ]));
      }
    );
  }
}