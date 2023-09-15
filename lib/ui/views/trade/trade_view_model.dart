import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/ui/widgets/trade/components/app_bar.dart';
import 'package:meta_trader/ui/widgets/trade/modify_trade.dart';
import 'package:meta_trader/ui/widgets/trade/trade.dart';

enum TradeType {
  buy,
  sell,
}

enum TradePageEnum {
  trade,
  modifyTrade,
}

class TradeViewModel extends CustomBaseViewModel {
  bool isBuy = true;
  bool isEmpty = false;
  bool hasCredit = true;

  bool _openDuration = false;
  bool get openDuration => _openDuration;

  TradePageEnum _tradePageEnum = TradePageEnum.trade;
  TradePageEnum get tradePageEnum => _tradePageEnum;

  set tradePageEnum(TradePageEnum e) {
    _tradePageEnum = e;
    rebuildUi();
  }

  set setOpenDuration(bool val) {
    _openDuration = val;
    rebuildUi();
  }

  Widget returnPage() {
    switch (_tradePageEnum) {
      case TradePageEnum.trade:
        return TradePage(viewModel: this);
      case TradePageEnum.modifyTrade:
        return ModifyTrade(viewModel: this);
      default:
        return Container();
    }
  }

  AppBar? returnAppBar(BuildContext context) {
    switch (_tradePageEnum) {
      case TradePageEnum.trade:
        return tradeAppBar(
          context,
          "16 701.47 USD",
          "",
          this,
          "assets/images/sort.svg",
        );
      case TradePageEnum.modifyTrade:
        return tradeAppBar(
          context,
          "EURUSD",
          "Euro vs US dollar",
          this,
          "",
        );
      default:
        return null;
    }
  }
}
