import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/dropdown/label_dropdown.dart';

class FilterPositionModal extends StatelessWidget {
  const FilterPositionModal({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      height: McGyver.rsDoubleH(context, 50),
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleH(context, 2),
        vertical: McGyver.rsDoubleH(context, 4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.filterBy,
            style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.6),
                fontWeight: FontWeight.w500,
                color: isDarkMode
                    ? const Color(0xFF98A2B3)
                    : const Color(0xFF667085)),
          ).tr(),
          verticalSpaceSmall(context),
          LabelDropdown(
            label: LocaleKeys.selectPosition.tr(),
            onChanged: (val) {},
            value: LocaleKeys.profits.tr(),
            options: [
              LocaleKeys.profits.tr(),
              LocaleKeys.loss.tr(),
              LocaleKeys.views_forexNews_forexModel_all.tr(),
            ],
          ),
          verticalSpaceSmall(context),
          Row(
            children: [
              Row(
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor:
                          isDarkMode ? Colors.white70 : const Color(0xff98A2B3),
                    ),
                    child: Checkbox(
                      value: false,
                      visualDensity: VisualDensity.compact,
                      onChanged: (val) {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      side: BorderSide(
                        color: isDarkMode
                            ? const Color(0xFFD0D5DD)
                            : const Color(0xff98A2B3),
                      ),
                      checkColor:
                          isDarkMode ? Colors.white70 : const Color(0xff98A2B3),
                      activeColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: McGyver.rsDoubleW(context, 1),
                  ),
                  Text(
                    LocaleKeys.ascending,
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.7),
                      fontWeight: FontWeight.w500,
                      color: isDarkMode
                          ? const Color(0xFFD0D5DD)
                          : const Color(0xFF667085),
                    ),
                  ).tr()
                ],
              ),
              horizontalSpaceSmall(context),
              Row(
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor:
                          isDarkMode ? Colors.white70 : const Color(0xff98A2B3),
                    ),
                    child: Checkbox(
                      value: false,
                      visualDensity: VisualDensity.compact,
                      onChanged: (val) {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      side: BorderSide(
                        color: isDarkMode
                            ? const Color(0xFFD0D5DD)
                            : const Color(0xff98A2B3),
                      ),
                      checkColor:
                          isDarkMode ? Colors.white70 : const Color(0xff98A2B3),
                      activeColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: McGyver.rsDoubleW(context, 1),
                  ),
                  Text(
                    LocaleKeys.descending,
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.7),
                      fontWeight: FontWeight.w500,
                      color: isDarkMode
                          ? const Color(0xFFD0D5DD)
                          : const Color(0xFF667085),
                    ),
                  ).tr()
                ],
              ),
            ],
          ),
          verticalSpaceLarge(context),
          CustomButtons.generalButton(
            context: context,
            onTap: () {
              Navigator.pop(context);
            },
            text: LocaleKeys.confirm.tr(),
          ),
        ],
      ),
    );
  }
}
