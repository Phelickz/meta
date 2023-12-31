import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';
import 'package:meta_trader/ui/widgets/social_trading/components/custom_summary_tab.dart';
import 'package:meta_trader/ui/widgets/social_trading/components/trade_position_tile.dart';
import 'filter_positon_modal.dart';
import 'summary.dart';

class OpenPositionsComponent extends StatelessWidget {
  final SocialTradingViewModel viewModel;
  const OpenPositionsComponent({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          verticalSpaceSmall(context),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: McGyver.rsDoubleW(context, 3.5),
              vertical: McGyver.rsDoubleH(context, 2),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: McGyver.rsDoubleW(context, 6),
            ),
            decoration: BoxDecoration(
              color: isDarkMode
                  ? const Color(0xFF052844)
                  : const Color(0xFFFAFDFF),
              borderRadius:
                  BorderRadius.circular(McGyver.rsDoubleW(context, 4)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.summary,
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 2),
                        fontWeight: FontWeight.bold,
                        color: isDarkMode
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFF667085),
                      ),
                    ).tr(),
                    CustomSummaryTab(
                      firstTabName: "1W",
                      secondTabName: "2W",
                      thirdTabName: "1M",
                      fourthTabName: "3M",
                      fifthTabName: "6M",
                      tabIndex: viewModel.openSummaryTabSelectedNotifier.value,
                      onSelectTab: (val) {
                        viewModel.openSummaryTabSelectedNotifier.value = val;
                      },
                    ),
                  ],
                ),
                verticalSpaceSmall(context),
                ValueListenableBuilder<int>(
                  valueListenable: viewModel.openSummaryTabSelectedNotifier,
                  builder: (context, index, child) {
                    return SizedBox(
                      height: McGyver.rsDoubleH(context, 35),
                      child: IndexedStack(
                        index: index,
                        children: [
                          SummaryComponent(viewModel: viewModel),
                          SummaryComponent(viewModel: viewModel),
                          SummaryComponent(viewModel: viewModel),
                          SummaryComponent(viewModel: viewModel),
                          SummaryComponent(viewModel: viewModel),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          //
          verticalSpaceSmall(context),
          verticalSpaceXSmall(context),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: McGyver.rsDoubleW(context, 6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.positions,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? const Color(0xFF98A2B3)
                        : const Color(0xFF667085),
                  ),
                ).tr(),
                GestureDetector(
                  onTap: () {
                    showFilterModal(context);
                  },
                  child: SvgPicture.asset(
                    "assets/icons/filter.svg",
                    colorFilter: ColorFilter.mode(
                      isDarkMode
                          ? const Color(0xff98A2B3)
                          : const Color(0xFF667085),
                      BlendMode.srcIn,
                    ),
                  ),
                )
              ],
            ),
          ),
          verticalSpaceXSmall(context),
          SizedBox(
            height: McGyver.rsDoubleH(context, 100),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                TradePositionTile(
                  tradeType: TradeType.buy,
                  viewModel: viewModel,
                  positionType: PositionType.open,
                ),
                TradePositionTile(
                  tradeType: TradeType.sell,
                  viewModel: viewModel,
                  positionType: PositionType.open,
                ),
                TradePositionTile(
                  tradeType: TradeType.buy,
                  viewModel: viewModel,
                  positionType: PositionType.open,
                ),
                TradePositionTile(
                  tradeType: TradeType.sell,
                  viewModel: viewModel,
                  positionType: PositionType.open,
                ),
                TradePositionTile(
                  tradeType: TradeType.buy,
                  viewModel: viewModel,
                  positionType: PositionType.open,
                ),
                TradePositionTile(
                  tradeType: TradeType.sell,
                  viewModel: viewModel,
                  positionType: PositionType.open,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showFilterModal(BuildContext context) {
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
          return const FilterPositionModal();
        });
  }
}
