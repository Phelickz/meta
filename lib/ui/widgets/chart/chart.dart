import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/chart/chart_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';

import 'components/chart_component.dart';
import 'components/custom_head_tab.dart';
import 'components/overview_component.dart';
import 'components/specification_component.dart';

class ChartPage extends StatelessWidget {
  final ChartViewModel viewModel;
  const ChartPage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Stack(
      children: [
        Column(
          children: [
            CustomHeadTab(
              firstTabName: "Chart",
              secondTabName: "Overview",
              thirdTabName: "Specification",
              tabIndex: viewModel.tabSelectedNotifier.value,
              onSelectTab: (val) {
                viewModel.tabSelectedNotifier.value = val;
              },
            ),
            ValueListenableBuilder<int>(
              valueListenable: viewModel.tabSelectedNotifier,
              builder: (context, index, child) {
                return Expanded(
                  child: IndexedStack(
                    index: index,
                    children: [
                      ChartComponent(viewModel: viewModel),
                      OverviewComponent(viewModel: viewModel),
                      SpecificationComponent(viewModel: viewModel),
                    ],
                  ),
                );
              },
            )
          ],
        ),
        Positioned(
          bottom: 5,
          left: 0,
          right: 0,
          child: Container(
            color:
                isDarkMode ? const Color(0xFF0C2031) : const Color(0xFFFAFDFF),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: McGyver.rsDoubleW(context, 6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CustomButtons.generalButton(
                            width: McGyver.rsDoubleW(context, 42),
                            context: context,
                            onTap: () {},
                            text: "Sell at 1.234564",
                            color: const Color(0xFFF04438),
                          ),
                          verticalSpaceXXSmall(context),
                          SizedBox(
                            width: McGyver.rsDoubleW(context, 42),
                            child: LinearProgressIndicator(
                                value: 23 / 100,
                                backgroundColor: isDarkMode
                                    ? const Color(0xFF073961)
                                    : const Color(0xFFE4E7EC),
                                color: const Color(0xFFF04438)),
                          ),
                          verticalSpaceXXSmall(context),
                          Text(
                            "23%",
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.6),
                              fontWeight: FontWeight.w500,
                              color: isDarkMode
                                  ? const Color(0xFFF97066)
                                  : const Color(0xFFF04438),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CustomButtons.generalButton(
                            width: McGyver.rsDoubleW(context, 42),
                            context: context,
                            onTap: () {},
                            text: "Buy at 1.234564",
                            color: isDarkMode
                                ? const Color(0xFF0B7FCB)
                                : const Color(0xFF0C95EF),
                          ),
                          verticalSpaceXXSmall(context),
                          SizedBox(
                            width: McGyver.rsDoubleW(context, 42),
                            child: LinearProgressIndicator(
                              value: 77 / 100,
                              backgroundColor: isDarkMode
                                  ? const Color(0xFF073961)
                                  : const Color(0xFFE4E7EC),
                              color: isDarkMode
                                  ? const Color(0xFF0B7FCB)
                                  : const Color(0xFF0C95EF),
                            ),
                          ),
                          verticalSpaceXXSmall(context),
                          Text(
                            "77%",
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.6),
                              fontWeight: FontWeight.w500,
                              color: isDarkMode
                                  ? const Color(0xFF0B7FCB)
                                  : const Color(0xFF0C95EF),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: McGyver.rsDoubleH(context, 3.2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: McGyver.rsDoubleW(context, 8),
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          color: isDarkMode
                              ? const Color(0xFF0C2031)
                              : const Color(0xFFF9FAFB),
                        ),
                        child: Center(
                          child: Text(
                            "1.2",
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.6),
                              fontWeight: FontWeight.w500,
                              color: isDarkMode
                                  ? const Color(0xFFD0D5DD)
                                  : const Color(0xFF667085),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
