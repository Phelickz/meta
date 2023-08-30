import 'package:flutter/material.dart';

import '../../../app/responsiveness/size.dart';
import '../../views/payment_methods/payment_method_viewmodel.dart';
import '../buttons/buttons.dart';
import 'add_payment_method_tile.dart';

class AddPaymentMethodPage extends StatelessWidget {
  final PaymentMethodViewModel viewModel;
  const AddPaymentMethodPage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
