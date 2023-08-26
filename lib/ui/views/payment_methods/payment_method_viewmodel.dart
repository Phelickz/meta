import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/payment_methods/add_payment_method/pm_add_view.dart';
import 'package:meta_trader/ui/views/payment_methods/pm_binance_pay/pm_binance_pay_view.dart';
import 'package:meta_trader/ui/views/payment_methods/pm_neteller/pm_neteller_view.dart';
import 'package:meta_trader/ui/views/payment_methods/pm_perfect_money.dart/pm_perfect_money.dart';
import 'package:meta_trader/ui/views/payment_methods/pm_skrill/pm_skrill_view.dart';
import 'package:meta_trader/ui/views/payment_methods/pm_stic_pay/pm_stic_pay_view.dart';
import 'package:meta_trader/ui/views/payment_methods/pm_tether/pm_tether_view.dart';

import '../../../app/core/custom_base_view_model.dart';
import '../../../app/responsiveness/res.dart';
import 'pm_main/pm_main_view.dart';
import 'pm_online_bank/pm_online_view.dart';

class PaymentMethodViewModel extends CustomBaseViewModel {
  Future<void> init() async {}

  int _counter = 0;
  int get counter => _counter;

  bool get hasEmptyPaymentMethod => false;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  PaymentMethodEnum _selectedAddPaymentMethodEnum = PaymentMethodEnum.home;
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
        _selectedAddPaymentMethodEnum = PaymentMethodEnum.onlineBank;
        // push(const PmOnlineRoute());
        break;
      case PaymentMethodEnum.binancePay:
        _selectedAddPaymentMethodEnum = PaymentMethodEnum.binancePay;
        // push(const PmBinancePayRoute());
        break;
      case PaymentMethodEnum.neteller:
        _selectedAddPaymentMethodEnum = PaymentMethodEnum.neteller;
        // push(const PmNetellerRoute());
        break;
      case PaymentMethodEnum.bitcoin:
        _selectedAddPaymentMethodEnum = PaymentMethodEnum.bitcoin;
        // push(const PmBitcoinRoute());
        break;
      case PaymentMethodEnum.perfectMoney:
        _selectedAddPaymentMethodEnum = PaymentMethodEnum.perfectMoney;
        // push(const PmPerfectMoneyRoute());
        break;
      case PaymentMethodEnum.skrill:
        _selectedAddPaymentMethodEnum = PaymentMethodEnum.skrill;
        // push(const PmSkrillRoute());
        break;
      case PaymentMethodEnum.sticPay:
        _selectedAddPaymentMethodEnum = PaymentMethodEnum.sticPay;
        // push(const PmSticPayRoute());
        break;
      case PaymentMethodEnum.tether:
        _selectedAddPaymentMethodEnum = PaymentMethodEnum.tether;
        // push(const PmTetherRoute());
        break;
      default:
        break;
    }
    rebuildUi();
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
      case PaymentMethodEnum.add:
        return "Payment Method";
      default:
        return "Payment Methods";
    }
  }

  String paymentMethodSubtitle(PaymentMethodEnum payment) {
    switch (payment) {
      case PaymentMethodEnum.onlineBank:
        return "Edit online bank";
      case PaymentMethodEnum.binancePay:
        return "Add BinancePay details";
      case PaymentMethodEnum.neteller:
        return "Enter Neteller account details";
      case PaymentMethodEnum.bitcoin:
        return "Add Bitcoin details";
      case PaymentMethodEnum.perfectMoney:
        return "Enter payment details";
      case PaymentMethodEnum.skrill:
        return "Enter Skrill account details";
      case PaymentMethodEnum.sticPay:
        return "Enter SticPay account details";
      case PaymentMethodEnum.tether:
        return "Add TetherUSD details";
      case PaymentMethodEnum.add:
        return "Add payment method";
      default:
        return "";
    }
  }

  Widget returnPage(BuildContext context) {
    switch (_selectedAddPaymentMethodEnum) {
      case PaymentMethodEnum.onlineBank:
        return PmOnlineView(
          viewModel: this,
        );
      case PaymentMethodEnum.home:
        return PaymentMethodHome(
          viewModel: this,
        );
      case PaymentMethodEnum.binancePay:
        return PmBinancePayView(
          viewModel: this,
        );
      case PaymentMethodEnum.neteller:
        return PmNetellerView(
          viewModel: this,
        );
      case PaymentMethodEnum.perfectMoney:
        return PmPerfectMoneyView(
          viewModel: this,
        );
      case PaymentMethodEnum.skrill:
        return PmSkrillView(
          viewModel: this,
        );
      case PaymentMethodEnum.sticPay:
        return PmSticPayView(
          viewModel: this,
        );
      case PaymentMethodEnum.tether:
        return PmTetherView(
          viewModel: this,
        );
      case PaymentMethodEnum.add:
        return PmAddView(
          viewModel: this,
        );
      default:
        return Container();
    }
  }

  List<Widget>? returnActions(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    switch (_selectedAddPaymentMethodEnum) {
      case PaymentMethodEnum.home:
        return [
          GestureDetector(
            onTap: () {
              _selectedAddPaymentMethodEnum = PaymentMethodEnum.add;
              rebuildUi();
            },
            child: SizedBox(
              height: McGyver.rsDoubleH(context, 2.8),
              width: McGyver.rsDoubleH(context, 2.8),
              child: SvgPicture.asset(
                "assets/images/add_square.svg",
                colorFilter: ColorFilter.mode(
                  isDarkMode
                      ? const Color(0xff98A2B3)
                      : const Color(0xFF667085),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          horizontalSpaceSmall(context),
        ];
      case PaymentMethodEnum.onlineBank:
        return [
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              height: McGyver.rsDoubleH(context, 2.8),
              width: McGyver.rsDoubleH(context, 2.8),
              child: SvgPicture.asset(
                "assets/images/trash.svg",
                colorFilter: ColorFilter.mode(
                  isDarkMode
                      ? const Color(0xff98A2B3)
                      : const Color(0xFF667085),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          horizontalSpaceSmall(context),
        ];
      case PaymentMethodEnum.binancePay:
        return [
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              height: McGyver.rsDoubleH(context, 2.8),
              width: McGyver.rsDoubleH(context, 2.8),
              child: SvgPicture.asset(
                "assets/images/trash.svg",
                colorFilter: ColorFilter.mode(
                  isDarkMode
                      ? const Color(0xff98A2B3)
                      : const Color(0xFF667085),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          horizontalSpaceSmall(context),
        ];
      case PaymentMethodEnum.add:
        return [
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              height: McGyver.rsDoubleH(context, 2.8),
              width: McGyver.rsDoubleH(context, 2.8),
              child: SvgPicture.asset(
                "assets/images/trash.svg",
                colorFilter: ColorFilter.mode(
                  isDarkMode
                      ? const Color(0xff98A2B3)
                      : const Color(0xFF667085),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          horizontalSpaceSmall(context),
        ];
      default:
        return [];
    }
  }
}
