import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';

class ProfileBar extends StatelessWidget {
  final String name, job, nationality;
  const ProfileBar({
    super.key,
    required this.name,
    required this.job,
    required this.nationality,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      height: 60.pHeight(context),
      color: isDarkMode
          ? ColorManager.darkHeaderColor
          : Theme.of(context).scaffoldBackgroundColor,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          SvgPicture.asset(AssetManager.blankProfile,
              height: 44.pHeight(context), width: 44.pWidth(context)),
          SizedBox(
            width: 6.pWidth(context),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                name,
                style: CustomThemeData.generateColoredStyle(
                    fontSize: 14,
                    context: context,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                job,
                style: CustomThemeData.generateColoredStyle(
                    fontSize: 12,
                    context: context,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 4.pHeight(context),
              )
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Location",
                style: CustomThemeData.generateColoredStyle(
                    fontSize: 12,
                    context: context,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                nationality,
                style: CustomThemeData.generateColoredStyle(
                    fontSize: 12,
                    context: context,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
