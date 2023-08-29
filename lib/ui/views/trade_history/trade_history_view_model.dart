import 'package:flutter/material.dart';
import 'package:meta_trader/ui/widgets/trade_history/components/app_bar.dart';

import '../../../app/core/custom_base_view_model.dart';
import '../../widgets/trade_history/trade_history.dart';

enum TradeType {
  buy,
  sell,
}

class TradeHistoryViewModel extends CustomBaseViewModel {
  TradeHistoryViewModel() {
    init();
  }

  Future<void> init() async {}

  Widget returnPage() {
    return TradeHistoryPage(viewModel: this);
  }

  Widget returnAppBar(BuildContext context) {
    return tradeHistoryAppBar(
      context,
      "Trade History",
      "",
      this,
      "assets/images/sort.svg",
    );
  }

  final tabSelectedNotifier = ValueNotifier(0);
}
