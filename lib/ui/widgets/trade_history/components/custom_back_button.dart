import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/utils/theme.dart';

class CustomBackButton extends StatelessWidget {
  final Function() onTap;
  const CustomBackButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(
          left: McGyver.rsDoubleH(context, 1),
          right: McGyver.rsDoubleH(context, 1.5),
          top: McGyver.rsDoubleH(context, 1.5),
          bottom: McGyver.rsDoubleH(context, 1.5),
        ),
        height: McGyver.rsDoubleH(context, 5),
        width: McGyver.rsDoubleH(context, 5),
        child: SvgPicture.asset(
          "assets/images/arrow_left.svg",
          colorFilter: ColorFilter.mode(
            isDarkMode ? const Color(0xff98A2B3) : const Color(0xFF667085),
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
