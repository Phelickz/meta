import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';

class LabelSearchField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final bool isEnabled;
  const LabelSearchField({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    var textStyle = CustomThemeData.generateStyle(
      fontSize: McGyver.textSize(context, 2.0),
      color: isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFF667085),
      fontWeight: FontWeight.normal,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.8),
            fontWeight: FontWeight.w500,
            color: isDarkMode
                ? const Color(0xFFD0D5DD)
                : const Color(
                    0xFF667085,
                  ),
          ),
        ),
        verticalSpaceXXSmall(context),
        Container(
          height: 60,
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: !isEnabled
                ? isDarkMode
                    ? const Color(0xff052844)
                    : const Color(0xFF98A2B3).withOpacity(0.2)
                : Colors.transparent,
            border: Border.all(
              color: const Color(0xFF667085),
            ),
            borderRadius: BorderRadius.circular(9),
          ),
          child: TextField(
            enabled: isEnabled,
            controller: controller ?? TextEditingController(),
            style: textStyle,
            obscureText: true,
            decoration: InputDecoration(
              suffixIcon: const Icon(
                CupertinoIcons.search,
              ),
              hintText: hintText,
              suffixIconColor: isDarkMode
                  ? const Color(0xFF667085)
                  : const Color(0xFF98A2B3),
              hintStyle: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 2.0),
                fontWeight: FontWeight.normal,
                color: const Color(0xFF98A2B3),
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        verticalSpaceSmall(context),
      ],
    );
  }
}
