import 'package:flutter/material.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/withdraw_funds/withdraw_funds_view_model.dart';
import 'package:meta_trader/ui/widgets/withdraw_funds/payment_method_tile_withdraw.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';
import '../../views/payment_methods/payment_method_viewmodel.dart';

class PaymentMethodWithdraw extends StatelessWidget {
  final WithdrawFundViewModel model;
  const PaymentMethodWithdraw({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: McGyver.rsDoubleW(context, 6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceXSmall(context),
            Text(
              LocaleKeys.withdrawFunds_paymentMethodWidget_selectPreferred,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.5),
                fontWeight: FontWeight.w500,
                color: isDarkMode
                    ? const Color(0xFF98A2B3)
                    : const Color(0xFF475467),
              ),
            ),
            verticalSpaceXSmall(context),
            PaymentMethodTileWithdraw(
              vm: model,
              paymentMethodEnum: PaymentMethodEnum.blockBee,
              onTap: () {
                model.setWithdrawFundViewEnum = WithdrawFundPageEnum.blockBee;
                model.setPaymentMethod = PaymentMethodEnum.blockBee;
              },
            ),
            // PaymentMethodTileWithdraw(
            //   vm: model,
            //   paymentMethodEnum: PaymentMethodEnum.onlineBank,
            //   onTap: () {
            //     model.setWithdrawFundViewEnum = WithdrawFundPageEnum.onlineBank;
            //     model.setPaymentMethod = PaymentMethodEnum.onlineBank;
            //   },
            // ),
            // PaymentMethodTileWithdraw(
            //   vm: model,
            //   paymentMethodEnum: PaymentMethodEnum.binancePay,
            //   onTap: () {
            //     model.setWithdrawFundViewEnum = WithdrawFundPageEnum.binancePay;
            //     model.setPaymentMethod = PaymentMethodEnum.binancePay;
            //   },
            // ),
            // PaymentMethodTileWithdraw(
            //   vm: model,
            //   paymentMethodEnum: PaymentMethodEnum.neteller,
            //   onTap: () {
            //     model.setWithdrawFundViewEnum = WithdrawFundPageEnum.neteller;
            //     model.setPaymentMethod = PaymentMethodEnum.neteller;
            //   },
            // ),
            // PaymentMethodTileWithdraw(
            //   vm: model,
            //   paymentMethodEnum: PaymentMethodEnum.perfectMoney,
            // ),
            // PaymentMethodTileWithdraw(
            //   vm: model,
            //   paymentMethodEnum: PaymentMethodEnum.skrill,
            // ),
            // PaymentMethodTileWithdraw(
            //   vm: model,
            //   paymentMethodEnum: PaymentMethodEnum.sticPay,
            // ),
            // PaymentMethodTileWithdraw(
            //   vm: model,
            //   paymentMethodEnum: PaymentMethodEnum.tether,
            // ),
          ],
        ),
      ),
    );
  }
}
