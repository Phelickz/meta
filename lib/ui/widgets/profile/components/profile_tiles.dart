import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/utils/colorManager.dart';

import '../../../../app/utils/theme.dart';

class ProfileTiles extends StatelessWidget {
  final String title;
  final String subTitle;
  final String leadingIcon;
  final String? trailingIcon;
  final VoidCallback? onTap;
  ProfileTiles(
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
          padding: EdgeInsets.symmetric(vertical: 10),
          width: 20,
          // height: 20,
          child: SvgPicture.asset(leadingIcon),
        ),
        title: Text(
          title,
          style: CustomThemeData.generateStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: isDarkMode ? ColorManager.darkText : ColorManager.lightText,
          ),
        ),
        subtitle: Text(
          subTitle,
          style: CustomThemeData.generateStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: isDarkMode ? ColorManager.darkText : ColorManager.lightText,
          ),
        ),
        trailing: Container(
          alignment: Alignment.center,
          width: 20,
          height: 20,
          child: SvgPicture.asset(trailingIcon ?? ""),
        ),
      ),
    );
  }
}
