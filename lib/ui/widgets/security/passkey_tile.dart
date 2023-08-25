import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';

class PasskeyTile extends StatelessWidget {
  const PasskeyTile({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.only(
        bottom: McGyver.rsDoubleH(context, 1.2),
        left: McGyver.rsDoubleW(context, 6),
        right: McGyver.rsDoubleW(context, 6),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icons/security_user.svg",
            height: McGyver.rsDoubleW(context, 6),
            width: McGyver.rsDoubleW(context, 6),
            colorFilter: ColorFilter.mode(
              isDarkMode ? const Color(0xff98A2B3) : const Color(0xFF667085),
              BlendMode.srcIn,
            ),
          ),
          horizontalSpaceSmall(context),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Passkey",
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 2.1),
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? const Color(0xFFD0D5DD)
                        : const Color(0xFF667085),
                  ),
                ),
                SizedBox(
                  height: McGyver.rsDoubleH(context, 0.3),
                ),
                Text(
                  "Added: 12 July, 2023",
                  textAlign: TextAlign.left,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.4),
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF98A2B3),
                  ),
                ),
                Text(
                  "Last used: 2 days ago",
                  textAlign: TextAlign.left,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.4),
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF98A2B3),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              SvgPicture.asset(
                height: McGyver.rsDoubleH(context, 2.6),
                width: McGyver.rsDoubleH(context, 2.6),
                'assets/images/edit.svg',
                colorFilter: ColorFilter.mode(
                  isDarkMode
                      ? const Color(0xff98A2B3)
                      : const Color(0xFF667085),
                  BlendMode.srcIn,
                ),
              ),
              horizontalSpaceXSmall(context),
              SvgPicture.asset(
                height: McGyver.rsDoubleH(context, 2.6),
                width: McGyver.rsDoubleH(context, 2.6),
                'assets/images/trash.svg',
                colorFilter: ColorFilter.mode(
                  isDarkMode
                      ? const Color(0xff98A2B3)
                      : const Color(0xFF667085),
                  BlendMode.srcIn,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
