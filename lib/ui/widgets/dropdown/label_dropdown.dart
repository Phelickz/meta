import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';

class LabelDropdown extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> options;
  final Function(String?) onChanged;
  const LabelDropdown({
    super.key,
    required this.label,
    this.value,
    required this.onChanged,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    var textStyle = CustomThemeData.generateStyle(
      fontSize: McGyver.textSize(context, 2.0),
      color: isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFF667085),
      fontWeight: FontWeight.normal,
    );

    Widget dropDownIcon = SizedBox(
      height: 20,
      width: 20,
      child: Icon(
        Icons.arrow_forward_ios,
        color: isDarkMode ? const Color(0xff98A2B3) : const Color(0xFF667085),
      ),
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
            border: Border.all(
              color: const Color(0xFF667085),
            ),
            borderRadius: BorderRadius.circular(9),
          ),
          child: DropdownButton<String>(
            dropdownColor: isDarkMode ? const Color(0xFF052844) : Colors.white,
            focusColor: isDarkMode ? const Color(0xFF073961) : Colors.white,
            isExpanded: true,
            value: value,
            underline: const SizedBox.shrink(),
            hint: Text(
              value ?? LocaleKeys.select,
              style: const TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.grey),
            ).tr(),
            style: textStyle,
            icon: dropDownIcon,
            onChanged: onChanged,
            items: options
                .map((e) => DropdownMenuItem(
                    value: e, child: Text(e, style: textStyle)))
                .toList(),
          ),
        )
      ],
    );
  }
}
