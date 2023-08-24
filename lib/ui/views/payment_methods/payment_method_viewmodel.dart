import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/router/router.gr.dart';

import '../../../app/core/custom_base_view_model.dart';
import '../../../app/responsiveness/res.dart';
import 'pm_main/pm_main_view.dart';

class PaymentMethodViewModel extends CustomBaseViewModel {
  Future<void> init() async {}

  int _counter = 0;
  int get counter => _counter;

  void incrementCounter() {
    _counter++;
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

  void goToAddPaymentMethodSucess() {
    push(const PmAddPaymentSuccessRoute());
  }

  void onTap(PaymentMethodEnum payment) {
    switch (payment) {
      case PaymentMethodEnum.onlineBank:
        push(const PmOnlineRoute());
        break;
      case PaymentMethodEnum.binancePay:
        push(const PmBinancePayRoute());
        break;
      case PaymentMethodEnum.neteller:
        push(const PmNetellerRoute());
        break;
      case PaymentMethodEnum.bitcoin:
        push(const PmBitcoinRoute());
        break;
      case PaymentMethodEnum.perfectMoney:
        push(const PmPerfectMoneyRoute());
        break;
      case PaymentMethodEnum.skrill:
        push(const PmSkrillRoute());
        break;
      case PaymentMethodEnum.sticPay:
        push(const PmSticPayRoute());
        break;
      case PaymentMethodEnum.tether:
        push(const PmTetherRoute());
        break;
      default:
        break;
    }
  }

  Widget payemntMethodIcon(PaymentMethodEnum payment, BuildContext context) {
    switch (payment) {
      case PaymentMethodEnum.onlineBank:
        return Container(
          width: McGyver.rsDoubleH(context, 5),
          height: McGyver.rsDoubleH(context, 5),
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
          width: McGyver.rsDoubleH(context, 5),
          height: McGyver.rsDoubleH(context, 5),
        );
      case PaymentMethodEnum.bitcoin:
        return Image.asset(
          "assets/images/btc.png",
          width: McGyver.rsDoubleH(context, 5),
          height: McGyver.rsDoubleH(context, 5),
        );
      case PaymentMethodEnum.perfectMoney:
        return Image.asset(
          "assets/images/perfect_money.png",
          width: McGyver.rsDoubleH(context, 5),
          height: McGyver.rsDoubleH(context, 5),
        );
      case PaymentMethodEnum.skrill:
        return Image.asset(
          "assets/images/skrill.png",
          width: McGyver.rsDoubleH(context, 5),
          height: McGyver.rsDoubleH(context, 5),
        );
      case PaymentMethodEnum.sticPay:
        return Image.asset(
          "assets/images/stic_pay.png",
          width: McGyver.rsDoubleH(context, 5),
          height: McGyver.rsDoubleH(context, 5),
        );
      case PaymentMethodEnum.tether:
        return Image.asset(
          "assets/images/tether.png",
          width: McGyver.rsDoubleH(context, 5),
          height: McGyver.rsDoubleH(context, 5),
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
      default:
        return "Tether";
    }
  }
}
