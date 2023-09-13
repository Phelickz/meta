// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/utils/theme.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';

class TradingTools extends StatelessWidget {
  const TradingTools(
      {super.key, required this.image, required this.text, this.onTap});
  final String image;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: McGyver.rsDoubleW(context, 15),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDarkMode
                    ? const Color(0xff052844)
                    : Theme.of(context).primaryColor.withOpacity(0.8),
                border: Border.all(
                  color: isDarkMode ? Colors.black : Colors.white,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: SvgPicture.asset(
                    image,
                    color: isDarkMode ? const Color(0xff8ACDF9) : Colors.white,
                  ),
                ),
              ),
            ),
            verticalSpaceXSmall(context),
            Text(
              text,
              textAlign: TextAlign.center,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(
                  context,
                  1.5,
                ),
                fontWeight: FontWeight.normal,
                color: isDarkMode ? Colors.white70 : Colors.black,
              ),
            ),
            verticalSpaceSmall(context)
          ],
        ),
      ),
    );
  }
}
