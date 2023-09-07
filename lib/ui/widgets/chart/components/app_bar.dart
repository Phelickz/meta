import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/chart/chart_view_model.dart';

AppBar chartAppBar(
  BuildContext context,
  String title,
  String subtitle,
  ChartViewModel model,
) {
  var isDarkMode = CustomThemeData.isDarkMode(context);
  return AppBar(
    elevation: 0,
    backgroundColor: isDarkMode
        ? const Color(0xff052844)
        : Theme.of(context).scaffoldBackgroundColor,
    automaticallyImplyLeading: false,
    leading: IconButton(
        icon: Icon(
          Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
          color: isDarkMode
              ? const Color(0xffD2D2D2).withOpacity(0)
              : Colors.black.withOpacity(0),
        ),
        onPressed: () {
          // model.goBack();
        }),
    centerTitle: true,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: McGyver.rsDoubleH(context, 2.8),
          width: McGyver.rsDoubleH(context, 2.8),
          child: SvgPicture.asset(
            "assets/icons/arrow-swap-horizontal.svg",
            colorFilter: ColorFilter.mode(
              isDarkMode ? const Color(0xffD0D5DD) : const Color(0xFF667085),
              BlendMode.srcIn,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          title,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 2),
            color:
                isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFF344054),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.star,
          color: Colors.amber,
        ),
      ),
      IconButton(
        onPressed: () {
          // showFilterModal(context);
        },
        icon: SizedBox(
          height: McGyver.rsDoubleH(context, 2.8),
          width: McGyver.rsDoubleH(context, 2.8),
          child: SvgPicture.asset(
            "assets/images/notification.svg",
            colorFilter: ColorFilter.mode(
              isDarkMode ? const Color(0xff98A2B3) : const Color(0xFF667085),
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    ],
  );
}
