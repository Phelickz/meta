import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/withdraw_funds/app_bar.dart';
import 'package:meta_trader/ui/widgets/withdraw_funds/binance_pay.dart';
import 'package:meta_trader/ui/widgets/withdraw_funds/block_bee.dart';
import 'package:meta_trader/ui/widgets/withdraw_funds/neteller.dart';
import 'package:meta_trader/ui/widgets/withdraw_funds/online_bank.dart';
import 'package:meta_trader/ui/widgets/withdraw_funds/payment_methods.dart';
import 'package:meta_trader/ui/widgets/withdraw_funds/select_account.dart';
import 'package:meta_trader/ui/widgets/withdraw_funds/withdraw_sucess.dart';

import '../payment_methods/payment_method_viewmodel.dart';

enum WithdrawFundPageEnum {
  selectAccount,
  paymentMethods,
  onlineBank,
  binancePay,
  neteller,
  confirmation,
  success,
  blockBee,
}

class WithdrawFundViewModel extends CustomBaseViewModel {
  WithdrawFundPageEnum _withdrawFundPageEnum =
      WithdrawFundPageEnum.selectAccount;
  WithdrawFundPageEnum get withdrawFundPageEnum => _withdrawFundPageEnum;

  PaymentMethodEnum _paymentMethodEnum = PaymentMethodEnum.onlineBank;

  PaymentMethodEnum get paymentMethodPageEnum => _paymentMethodEnum;

  int _account = 0;
  int get account => _account;

  set setAccount(int e) {
    _account = e;
    rebuildUi();
  }

  set setWithdrawFundViewEnum(WithdrawFundPageEnum e) {
    _withdrawFundPageEnum = e;
    rebuildUi();
  }

  set setPaymentMethod(PaymentMethodEnum e) {
    _paymentMethodEnum = e;
    rebuildUi();
  }

  Widget returnBody(BuildContext context) {
    switch (_withdrawFundPageEnum) {
      case WithdrawFundPageEnum.selectAccount:
        return SelectAccountWithdraw(
          model: this,
        );
      case WithdrawFundPageEnum.paymentMethods:
        return PaymentMethodWithdraw(
          model: this,
        );
      case WithdrawFundPageEnum.onlineBank:
        return OnlineBankWithdraw(
          model: this,
        );
      // case FundAccountPageEnum.bitcoin:
      //   return Bitcoin(
      //     model: this,
      //   );
      case WithdrawFundPageEnum.binancePay:
        return BinancePayWithdraw(
          model: this,
        );
      case WithdrawFundPageEnum.blockBee:
        return BlockBeeWithdraw(
          model: this,
        );
      case WithdrawFundPageEnum.neteller:
        return NetellerWithdraw(
          model: this,
        );
      case WithdrawFundPageEnum.success:
        return WithdrawSuccess(
          model: this,
        );
      // case FundAccountPageEnum.perfectMoney:
      //   return PerfectMoney(
      //     model: this,
      //   );
      // case FundAccountPageEnum.sticPay:
      //   return SticPay(
      //     model: this,
      //   );
      // case FundAccountPageEnum.tether:
      //   return Tether(
      //     model: this,
      //   );
      // case FundAccountPageEnum.skrill:
      //   return Skrill(
      //     model: this,
      //   );
      default:
        return Container();
    }
  }

  AppBar? returnAppbar(BuildContext context) {
    switch (_withdrawFundPageEnum) {
      case WithdrawFundPageEnum.selectAccount:
        return withdrawFundAppBar(
            context,
            LocaleKeys.views_homeView_withdrawFunds.tr(),
            LocaleKeys.views_withdrawFundsView_selectAccountToWithdraw.tr(),
            this);
      case WithdrawFundPageEnum.paymentMethods:
        return withdrawFundAppBar(
            context,
            LocaleKeys.views_paymentMethodPageView_paymentMethod.tr(),
            '',
            this);
      case WithdrawFundPageEnum.onlineBank:
        return withdrawFundAppBar(context, LocaleKeys.onlineBankTransfer.tr(),
            LocaleKeys.withdrawToBank.tr(), this);
      // case FundAccountPageEnum.bitcoin:
      //   return fundAccountAppBar(
      //       context, 'Bitcoin (BTC)', 'Fund using Bitcoin wallet', this);
      case WithdrawFundPageEnum.binancePay:
        return withdrawFundAppBar(context, 'BinancePay',
            LocaleKeys.views_withdrawFundsView_withdrawToBinancePay.tr(), this);
      case WithdrawFundPageEnum.blockBee:
        return withdrawFundAppBar(context, 'BlockBee',
            LocaleKeys.views_withdrawFundsView_withdrawToBlockBee.tr(), this);
      case WithdrawFundPageEnum.neteller:
        return withdrawFundAppBar(context, 'Neteller',
            LocaleKeys.views_withdrawFundsView_withdrawToNeteller.tr(), this);
      // case FundAccountPageEnum.perfectMoney:
      //   return fundAccountAppBar(
      //       context, 'Perfect Money', 'Fund using Perfect Money', this);
      // case FundAccountPageEnum.sticPay:
      //   return fundAccountAppBar(
      //       context, 'SticPay', 'Fund using Stic Pay', this);
      // case FundAccountPageEnum.tether:
      //   return fundAccountAppBar(
      //       context, 'Tether (USD)', 'Fund using Tether', this);
      // case FundAccountPageEnum.skrill:
      //   return fundAccountAppBar(context, 'Skrill', 'Fund using Skrill', this);
      default:
        return null;
    }
  }

  Widget payemntMethodIcon(PaymentMethodEnum payment, BuildContext context) {
    switch (payment) {
      case PaymentMethodEnum.onlineBank:
        return Container(
          width: McGyver.rsDoubleH(context, 4),
          height: McGyver.rsDoubleH(context, 4),
          padding: const EdgeInsets.all(
            8,
          ),
          decoration: BoxDecoration(
              color: const Color(0xffD3ECFD),
              borderRadius: BorderRadius.circular(20)),
          child: SvgPicture.asset(
            "assets/images/money.svg",
            width: 20,
            height: 20,
          ),
        );
      case PaymentMethodEnum.binancePay:
        return SizedBox(
          width: McGyver.rsDoubleH(context, 4),
          height: McGyver.rsDoubleH(context, 4),
          child: Image.asset(
            "assets/images/binance_pay.png",
            width: 20,
            height: 20,
          ),
        );
      case PaymentMethodEnum.blockBee:
        return SizedBox(
          width: McGyver.rsDoubleH(context, 4),
          height: McGyver.rsDoubleH(context, 4),
          child: Image.asset(
            "assets/images/blocbee.png",
            width: 20,
            height: 20,
          ),
        );
      case PaymentMethodEnum.neteller:
        return Image.asset(
          "assets/images/neteller.png",
          width: McGyver.rsDoubleH(context, 4),
          height: McGyver.rsDoubleH(context, 4),
        );
      case PaymentMethodEnum.bitcoin:
        return Image.asset(
          "assets/images/btc.png",
          width: McGyver.rsDoubleH(context, 4),
          height: McGyver.rsDoubleH(context, 4),
        );
      case PaymentMethodEnum.perfectMoney:
        return Image.asset(
          "assets/images/perfect_money.png",
          width: McGyver.rsDoubleH(context, 4),
          height: McGyver.rsDoubleH(context, 4),
        );
      case PaymentMethodEnum.skrill:
        return Image.asset(
          "assets/images/skrill.png",
          width: McGyver.rsDoubleH(context, 4),
          height: McGyver.rsDoubleH(context, 4),
        );
      case PaymentMethodEnum.sticPay:
        return Image.asset(
          "assets/images/stic_pay.png",
          width: McGyver.rsDoubleH(context, 4),
          height: McGyver.rsDoubleH(context, 4),
        );
      case PaymentMethodEnum.tether:
        return Image.asset(
          "assets/images/tether.png",
          width: McGyver.rsDoubleH(context, 4),
          height: McGyver.rsDoubleH(context, 4),
        );

      default:
        return Container();
    }
  }

  String paymentMethodLabel(PaymentMethodEnum payment) {
    switch (payment) {
      case PaymentMethodEnum.onlineBank:
        return "Online Bank";
      case PaymentMethodEnum.binancePay:
        return "BinancePay";
      case PaymentMethodEnum.neteller:
        return "Neteller";
      case PaymentMethodEnum.bitcoin:
        return "Bitcoin (BTC)";
      case PaymentMethodEnum.perfectMoney:
        return "Perfect Money";
      case PaymentMethodEnum.skrill:
        return "Skrill";
      case PaymentMethodEnum.sticPay:
        return "SticPay";
      case PaymentMethodEnum.tether:
        return "Tether (USDT ERC20)";
      case PaymentMethodEnum.blockBee:
        return "BlockBee";
      default:
        return "Tether";
    }
  }
}
