import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/fund_account/app_bar.dart';
import 'package:meta_trader/ui/widgets/fund_account/binance_pay.dart';
import 'package:meta_trader/ui/widgets/fund_account/bitcoin.dart';
import 'package:meta_trader/ui/widgets/fund_account/block_bee.dart';
import 'package:meta_trader/ui/widgets/fund_account/neteller.dart';
import 'package:meta_trader/ui/widgets/fund_account/online_bank.dart';
import 'package:meta_trader/ui/widgets/fund_account/perfect_money.dart';
import 'package:meta_trader/ui/widgets/fund_account/select_account.dart';
import 'package:meta_trader/ui/widgets/fund_account/select_deposit_method.dart';
import 'package:meta_trader/ui/widgets/fund_account/skrill.dart';
import 'package:meta_trader/ui/widgets/fund_account/stic_pay.dart';
import 'package:meta_trader/ui/widgets/fund_account/success.dart';
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
  tether,
  blockBee,
  success,
}

enum DepositMethod {
  // onlineBank,
  // bitcoin,
  // binancePay,
  // neteller,
  // perfectMoney,
  // skrill,
  // sticPay,
  // tether
  blockBee,
}

class FundAccountViewModel extends CustomBaseViewModel {
  FundAccountPageEnum _fundAccountPageEnum = FundAccountPageEnum.selectAccount;
  FundAccountPageEnum get fundAccountPageEnum => _fundAccountPageEnum;

  DepositMethod _depositMethod = DepositMethod.blockBee;
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
      case FundAccountPageEnum.blockBee:
        return BlockBee(
          model: this,
        );
      case FundAccountPageEnum.success:
        return DepositSuccess(
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
            context,
            LocaleKeys.fundAccount.tr(),
            LocaleKeys
                .views_fundAccountView_fundAccountAppBar_selectAccountToFund
                .tr(),
            this);
      case FundAccountPageEnum.selectDepositMethod:
        return fundAccountAppBar(
            context,
            LocaleKeys.deposit.tr(),
            LocaleKeys
                .views_fundAccountView_fundAccountAppBar_selectDepositMethod
                .tr(),
            this);
      case FundAccountPageEnum.onlineBank:
        return fundAccountAppBar(
            context,
            LocaleKeys.views_fundAccountView_fundAccountAppBar_onlineBank.tr(),
            LocaleKeys.views_fundAccountView_fundAccountAppBar_addOnlineBank
                .tr(),
            this);
      case FundAccountPageEnum.bitcoin:
        return fundAccountAppBar(
            context,
            LocaleKeys.views_fundAccountView_fundAccountAppBar_bitcoin.tr(),
            LocaleKeys.views_fundAccountView_fundAccountAppBar_fundUsingBitcoin
                .tr(),
            this);
      case FundAccountPageEnum.binancePay:
        return fundAccountAppBar(
            context,
            LocaleKeys.views_fundAccountView_fundAccountAppBar_binancePay.tr(),
            LocaleKeys.fundUsingBinancePay.tr(),
            this);
      case FundAccountPageEnum.neteller:
        return fundAccountAppBar(
            context,
            LocaleKeys.views_fundAccountView_fundAccountAppBar_neteller.tr(),
            LocaleKeys.views_fundAccountView_fundAccountAppBar_fundUsingNeteller
                .tr(),
            this);
      case FundAccountPageEnum.perfectMoney:
        return fundAccountAppBar(
            context,
            LocaleKeys.views_fundAccountView_fundAccountAppBar_perfectMoney
                .tr(),
            LocaleKeys
                .views_fundAccountView_fundAccountAppBar_fundUsingPerfectMoney
                .tr(),
            this);
      case FundAccountPageEnum.sticPay:
        return fundAccountAppBar(
            context,
            LocaleKeys.views_fundAccountView_fundAccountAppBar_sticPay.tr(),
            LocaleKeys.views_fundAccountView_fundAccountAppBar_fundUsingSticPay
                .tr(),
            this);
      case FundAccountPageEnum.tether:
        return fundAccountAppBar(
            context,
            LocaleKeys.views_fundAccountView_fundAccountAppBar_tether.tr(),
            LocaleKeys.views_fundAccountView_fundAccountAppBar_fundUsingTether
                .tr(),
            this);
      case FundAccountPageEnum.skrill:
        return fundAccountAppBar(
            context,
            LocaleKeys.views_fundAccountView_fundAccountAppBar_skrill.tr(),
            LocaleKeys.views_fundAccountView_fundAccountAppBar_fundUsingSkrill
                .tr(),
            this);
      case FundAccountPageEnum.blockBee:
        return fundAccountAppBar(
            context,
            LocaleKeys.views_fundAccountView_fundAccountAppBar_blockBee.tr(),
            LocaleKeys.views_fundAccountView_fundAccountAppBar_fundUsingBlockBee
                .tr(),
            this);
      default:
        return null;
    }
  }
}
