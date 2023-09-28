import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/trade_history/components/custom_period_modal.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/responsiveness/size.dart';
import '../../../../app/utils/theme.dart';

class FilterModal extends StatelessWidget {
  const FilterModal({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      height: McGyver.rsDoubleH(context, 60),
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleH(context, 2),
        vertical: McGyver.rsDoubleH(context, 4),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              LocaleKeys.filterBy,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.9),
                fontWeight: FontWeight.bold,
                color: const Color(0xFF98A2B3),
              ),
            ),
            verticalSpaceSmall(context),
            _twoText(
              context: context,
              title: LocaleKeys.today,
              subtitle: "16.01.2023",
              onTap: () {},
            ),
            verticalSpaceSmall(context),
            _twoText(
              context: context,
              title: LocaleKeys.lastWeek,
              subtitle: "7.01.2023 - 14.01.2023",
              onTap: () {},
            ),
            verticalSpaceSmall(context),
            _twoText(
              context: context,
              title: LocaleKeys
                  .tradeHistoryWidget_TradeComponents_filterModal_lastMonth,
              subtitle: "1.12.2022 - 31.01.2022",
              onTap: () {},
            ),
            verticalSpaceSmall(context),
            _twoText(
              context: context,
              title: LocaleKeys
                  .tradeHistoryWidget_TradeComponents_filterModal_last3Month,
              subtitle: "1.11.2022 - 16.01.2023  ",
              onTap: () {},
            ),
            verticalSpaceSmall(context),
            _twoText(
              context: context,
              title: LocaleKeys.customPeriod,
              subtitle: "1.11.2022 - 16.01.2023",
              onTap: () {
                Navigator.pop(context);
                showCustomPeriodModal(context);
              },
            ),
            verticalSpaceSmall(context),
            verticalSpaceSmall(context),
            CustomButtons.generalButton(
              context: context,
              onTap: () {
                Navigator.pop(context);
              },
              text: LocaleKeys.cancel,
              color: isDarkMode
                  ? const Color(0xFF052844)
                  : const Color(0xFFD3ECFD),
              textColor: isDarkMode
                  ? const Color(0xFFD0D5DD)
                  : const Color(0xFF667085),
            ),
          ],
        ),
      ),
    );
  }

  void showCustomPeriodModal(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    showModalBottomSheet(
        backgroundColor:
            isDarkMode ? const Color(0xFF0C2031) : const Color(0xFFFAFDFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(McGyver.rsDoubleH(context, 2)),
            topRight: Radius.circular(McGyver.rsDoubleH(context, 2)),
          ),
        ),
        context: context,
        isDismissible: true,
        enableDrag: true,
        isScrollControlled: true,
        builder: (context) {
          return const CustomPeriodModal();
        });
  }

  Widget _twoText({
    required BuildContext context,
    required String title,
    required String subtitle,
    required Function() onTap,
  }) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return CupertinoButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Text(
            title,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.8),
              fontWeight: FontWeight.bold,
              color: isDarkMode
                  ? const Color(0xFFD0D5DD)
                  : const Color(0xFF98A2B3),
            ),
          ),
          SizedBox(
            height: McGyver.rsDoubleH(context, 0.2),
          ),
          Text(
            subtitle,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.3),
              fontWeight: FontWeight.bold,
              color: const Color(0xFF667085),
            ),
          ),
        ],
      ),
    );
  }
}
