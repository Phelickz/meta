import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';

class CopiedTraderTile extends StatelessWidget {
  final Function()? onTap;
  const CopiedTraderTile({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(McGyver.rsDoubleW(context, 5)),
        margin: EdgeInsets.only(
          bottom: McGyver.rsDoubleH(context, 1.5),
        ),
        decoration: BoxDecoration(
          color: isDarkMode
              ? const Color(0xFF052844).withOpacity(0.8)
              : const Color(0xffFAFDFF),
          borderRadius: BorderRadius.circular(
            McGyver.rsDoubleW(context, 3),
          ),
          border: !isDarkMode
              ? Border.all(
                  width: 0.8,
                  color: const Color(0xFFE4E7EC),
                )
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/btc.png',
                      width: 25,
                    ),
                    horizontalSpaceXXSmall(context),
                    Text(
                      "Satoshi Nakamoto",
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.9),
                        fontWeight: FontWeight.bold,
                        color: isDarkMode
                            ? const Color(0xffD0D5DD)
                            : const Color(0xFF667085),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: McGyver.rsDoubleW(context, 4),
                  width: McGyver.rsDoubleW(context, 4),
                  child: SvgPicture.asset(
                    "assets/images/arrow_right.svg",
                    colorFilter: ColorFilter.mode(
                      isDarkMode
                          ? const Color(0xff98A2B3)
                          : const Color(0xFF667085),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: McGyver.rsDoubleH(context, 0.5),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Avg PNL:",
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.6),
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff98A2B3),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "32.8",
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.9),
                            fontWeight: FontWeight.bold,
                            color: isDarkMode
                                ? const Color(0xFF94D1F9)
                                : const Color(0xFF47B0F5),
                          ),
                        ),
                        const SizedBox(
                          width: 1,
                        ),
                        Text(
                          "%",
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.4),
                            fontWeight: FontWeight.w500,
                            color: isDarkMode
                                ? const Color(0xFF94D1F9)
                                : const Color(0xFF47B0F5),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: McGyver.rsDoubleH(context, 1),
                    ),
                    Row(
                      children: [
                        Text(
                          "Following since:",
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.4),
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff98A2B3),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "12.08.2023",
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.4),
                            fontWeight: FontWeight.normal,
                            color: isDarkMode
                                ? const Color(0xFFD0D5DD)
                                : const Color(0xFF47B0F5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
