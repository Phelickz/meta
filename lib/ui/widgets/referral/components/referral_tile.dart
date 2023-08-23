import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/utils/dimensions.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/utils/theme.dart';

class ReferralTile extends StatelessWidget {
  final String icon;
  final String title;
  const ReferralTile({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return Row(
      children: [
        Container(
          width: 36.pWidth(context),
          height: 36.pHeight(context),
          padding: EdgeInsets.symmetric(horizontal: 8.pWidth(context)),
          decoration: BoxDecoration(
              color: isDarkMode ? Color(0xff052844) : Color(0xffD3ECFD),
              shape: BoxShape.circle),
          child: SizedBox(
              height: 20.pHeight(context),
              width: 20.pWidth(context),
              child: SvgPicture.asset(
                icon,
                color: Color(0xff20A0F3),
              )),
        ),
        SizedBox(
          width: 24.pWidth(context),
        ),
        SizedBox(
            width: 256.pWidth(context),
            child: Text(
              title,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.5),
                color: isDarkMode ? Colors.white54 : const Color(0xff667085),
                fontWeight: FontWeight.normal,
              ),
            ))
      ],
    );
  }
}
