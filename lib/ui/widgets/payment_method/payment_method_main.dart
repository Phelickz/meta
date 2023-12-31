import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/ui/widgets/payment_method/payment_method_tile.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';
import '../../../generated/locale_keys.g.dart';
import '../../views/payment_methods/payment_method_viewmodel.dart';
import 'empty_payment_method.dart';

class PaymentMethodMainPage extends StatelessWidget {
  final PaymentMethodViewModel viewModel;
  const PaymentMethodMainPage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return viewModel.hasEmptyPaymentMethod
        ? EmptyPaymentMethod(
            viewModel: viewModel,
          )
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceXSmall(context),
                Text(
                  LocaleKeys.paymentMethod_paymentMethodWidgetP_manageYourCash,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.5),
                    fontWeight: FontWeight.w500,
                    color: isDarkMode
                        ? const Color(0xFF98A2B3)
                        : const Color(0xFF475467),
                  ),
                ).tr(),
                PaymentMethodTile(
                  vm: viewModel,
                  paymentMethodEnum: PaymentMethodEnum.onlineBank,
                ),
                PaymentMethodTile(
                  vm: viewModel,
                  paymentMethodEnum: PaymentMethodEnum.binancePay,
                ),
                PaymentMethodTile(
                  vm: viewModel,
                  paymentMethodEnum: PaymentMethodEnum.neteller,
                ),
                PaymentMethodTile(
                  vm: viewModel,
                  paymentMethodEnum: PaymentMethodEnum.perfectMoney,
                ),
                PaymentMethodTile(
                  vm: viewModel,
                  paymentMethodEnum: PaymentMethodEnum.skrill,
                ),
                PaymentMethodTile(
                  vm: viewModel,
                  paymentMethodEnum: PaymentMethodEnum.sticPay,
                ),
                PaymentMethodTile(
                  vm: viewModel,
                  paymentMethodEnum: PaymentMethodEnum.tether,
                ),
              ],
            ),
          );
  }
}
