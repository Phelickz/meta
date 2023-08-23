import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/size.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/utils/theme.dart';

class LabelTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool isEnabled;
  const LabelTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.keyboardType,
    this.controller,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    var textStyle = CustomThemeData.generateStyle(
      fontSize: McGyver.textSize(context, 1.8),
      color: isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFF667085),
      fontWeight: FontWeight.normal,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.7),
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
                ? const Color(0xFF98A2B3).withOpacity(0.2)
                : const Color(0x000000ff),
            border: Border.all(
              color: const Color(0xFF667085),
            ),
            borderRadius: BorderRadius.circular(9),
          ),
          child: TextField(
            enabled: isEnabled,
            controller: controller ?? TextEditingController(),
            style: textStyle,
            keyboardType: keyboardType ?? TextInputType.name,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.8),
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
