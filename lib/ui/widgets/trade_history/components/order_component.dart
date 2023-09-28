import 'package:flutter/material.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/trade_history/components/trade_order_tile.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/responsiveness/size.dart';
import '../../../../app/utils/theme.dart';
import '../../../views/trade_history/trade_history_view_model.dart';
import 'order_header_details.dart';

class OrderComponent extends StatelessWidget {
  const OrderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const OrderHeaderDetails(),
        verticalSpaceSmall(context),
        verticalSpaceXSmall(context),
        // TODO: Implement below with GroupedListView
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: McGyver.rsDoubleW(context, 6),
          ),
          child: Text(
            LocaleKeys.lastWeek,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.8),
              fontWeight: FontWeight.bold,
              color: const Color(0xFF98A2B3),
            ),
          ),
        ),
        verticalSpaceXSmall(context),
        const TradeOrderTile(tradeType: TradeType.buy),
        const TradeOrderTile(tradeType: TradeType.sell),
      ],
    );
  }
}
