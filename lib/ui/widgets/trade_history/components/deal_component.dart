import 'package:flutter/material.dart';
import 'package:meta_trader/ui/widgets/trade_history/components/position_header_details.dart';
import 'package:meta_trader/ui/widgets/trade_history/components/trade_tile.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/responsiveness/size.dart';
import '../../../../app/utils/theme.dart';
import '../../../views/trade_history/trade_history_view_model.dart';

class DealComponent extends StatelessWidget {
  const DealComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PositionHeaderDetails(),
        verticalSpaceSmall(context),
        verticalSpaceXSmall(context),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: McGyver.rsDoubleW(context, 6),
          ),
          child: Text(
            "Last week",
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.8),
              fontWeight: FontWeight.bold,
              color: const Color(0xFF98A2B3),
            ),
          ),
        ),
        verticalSpaceXSmall(context),
        const TradeTile(tradeType: TradeType.buy),
        const TradeTile(tradeType: TradeType.sell),
      ],
    );
  }
}
