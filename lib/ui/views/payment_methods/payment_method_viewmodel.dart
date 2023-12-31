import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/payment_method/app_bar.dart';
import 'package:meta_trader/ui/widgets/payment_method/binance_pay.dart';
import 'package:meta_trader/ui/widgets/payment_method/neteller.dart';
import 'package:meta_trader/ui/widgets/payment_method/online_bank.dart';
import 'package:meta_trader/ui/widgets/payment_method/payment_method_main.dart';
import 'package:meta_trader/ui/widgets/payment_method/perfect_money.dart';
import 'package:meta_trader/ui/widgets/payment_method/qrcode.dart';

import '../../../app/core/custom_base_view_model.dart';
import '../../../app/responsiveness/res.dart';
import '../../widgets/payment_method/add_payment_method.dart';
import '../../widgets/payment_method/add_payment_method_success.dart';
import '../../widgets/payment_method/skrill.dart';
import '../../widgets/payment_method/stic_pay.dart';
import '../../widgets/payment_method/tether.dart';

enum PaymentMethodPageEnum {
  main,
  onlineBank,
  binancePay,
  neteller,
  bitcoin,
  perfectMoney,
  skrill,
  sticPay,
  tether,
  qrCode,
  addPaymentMethod,
  addPaymentMethodSuccess,
  blockBee,
}

enum PaymentMethodEnum {
  onlineBank,
  binancePay,
  neteller,
  bitcoin,
  perfectMoney,
  skrill,
  sticPay,
  tether,
  blockBee,
  none,
}

class PaymentMethodViewModel extends CustomBaseViewModel {
  Future<void> init() async {}

  int _counter = 0;
  int get counter => _counter;

  bool get hasEmptyPaymentMethod => false;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  PaymentMethodPageEnum _paymentMethodPageEnum = PaymentMethodPageEnum.main;
  PaymentMethodPageEnum get paymentMethodPageEnum => _paymentMethodPageEnum;

  set paymentMethodPageEnum(PaymentMethodPageEnum e) {
    _paymentMethodPageEnum = e;
    rebuildUi();
  }

  PaymentMethodEnum _selectedAddPaymentMethodEnum = PaymentMethodEnum.none;
  PaymentMethodEnum get selectedAddPaymentMethodEnum =>
      _selectedAddPaymentMethodEnum;

  void onswitchAddPaymentMethod(PaymentMethodEnum payment) {
    _selectedAddPaymentMethodEnum = payment;
    rebuildUi();
  }

  bool isSelectedAddPaymentMethod(PaymentMethodEnum payment) {
    return _selectedAddPaymentMethodEnum == payment;
  }

  void onTap(PaymentMethodEnum payment) {
    switch (payment) {
      case PaymentMethodEnum.onlineBank:
        paymentMethodPageEnum = PaymentMethodPageEnum.onlineBank;
        break;
      case PaymentMethodEnum.binancePay:
        paymentMethodPageEnum = PaymentMethodPageEnum.binancePay;
        break;
      case PaymentMethodEnum.neteller:
        paymentMethodPageEnum = PaymentMethodPageEnum.neteller;
        break;
      case PaymentMethodEnum.bitcoin:
        paymentMethodPageEnum = PaymentMethodPageEnum.bitcoin;
        break;
      case PaymentMethodEnum.perfectMoney:
        paymentMethodPageEnum = PaymentMethodPageEnum.perfectMoney;
        break;
      case PaymentMethodEnum.skrill:
        paymentMethodPageEnum = PaymentMethodPageEnum.skrill;
        break;
      case PaymentMethodEnum.sticPay:
        paymentMethodPageEnum = PaymentMethodPageEnum.sticPay;
        break;
      case PaymentMethodEnum.tether:
        paymentMethodPageEnum = PaymentMethodPageEnum.tether;
        break;
      default:
        break;
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
        return LocaleKeys.views_fundAccountView_fundAccountAppBar_onlineBank
            .tr();
      case PaymentMethodEnum.binancePay:
        return LocaleKeys.views_fundAccountView_fundAccountAppBar_binancePay
            .tr();
      case PaymentMethodEnum.neteller:
        return LocaleKeys.views_fundAccountView_fundAccountAppBar_neteller.tr();
      case PaymentMethodEnum.bitcoin:
        return LocaleKeys.views_fundAccountView_fundAccountAppBar_bitcoin.tr();
      case PaymentMethodEnum.perfectMoney:
        return LocaleKeys.views_fundAccountView_fundAccountAppBar_perfectMoney
            .tr();
      case PaymentMethodEnum.skrill:
        return LocaleKeys.views_fundAccountView_fundAccountAppBar_skrill.tr();
      case PaymentMethodEnum.sticPay:
        return LocaleKeys.views_fundAccountView_fundAccountAppBar_sticPay.tr();
      case PaymentMethodEnum.tether:
        return "Tether (USDT ERC20)";
      default:
        return LocaleKeys.views_fundAccountView_fundAccountAppBar_tether.tr();
    }
  }

  Widget returnPage() {
    switch (_paymentMethodPageEnum) {
      case PaymentMethodPageEnum.main:
        return PaymentMethodMainPage(viewModel: this);
      case PaymentMethodPageEnum.binancePay:
        return BinancePayPage(viewModel: this);
      case PaymentMethodPageEnum.neteller:
        return NetellerPage(viewModel: this);
      case PaymentMethodPageEnum.onlineBank:
        return OnlineBankPage(viewModel: this);
      case PaymentMethodPageEnum.perfectMoney:
        return PerfectMoneyPage(viewModel: this);
      case PaymentMethodPageEnum.qrCode:
        return QrcodePage(viewModel: this);
      case PaymentMethodPageEnum.skrill:
        return SkrillPage(viewModel: this);
      case PaymentMethodPageEnum.sticPay:
        return SticPayPage(viewModel: this);
      case PaymentMethodPageEnum.tether:
        return TetherPage(viewModel: this);
      case PaymentMethodPageEnum.addPaymentMethodSuccess:
        return AddPaymentMethodSuccessPage(viewModel: this);
      case PaymentMethodPageEnum.addPaymentMethod:
        return AddPaymentMethodPage(viewModel: this);
      default:
        return Container();
    }
  }

  PreferredSizeWidget? returnAppBar(BuildContext context) {
    switch (_paymentMethodPageEnum) {
      case PaymentMethodPageEnum.main:
        return paymentMethodAppBar2(
          context,
          LocaleKeys.views_paymentMethodPageView_paymentMethod.tr(),
          '',
          this,
          'assets/images/add_square.svg',
        );
      case PaymentMethodPageEnum.binancePay:
        return paymentMethodAppBar2(
          context,
          LocaleKeys.views_fundAccountView_fundAccountAppBar_binancePay.tr(),
          LocaleKeys.views_paymentMethodPageView_addBinancePay.tr(),
          this,
          'assets/images/trash.svg',
        );
      case PaymentMethodPageEnum.neteller:
        return paymentMethodAppBar2(
          context,
          LocaleKeys.views_fundAccountView_fundAccountAppBar_neteller.tr(),
          LocaleKeys.views_paymentMethodPageView_enterNetellerAccount.tr(),
          this,
        );
      case PaymentMethodPageEnum.bitcoin:
        return paymentMethodAppBar2(
          context,
          LocaleKeys.views_fundAccountView_fundAccountAppBar_bitcoin,
          LocaleKeys.views_paymentMethodPageView_addBitcoinDetails.tr(),
          this,
        );
      case PaymentMethodPageEnum.skrill:
        return paymentMethodAppBar2(
          context,
          LocaleKeys.views_fundAccountView_fundAccountAppBar_skrill.tr(),
          LocaleKeys.views_paymentMethodPageView_enterSkrillAccount.tr(),
          this,
        );
      case PaymentMethodPageEnum.perfectMoney:
        return paymentMethodAppBar2(
          context,
          LocaleKeys.views_fundAccountView_fundAccountAppBar_perfectMoney.tr(),
          LocaleKeys.views_paymentMethodPageView_enterPaymentDetails.tr(),
          this,
        );
      case PaymentMethodPageEnum.sticPay:
        return paymentMethodAppBar2(
          context,
          LocaleKeys.views_fundAccountView_fundAccountAppBar_sticPay.tr(),
          LocaleKeys.views_paymentMethodPageView_enterSticPayAccount.tr(),
          this,
        );
      case PaymentMethodPageEnum.tether:
        return paymentMethodAppBar2(
          context,
          LocaleKeys.views_fundAccountView_fundAccountAppBar_tether.tr(),
          LocaleKeys.views_paymentMethodPageView_enterTetherDetails.tr(),
          this,
        );
      case PaymentMethodPageEnum.qrCode:
        return paymentMethodAppBar2(
          context,
          LocaleKeys.views_fundAccountView_fundAccountAppBar_binancePay.tr(),
          LocaleKeys.views_paymentMethodPageView_scanQr.tr(),
          this,
        );
      case PaymentMethodPageEnum.onlineBank:
        return paymentMethodAppBar2(
          context,
          LocaleKeys.views_fundAccountView_fundAccountAppBar_onlineBank.tr(),
          LocaleKeys.views_paymentMethodPageView_editOnlineBank.tr(),
          this,
          'assets/images/trash.svg',
        );
      case PaymentMethodPageEnum.addPaymentMethod:
        return paymentMethodAppBar2(
          context,
          LocaleKeys.views_fundAccountView_fundAccountAppBar_onlineBank.tr(),
          LocaleKeys.views_paymentMethodPageView_editOnlineBank.tr(),
          this,
        );
      default:
        return null;
    }
  }
}
