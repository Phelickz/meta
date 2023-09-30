import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/social_trading/components/filter_positon_modal.dart';

import 'components/cancel_sub_modal.dart';
import 'components/trade_position_tile.dart';
import 'subscription_setup.dart';

class TradingHistory extends StatelessWidget {
  const TradingHistory({super.key, required this.model});
  final SocialTradingViewModel model;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      children: [
        verticalSpaceXSmall(context),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: McGyver.rsDoubleW(context, 6)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.positions,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode
                      ? const Color(0xff98A2B3)
                      : const Color(0xff475467),
                ),
              ).tr(),
              IconButton(
                onPressed: () {
                  showFilterModal(context);
                },
                icon: Icon(
                  Icons.filter_alt_outlined,
                  color: isDarkMode
                      ? const Color(0xff98A2B3)
                      : const Color(0xff475467),
                ),
              )
            ],
          ),
        ),
        verticalSpaceXSmall(context),
        Expanded(
          child: ListView.separated(
            itemCount: 13,
            itemBuilder: (context, index) {
              return TradePositionTile(
                viewModel: model,
                positionType:
                    index % 2 == 0 ? PositionType.open : PositionType.closed,
                tradeType: index % 3 != 0 ? TradeType.sell : TradeType.buy,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return verticalSpaceXXSmall(context);
            },
          ),
        ),
        verticalSpaceXSmall(context),
        CustomButtons.generalButton(
            context: context,
            color: model.socialTradingPageEnum ==
                    SocialTradingPageEnum.copiedTraderPosition
                ? Colors.red
                : Theme.of(context).primaryColor,
            onTap: () {
              if (model.socialTradingPageEnum ==
                  SocialTradingPageEnum.copiedTraderPosition) {
                showCancelCopyingModal(context, model);
              } else {
                model.setSocialTradingPageEnum =
                    SocialTradingPageEnum.subscriptionSetup;
                model.push(SubscriptionSetupPage(viewModel: model));
              }
            },
            text: model.socialTradingPageEnum ==
                    SocialTradingPageEnum.copiedTraderPosition
                ? LocaleKeys.stopCoping.tr()
                : LocaleKeys.socialTradingWidget_myTrades_startCopying.tr()),
        verticalSpaceMedium(context)
      ],
    );
  }

  void showCancelCopyingModal(BuildContext context, SocialTradingViewModel vm) {
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
          return CancelSubModal(
            viewModel: vm,
          );
        });
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
