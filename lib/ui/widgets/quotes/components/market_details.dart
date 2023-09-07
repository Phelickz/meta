import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';

class MarketDetails extends StatelessWidget {
  const MarketDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Euro Vs Great Britain Pounds",
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.6),
            color: isDarkMode ? const Color(0xFF98A2B3) : const Color(0xFF475467),
            fontWeight: FontWeight.bold),
          ),
        SizedBox(height: 20.pHeight(context),),
        viewTile("Digits","2"),
        SizedBox(height: 20.pHeight(context),),
        viewTile("Contract Size","332"),
        SizedBox(height: 20.pHeight(context),),
        viewTile("Spread","35"),
        SizedBox(height: 20.pHeight(context),),
        viewTile("Stops Level","0"),
        SizedBox(height: 20.pHeight(context),),
        viewTile("Contract Size","1211122212"),
        SizedBox(height: 20.pHeight(context),),
        viewTile("Spread","1211122212"),
        SizedBox(height: 20.pHeight(context),),
        viewTile("Stop Level","1211122212"),
        SizedBox(height: 20.pHeight(context),),
        viewTile("Margin Currency","1211122212"),
        SizedBox(height: 20.pHeight(context),),
        viewTile("Profit Currency","1211122212"),
        SizedBox(height: 20.pHeight(context),),
        viewTile("Calculations","1211122212"),
        SizedBox(height: 20.pHeight(context),),
        viewTile("Tick Size","1211122212"),
        SizedBox(height: 20.pHeight(context),),
        viewTile("Tick Value","1211122212"),
        SizedBox(height: 20.pHeight(context),),
      ],
    );
  }

  Widget viewTile(String title, String value) {
    return Builder(
      builder: (context) {
        var isDarkMode = CustomThemeData.isDarkMode(context);
        return Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.6),
                  color: isDarkMode ? Colors.white : const Color(0xFF667085),
                  fontWeight: FontWeight.bold)
              ),
              const Spacer(),
              Text(
                value,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.4),
                  color: const Color(0xFF98A2B3),
                  fontWeight: FontWeight.w400),
              )
            ],
          );
      }
    );
  }
}