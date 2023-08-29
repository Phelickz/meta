import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/size.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/utils/theme.dart';
import '../../buttons/buttons.dart';

class DeletePopup extends StatelessWidget {
  final String title;
  final Function()? onDelete;
  const DeletePopup({
    super.key,
    required this.title,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 6),
        vertical: McGyver.rsDoubleH(context, 4),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Delete $title",
            textAlign: TextAlign.center,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 2.2),
              fontWeight: FontWeight.bold,
              color: isDarkMode
                  ? const Color(0xFFD0D5DD)
                  : const Color(0xFF475467),
            ),
          ),
          verticalSpaceXXSmall(context),
          Text(
            "Do you really want to delete this $title?",
            textAlign: TextAlign.center,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.6),
              fontWeight: FontWeight.w500,
              color: isDarkMode
                  ? const Color(0xFF98A2B3)
                  : const Color(0xFF475467),
            ),
          ),
          verticalSpaceSmall(context),
          verticalSpaceXSmall(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButtons.outlineButton(
                width: McGyver.rsDoubleW(context, 40),
                text: "Delete",
                context: context,
                textColor: const Color(0xFFF97066),
                onTap: () {
                  Navigator.pop(context);
                  // vm.securityPageEnum = SecurityPageEnum.password;
                },
                color: const Color(0xFFF97066).withOpacity(0.7),
              ),
              CustomButtons.textButton(
                context: context,
                onTap: () => Navigator.pop(context),
                text: "Cancel",
                textColor: isDarkMode
                    ? const Color(0xFFD0D5DD)
                    : const Color(0xFF667085),
              ),
            ],
          )
        ],
      ),
    );
  }
}
