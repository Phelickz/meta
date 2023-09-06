import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';

class CustomProgressIndicator extends StatelessWidget {
  final Color color;
  final double progressPercentage;
  const CustomProgressIndicator({super.key, required this.color, required this.progressPercentage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 27.pHeight(context),
      // width: 154.pWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 4.pHeight(context),
            width: 154.pWidth(context),
            color: const Color(0xFFE4E7EC),
            child: Stack(
              children: [
                Container(
                  height: 4.pHeight(context),
                  width: 100*progressPercentage.pWidth(context),
                  color: color,
                )
              ],
            ),
          ),

          SizedBox(height: 8.pHeight(context),),
          Text(
            "${progressPercentage * 100}%",
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.2),
              color: color,
              fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}