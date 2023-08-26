import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/responsiveness/size.dart';
import '../../../widgets/buttons/buttons.dart';
import '../../../widgets/payment_method/add_payment_method_tile.dart';
import '../payment_method_viewmodel.dart';
import '../pm_main/pm_main_view.dart';

@RoutePage()
class PmAddView extends StatelessWidget {
  const PmAddView({super.key, required this.viewModel});
  final PaymentMethodViewModel viewModel;

  @override
  // A builder function that gives us a ViewModel
  Widget build(
    BuildContext context,
  ) {
    // var isDarkMode = CustomThemeData.isDarkMode(context);
    return SafeArea(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: McGyver.rsDoubleW(context, 6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceXSmall(context),
                  AddPaymentMethodTile(
                    vm: viewModel,
                    paymentMethodEnum: PaymentMethodEnum.onlineBank,
                  ),
                  AddPaymentMethodTile(
                    vm: viewModel,
                    paymentMethodEnum: PaymentMethodEnum.binancePay,
                  ),
                  AddPaymentMethodTile(
                    vm: viewModel,
                    paymentMethodEnum: PaymentMethodEnum.neteller,
                  ),
                  AddPaymentMethodTile(
                    vm: viewModel,
                    paymentMethodEnum: PaymentMethodEnum.perfectMoney,
                  ),
                  AddPaymentMethodTile(
                    vm: viewModel,
                    paymentMethodEnum: PaymentMethodEnum.skrill,
                  ),
                  AddPaymentMethodTile(
                    vm: viewModel,
                    paymentMethodEnum: PaymentMethodEnum.sticPay,
                  ),
                  AddPaymentMethodTile(
                    vm: viewModel,
                    paymentMethodEnum: PaymentMethodEnum.tether,
                  ),
                  verticalSpaceXSmall(context),
                  CustomButtons.generalButton(
                    context: context,
                    onTap: () {
                      viewModel.onTap(viewModel.selectedAddPaymentMethodEnum);
                    },
                    text: 'Continue',
                  ),
                  verticalSpaceSmall(context),
                  verticalSpaceXSmall(context),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
