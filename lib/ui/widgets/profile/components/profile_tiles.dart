import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/color_manager.dart';

import '../../../../app/utils/theme.dart';

class ProfileTiles extends StatelessWidget {
  final String title;
  final String subTitle;
  final String leadingIcon;
  final String? trailingIcon;
  final VoidCallback? onTap;
  const ProfileTiles(
      {Key? key,
      required this.title,
      required this.subTitle,
      this.onTap,
      required this.leadingIcon,
      this.trailingIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return SizedBox(
      width: double.infinity,
      child: ListTile(
        onTap: onTap,
        leading: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 10),
          width: 20,
          // height: 20,
          child: SvgPicture.asset(leadingIcon),
        ),
        title: Text(
          title,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.9),
            fontWeight: FontWeight.w700,
            color: isDarkMode ? ColorManager.darkText : ColorManager.lightText,
          ),
        ),
        subtitle: Text(
          subTitle,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.2),
            fontWeight: FontWeight.w400,
            color: isDarkMode ? ColorManager.darkText : ColorManager.lightText,
          ),
        ),
        trailing: Container(
          alignment: Alignment.center,
          width: 20,
          height: 20,
          child: trailingIcon != null
              ? Icon(
                  Icons.arrow_forward_ios,
                  color: isDarkMode
                      ? const Color(0xff98A2B3)
                      : const Color(0xFF667085).withOpacity(0.7),
                )
              : Container(),
          // child: SvgPicture.asset(trailingIcon ?? ""),
        ),
      ),
    );
  }
}
