import 'dart:core';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';

class LabelDatePicker extends StatelessWidget {
  final String label;
  final DateTime? selectedDate;
  final DateTime? lastDate;
  final BuildContext context;
  final Function(DateTime?) onDateSelected;
  const LabelDatePicker({
    super.key,
    required this.label,
    required this.context,
    this.selectedDate,
    this.lastDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.8),
            fontWeight: FontWeight.w500,
            color:
                isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFF667085),
          ),
        ),
        verticalSpaceXXSmall(context),
        GestureDetector(
          onTap: () async {
            DateTime? date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now().subtract(const Duration(days: 1000)),
                lastDate: lastDate ?? DateTime.now(),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(
                          primary: Theme.of(context).primaryColor),
                    ),
                    child: child!,
                  );
                });
            onDateSelected(date);
          },
          child: Container(
            height: 60,
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: const Color(0xFF667085),
              ),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedDate == null
                      ? "DD.MM.YYYY"
                      : formatDate(selectedDate!, [d, ".", m, ".", yyyy]),
                  style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.8),
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF98A2B3)),
                ),
                SvgPicture.asset(
                  "assets/images/calendar_2.svg",
                ),
              ],
            ),
          ),
        ),
        verticalSpaceSmall(context),
      ],
    );
  }
}
