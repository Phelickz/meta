import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/ui/widgets/fund_account/app_bar.dart';
import 'package:meta_trader/ui/widgets/fund_account/binance_pay.dart';
import 'package:meta_trader/ui/widgets/fund_account/bitcoin.dart';
import 'package:meta_trader/ui/widgets/fund_account/neteller.dart';
import 'package:meta_trader/ui/widgets/fund_account/online_bank.dart';
import 'package:meta_trader/ui/widgets/fund_account/perfect_money.dart';
import 'package:meta_trader/ui/widgets/fund_account/select_account.dart';
import 'package:meta_trader/ui/widgets/fund_account/select_deposit_method.dart';
import 'package:meta_trader/ui/widgets/fund_account/skrill.dart';
import 'package:meta_trader/ui/widgets/fund_account/stic_pay.dart';
import 'package:meta_trader/ui/widgets/fund_account/tether.dart';

enum FundAccountPageEnum {
  selectAccount,
  selectDepositMethod,
  onlineBank,
  bitcoin,
  binancePay,
  neteller,
  perfectMoney,
  skrill,
  sticPay,
  tether
}

enum DepositMethod {
  onlineBank,
  bitcoin,
  binancePay,
  neteller,
  perfectMoney,
  skrill,
  sticPay,
  tether
}

class FundAccountViewModel extends CustomBaseViewModel {
  FundAccountPageEnum _fundAccountPageEnum = FundAccountPageEnum.selectAccount;
  FundAccountPageEnum get fundAccountPageEnum => _fundAccountPageEnum;

  DepositMethod _depositMethod = DepositMethod.onlineBank;
  DepositMethod get depositMethod => _depositMethod;

  int _account = 0;
  int get account => _account;

  set setAccount(int e) {
    _account = e;
    rebuildUi();
  }

  set setFundAccountPageEnum(FundAccountPageEnum e) {
    _fundAccountPageEnum = e;
    rebuildUi();
  }

  set setDepositMethod(DepositMethod e) {
    _depositMethod = e;
    rebuildUi();
  }

  Widget returnBody(BuildContext context) {
    switch (_fundAccountPageEnum) {
      case FundAccountPageEnum.selectAccount:
        return SelectAccount(
          model: this,
        );
      case FundAccountPageEnum.selectDepositMethod:
        return SelectDepositMethod(
          model: this,
        );
      case FundAccountPageEnum.onlineBank:
        return OnlineBank(
          model: this,
        );
      case FundAccountPageEnum.bitcoin:
        return Bitcoin(
          model: this,
        );
      case FundAccountPageEnum.binancePay:
        return BinancePay(
          model: this,
        );
      case FundAccountPageEnum.neteller:
        return Neteller(
          model: this,
        );
      case FundAccountPageEnum.perfectMoney:
        return PerfectMoney(
          model: this,
        );
      case FundAccountPageEnum.sticPay:
        return SticPay(
          model: this,
        );
      case FundAccountPageEnum.tether:
        return Tether(
          model: this,
        );
      case FundAccountPageEnum.skrill:
        return Skrill(
          model: this,
        );
      default:
        return Container();
    }
  }

  AppBar? returnAppbar(BuildContext context) {
    switch (_fundAccountPageEnum) {
      case FundAccountPageEnum.selectAccount:
        return fundAccountAppBar(
            context, 'Fund Account', 'Select account to fund', this);
      case FundAccountPageEnum.selectDepositMethod:
        return fundAccountAppBar(
            context, 'Deposit Funds', 'Select deposit method', this);
      case FundAccountPageEnum.onlineBank:
        return fundAccountAppBar(
            context, 'Online Bank', 'Add online bank', this);
      case FundAccountPageEnum.bitcoin:
        return fundAccountAppBar(
            context, 'Bitcoin (BTC)', 'Fund using Bitcoin wallet', this);
      case FundAccountPageEnum.binancePay:
        return fundAccountAppBar(
            context, 'BinancePay', 'Fund using BinancePay', this);
      case FundAccountPageEnum.neteller:
        return fundAccountAppBar(
            context, 'Neteller', 'Fund using Neteller', this);
      case FundAccountPageEnum.perfectMoney:
        return fundAccountAppBar(
            context, 'Perfect Money', 'Fund using Perfect Money', this);
      case FundAccountPageEnum.sticPay:
        return fundAccountAppBar(
            context, 'SticPay', 'Fund using Stic Pay', this);
      case FundAccountPageEnum.tether:
        return fundAccountAppBar(
            context, 'Tether (USD)', 'Fund using Tether', this);
      case FundAccountPageEnum.skrill:
        return fundAccountAppBar(context, 'Skrill', 'Fund using Skrill', this);
      default:
        return null;
    }
  }
}
