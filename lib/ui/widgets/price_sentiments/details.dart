import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';

class PriceSentimentDetails extends StatelessWidget {
  const PriceSentimentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 5),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceSmall(context),
            Text(
              'Client Sentiment:',
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.8),
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : const Color(0xff475467),
              ),
            ),
            verticalSpaceSmall(context),
            Container(
              width: double.infinity,
              height: McGyver.rsDoubleH(context, 15),
              decoration: BoxDecoration(
                color: isDarkMode ? const Color(0xff052844) : Colors.white,
                border: Border.all(
                  width: 0.5,
                  color: isDarkMode ? Colors.white : Colors.black38,
                ),
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            verticalSpaceSmall(context),
            verticalSpaceSmall(context),
            Text(
              'Trading Activity',
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.8),
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : const Color(0xff475467),
              ),
            ),
            verticalSpaceSmall(context),
            Container(
              width: double.infinity,
              height: McGyver.rsDoubleH(context, 20),
              decoration: BoxDecoration(
                color: isDarkMode ? const Color(0xff052844) : Colors.white,
                border: Border.all(
                  width: 0.5,
                  color: isDarkMode ? Colors.white : Colors.black38,
                ),
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            verticalSpaceSmall(context),
            verticalSpaceSmall(context),
            Text(
              'Price Range',
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.8),
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : const Color(0xff475467),
              ),
            ),
            verticalSpaceSmall(context),
            Container(
              width: double.infinity,
              height: McGyver.rsDoubleH(context, 25),
              decoration: BoxDecoration(
                color: isDarkMode ? const Color(0xff052844) : Colors.white,
                border: Border.all(
                  width: 0.5,
                  color: isDarkMode ? Colors.white : Colors.black38,
                ),
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            verticalSpaceSmall(context),
            verticalSpaceSmall(context),
            Text(
              'Price Volatility',
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.8),
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : const Color(0xff475467),
              ),
            ),
            verticalSpaceSmall(context),
            Container(
              width: double.infinity,
              height: McGyver.rsDoubleH(context, 25),
              decoration: BoxDecoration(
                color: isDarkMode ? const Color(0xff052844) : Colors.white,
                border: Border.all(
                  width: 0.5,
                  color: isDarkMode ? Colors.white : Colors.black38,
                ),
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            verticalSpaceMedium(context),
          ],
        ),
      ),
    );
  }
}
