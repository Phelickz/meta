import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/responsiveness/size.dart';
import '../../../../app/utils/theme.dart';

class AutoLockTile extends StatelessWidget {
  final bool value;
  final Function(bool)? onChanged;
  final String assetName;
  final String title;
  final String subtitle;
  const AutoLockTile({
    super.key,
    required this.assetName,
    required this.title,
    required this.subtitle,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      margin: EdgeInsets.only(
        bottom: McGyver.rsDoubleH(context, 2),
      ),
      child: Row(
        children: [
          SizedBox(
            width: McGyver.rsDoubleW(context, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  assetName,
                  height: McGyver.rsDoubleW(context, 7),
                  width: McGyver.rsDoubleW(context, 7),
                  colorFilter: ColorFilter.mode(
                    isDarkMode
                        ? const Color(0xff98A2B3)
                        : const Color(0xFF667085),
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
          horizontalSpaceSmall(context),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 2.2),
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
                  subtitle,
                  textAlign: TextAlign.left,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.5),
                    fontWeight: FontWeight.w500,
                    color: isDarkMode
                        ? const Color(0xFFD0D5DD)
                        : const Color(0xFF667085),
                  ),
                ),
              ],
            ),
          ),
          CupertinoSwitch(
            activeColor: Theme.of(context).primaryColor,
            value: value,
            onChanged: onChanged,
          )
        ],
      ),
    );
  }
}
