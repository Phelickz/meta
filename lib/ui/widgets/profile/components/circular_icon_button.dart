import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/utils/colorManager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/utils/theme.dart';

class ProfileIconButton extends StatelessWidget {
  final String icon;
  final String title;
  const ProfileIconButton({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return SizedBox(
      width: 100.pWidth(context),
      child: Column(
        children: [
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              width: 32.pWidth(context),
              height: 32.pHeight(context),
              child: SvgPicture.asset(icon),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Theme.of(context).primaryColor)),
            ),
          ),
          SizedBox(
            height: 12.pHeight(context),
          ),
          Text(
            title,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.2),
              fontWeight: FontWeight.w400,
              color:
                  isDarkMode ? ColorManager.darkText : ColorManager.lightText,
            ),
          )
        ],
      ),
    );
  }
}
