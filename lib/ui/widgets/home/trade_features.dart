// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';

class TradeFeatures extends StatelessWidget {
  const TradeFeatures(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      this.onTap});
  final String image;
  final String title;
  final String subtitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: isDarkMode
            ? Theme.of(context).scaffoldBackgroundColor
            : Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isDarkMode ? Colors.white24 : Colors.black12,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: McGyver.rsDoubleW(context, 30),
            // height: McGyver.rsDoubleH(context, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  image,
                  color: isDarkMode
                      ? const Color(0xff8ACDF9)
                      : Theme.of(context).primaryColor,
                ),
                verticalSpaceXSmall(context),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.7),
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                verticalSpaceXSmall(context),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.3),
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
