import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app/core/custom_base_view_model.dart';
import 'pm_main/pm_main_view.dart';

class PaymentMethodViewModel extends CustomBaseViewModel {
  Future<void> init() async {}

  int _counter = 0;
  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  //  PaymentMethodEnum _paymentMethodEnum = PaymentMethodEnum.onlineBank;
  // PaymentMethodEnum get paymentMethodEnum => _paymentMethodEnum;

  // set setAuthPageEnum(AuthPageEnum e) {
  //   _paymentMethodEnum = e;
  //   rebuildUi();
  // }

  Widget payemntMethodIcon(PaymentMethodEnum payment) {
    switch (payment) {
      case PaymentMethodEnum.onlineBank:
        return Container(
          width: 40,
          height: 40,
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
          width: 40,
          height: 40,
          child: Image.asset(
            "assets/images/binance_pay.png",
            width: 20,
            height: 20,
          ),
        );
      case PaymentMethodEnum.neteller:
        return SizedBox(
          width: 40,
          height: 40,
          child: Image.asset(
            "assets/images/neteller.png",
            width: 40,
            height: 40,
          ),
        );
      case PaymentMethodEnum.bitcoin:
        return SizedBox(
          width: 40,
          height: 40,
          child: Image.asset(
            "assets/images/btc.png",
            width: 40,
            height: 40,
          ),
        );
      case PaymentMethodEnum.perfectMoney:
        return SizedBox(
          width: 40,
          height: 40,
          child: Image.asset(
            "assets/images/perfect_money.png",
            width: 40,
            height: 40,
          ),
        );
      case PaymentMethodEnum.skrill:
        return SizedBox(
          width: 40,
          height: 40,
          child: Image.asset(
            "assets/images/skrill.png",
            width: 40,
            height: 40,
          ),
        );
      case PaymentMethodEnum.sticPay:
        return SizedBox(
          width: 40,
          height: 40,
          child: Image.asset(
            "assets/images/stic_pay.png",
            width: 40,
            height: 40,
          ),
        );
      case PaymentMethodEnum.tether:
        return SizedBox(
          width: 40,
          height: 40,
          child: Image.asset(
            "assets/images/tether.png",
            width: 40,
            height: 40,
          ),
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
        return "Undefined Method Label";
    }
  }
}
