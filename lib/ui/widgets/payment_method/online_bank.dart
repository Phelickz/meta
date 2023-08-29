import 'package:flutter/material.dart';

import '../../../app/responsiveness/size.dart';
import '../../views/payment_methods/payment_method_viewmodel.dart';
import '../buttons/buttons.dart';
import '../textfields/label_text_field.dart';

class OnlineBankPage extends StatelessWidget {
  final PaymentMethodViewModel viewModel;
  const OnlineBankPage({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceXSmall(context),
                const LabelTextField(
                  label: "Account Name",
                  hintText: "Susan Blake",
                  isEnabled: false,
                ),
                const LabelTextField(
                  label: "Account Number",
                  hintText: "23458755632",
                ),
                const LabelTextField(
                  label: "Bank Name",
                  hintText: "Enter bank name",
                ),
                const LabelTextField(
                  label: "Account opening branch (optional)",
                  hintText: "Enter bank branch information",
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
          text: 'Save Changes',
        ),
        verticalSpaceSmall(context),
        verticalSpaceXSmall(context),
      ],
    );
  }
}
