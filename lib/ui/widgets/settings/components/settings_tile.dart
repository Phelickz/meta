import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meta_trader/ui/views/settings/settings_view_model.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/utils/theme.dart';

// ignore: must_be_immutable
class BasicSettingsTile extends StatelessWidget {
  final String title;
  bool isArrowTrailing;
  Widget? secondaryTrailing;
  final void Function()? onTap;
  BasicSettingsTile(
      {Key? key,
      required this.title,
      this.isArrowTrailing = true,
      this.secondaryTrailing,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.7),
              color: isDarkMode ? Colors.white : const Color(0xff667085),
              fontWeight: FontWeight.w700,
            ),
          ),
          isArrowTrailing
              ? Icon(
                  Platform.isAndroid
                      ? Icons.arrow_forward
                      : Icons.arrow_forward_ios,
                  size: 17,
                  color: isDarkMode ? Colors.white : Colors.black54,
                )
              : secondaryTrailing!
        ],
      ),
    );
  }
}
