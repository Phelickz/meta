import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/ui/widgets/social_trading/master_traders.dart';
import 'package:meta_trader/ui/widgets/social_trading/my_trades.dart';

enum SocialTradingDasboardEnum { masterTraders, myTrades }

enum MasterTraderOverviewEnum { overview, tradingHistory }

enum SocialTradingOptionMenuEnum {
  main,
  wallet,
  notification,
  support,
  about,
}

class SocialTradingViewModel extends CustomBaseViewModel {
  SocialTradingDasboardEnum _socialTradingDasboardEnum =
      SocialTradingDasboardEnum.masterTraders;

  SocialTradingDasboardEnum get socialTradingDasboardEnum =>
      _socialTradingDasboardEnum;

  MasterTraderOverviewEnum _masterTraderOverviewEnum =
      MasterTraderOverviewEnum.overview;

  MasterTraderOverviewEnum get masterTraderOverviewEnum =>
      _masterTraderOverviewEnum;

  set setSocialTradingDashboardEnum(SocialTradingDasboardEnum e) {
    _socialTradingDasboardEnum = e;
    rebuildUi();
  }

  set setMasterTraderOverviewEnum(MasterTraderOverviewEnum e) {
    _masterTraderOverviewEnum = e;
    rebuildUi();
  }

  Widget returnPage(BuildContext context) {
    switch (_socialTradingDasboardEnum) {
      case SocialTradingDasboardEnum.masterTraders:
        return MasterTraders(
          model: this,
        );
      case SocialTradingDasboardEnum.myTrades:
        return MyTrades(
          model: this,
        );
      default:
        return Container();
    }
  }
}
