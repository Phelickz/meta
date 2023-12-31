import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/chart/chart_view_model.dart';

import 'chart_display.dart';
import 'custom_chart_tab.dart';

class ChartComponent extends StatelessWidget {
  final ChartViewModel viewModel;
  const ChartComponent({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return ListView(
      children: [
        verticalSpaceXSmall(context),
        ValueListenableBuilder<int>(
          valueListenable: viewModel.chartTabSelectedNotifier,
          builder: (context, index, child) {
            return SizedBox(
              height: McGyver.rsDoubleH(context, 58),
              child: IndexedStack(
                index: index,
                children: [
                  ChartDisplay(
                    viewModel: viewModel,
                  ),
                  ChartDisplay(
                    viewModel: viewModel,
                  ),
                  ChartDisplay(
                    viewModel: viewModel,
                  ),
                  ChartDisplay(
                    viewModel: viewModel,
                  ),
                  ChartDisplay(
                    viewModel: viewModel,
                  ),
                ],
              ),
            );
          },
        ),
        verticalSpaceXSmall(context),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: McGyver.rsDoubleW(context, 4),
          ),
          child: Row(
            children: [
              CustomChartTab(
                firstTabName: "15m",
                secondTabName: "30m",
                thirdTabName: "1H",
                fourthTabName: "2H",
                fifthTabName: "More",
                tabIndex: viewModel.chartTabSelectedNotifier.value,
                onSelectTab: (val) {
                  viewModel.chartTabSelectedNotifier.value = val;
                },
              ),
              horizontalSpaceXXSmall(context),
              GestureDetector(
                onTap: () {
                  viewModel.toggleCandleView();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: McGyver.rsDoubleW(context, 3),
                      vertical: McGyver.rsDoubleH(context, 0.7)),
                  height: McGyver.rsDoubleH(context, 4.2),
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? const Color(0xff052844)
                        : const Color(0xffD3ECFD),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        McGyver.rsDoubleW(context, 3),
                      ),
                    ),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/chart_candlestick.svg",
                    height: McGyver.rsDoubleH(context, 1.9),
                    width: McGyver.rsDoubleH(context, 1.9),
                    colorFilter: ColorFilter.mode(
                      isDarkMode
                          ? const Color(0xFF98A2B3)
                          : const Color(0xFF344054),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              horizontalSpaceXXSmall(context),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: McGyver.rsDoubleW(context, 3),
                    vertical: McGyver.rsDoubleH(context, 0.7)),
                height: McGyver.rsDoubleH(context, 4.2),
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? const Color(0xff052844)
                      : const Color(0xffD3ECFD),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      McGyver.rsDoubleW(context, 3),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/grid_edit.svg",
                      height: McGyver.rsDoubleH(context, 1.9),
                      width: McGyver.rsDoubleH(context, 1.9),
                      colorFilter: ColorFilter.mode(
                        isDarkMode
                            ? const Color(0xFF98A2B3)
                            : const Color(0xFF344054),
                        BlendMode.srcIn,
                      ),
                    ),
                    horizontalSpaceXXSmall(context),
                    Text(
                      LocaleKeys.indicators,
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.5),
                        fontWeight: FontWeight.w500,
                        color: isDarkMode
                            ? const Color(0xFF98A2B3)
                            : const Color(0xFF344054),
                      ),
                    ).tr(),
                  ],
                ),
              ),
            ],
          ),
        ),
        verticalSpaceXSmall(context),
        verticalSpaceLarge(context),
      ],
    );
  }
}
