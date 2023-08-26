import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/utils/theme.dart';

class CustomBackButtons extends StatelessWidget {
  final Function() onTap;
  const CustomBackButtons({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(
          McGyver.rsDoubleH(context, 1.8),
        ),
        height: McGyver.rsDoubleH(context, 4),
        width: McGyver.rsDoubleH(context, 4),
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

class CustomBackButtonss extends StatelessWidget {
  final Function() onTap;
  const CustomBackButtonss({super.key, required this.onTap});

  @override
  PreferredSize build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(2),
      child: AppBar(),
    );
  }
}

PreferredSizeWidget customBackButton() {
  return AppBar();
}
