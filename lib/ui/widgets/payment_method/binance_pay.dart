import 'package:flutter/material.dart';

import '../../../app/responsiveness/size.dart';
import '../../views/payment_methods/payment_method_viewmodel.dart';
import '../buttons/buttons.dart';
import '../textfields/label_text_field.dart';

class BinancePayPage extends StatelessWidget {
  final PaymentMethodViewModel viewModel;
  const BinancePayPage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceXSmall(context),
              const LabelTextField(
                label: "Name",
                hintText: "Enter Wallet Information",
              ),
              const LabelTextField(
                label: "Pay ID",
                hintText: "Enter Pay ID",
              ),
            ],
          ),
        ),
      ),
      CustomButtons.generalButton(
        context: context,
        onTap: () {
          viewModel.paymentMethodPageEnum =
              PaymentMethodPageEnum.addPaymentMethodSuccess;
        },
        text: 'Save',
      ),
      verticalSpaceSmall(context),
      verticalSpaceXSmall(context),
    ]);
  }
}
