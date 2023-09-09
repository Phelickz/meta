import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';

import 'components/trade_position_tile.dart';

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
                'Positions',
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode
                      ? const Color(0xff98A2B3)
                      : const Color(0xff475467),
                ),
              ),
              IconButton(
                onPressed: () {},
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
          onTap: () {},
          text: 'Setup Copying',
        ),
        verticalSpaceMedium(context)
      ],
    );
  }
}
