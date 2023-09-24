import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/chart/chart_view_model.dart';
import 'package:meta_trader/ui/widgets/chart/components/trading_signal_tile.dart';
import 'package:meta_trader/ui/widgets/chart/components/overview_chart.dart';

import 'custom_overview_tab.dart';

class OverviewComponent extends StatelessWidget {
  final ChartViewModel viewModel;
  const OverviewComponent({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 5),
      ),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceSmall(context),
          // verticalSpaceLarge(context),
          CustomOverviewTab(
            firstTabName: LocaleKeys.hour.tr(),
            secondTabName: LocaleKeys.today.tr(),
            thirdTabName: LocaleKeys.week.tr(),
            fourthTabName: LocaleKeys.month.tr(),
            fifthTabName: LocaleKeys.year.tr(),
            tabIndex: viewModel.overviewTabSelectedNotifier.value,
            onSelectTab: (val) {
              viewModel.overviewTabSelectedNotifier.value = val;
            },
          ),
          ValueListenableBuilder<int>(
            valueListenable: viewModel.overviewTabSelectedNotifier,
            builder: (context, index, child) {
              return SizedBox(
                height: McGyver.rsDoubleH(context, 28),
                child: IndexedStack(
                  index: index,
                  children: [
                    OverviewChart(
                      data: viewModel.hourOverviewData,
                    ),
                    OverviewChart(
                      data: viewModel.todayOverviewData,
                    ),
                    OverviewChart(
                      data: viewModel.weekOverviewData,
                    ),
                    OverviewChart(
                      data: viewModel.monthOverviewData,
                    ),
                    OverviewChart(
                      data: viewModel.yearOverviewData,
                    ),
                  ],
                ),
              );
            },
          ),
          Text(
            LocaleKeys.tradingSignal.tr(),
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 2),
              fontWeight: FontWeight.bold,
              color: isDarkMode
                  ? const Color(0xFFD0D5DD)
                  : const Color(0xFF475467),
            ),
          ),
          verticalSpaceXSmall(context),
          // Replaced with ListView
          TraadingSignalTile(
            leadingIcon: Icon(
              CupertinoIcons.arrow_down,
              color: const Color(0xFFFCFCFD),
              size: McGyver.rsDoubleH(context, 1.4),
            ),
            leadingBgColor: const Color(0xffF97066),
          ),
          Divider(
            thickness: 0.3,
            color:
                isDarkMode ? const Color(0xFF475467) : const Color(0xFFE4E7EC),
          ),
          TraadingSignalTile(
            leadingIcon: Icon(
              CupertinoIcons.arrow_right,
              color: const Color(0xFFFCFCFD),
              size: McGyver.rsDoubleH(context, 1.4),
            ),
            leadingBgColor: const Color(0xff667085),
          ),
          Divider(
            thickness: 0.3,
            color:
                isDarkMode ? const Color(0xFF475467) : const Color(0xFFE4E7EC),
          ),
          TraadingSignalTile(
            leadingIcon: Row(
              children: [
                Icon(
                  CupertinoIcons.arrow_up,
                  color: const Color(0xFFFCFCFD),
                  size: McGyver.rsDoubleH(context, 1.4),
                ),
                const SizedBox(
                  width: 2,
                ),
                Icon(
                  CupertinoIcons.arrow_up,
                  color: const Color(0xFFFCFCFD),
                  size: McGyver.rsDoubleH(context, 1.4),
                ),
              ],
            ),
            leadingBgColor: const Color(0xff20A0F3),
          ),
          verticalSpaceLarge(context),
          verticalSpaceLarge(context),
        ],
      ),
    );
  }
}
