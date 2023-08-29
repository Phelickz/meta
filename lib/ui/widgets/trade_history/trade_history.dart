import 'package:flutter/material.dart';
import 'package:meta_trader/ui/views/trade_history/trade_history_view_model.dart';
import 'package:meta_trader/ui/widgets/trade_history/components/custom_head_tab.dart';
import 'package:meta_trader/ui/widgets/trade_history/components/order_component.dart';
import 'package:meta_trader/ui/widgets/trade_history/components/position_component.dart';

import 'components/deal_component.dart';

class TradeHistoryPage extends StatelessWidget {
  final TradeHistoryViewModel viewModel;
  const TradeHistoryPage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CustomHeadTab(
            firstTabName: "Positions",
            secondTabName: "Orders",
            thirdTabName: "Deals",
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
                  children: const [
                    PositionComponent(),
                    OrderComponent(),
                    DealComponent(),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
