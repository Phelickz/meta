import 'package:flutter/material.dart';

import '../../../app/responsiveness/size.dart';
import '../../views/payment_methods/payment_method_viewmodel.dart';
import '../buttons/buttons.dart';
import '../dropdown/label_dropdown.dart';
import '../textfields/label_text_field.dart';

class TetherPage extends StatelessWidget {
  final PaymentMethodViewModel viewModel;
  const TetherPage({
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
                  label: "Wallet Address",
                  hintText: "Enter  TetherUSD Wallet Address",
                ),
                LabelDropdown(
                  value: "BTC Beacon Chain (BEP2)",
                  label: "Choose Network",
                  options: const [
                    "BTC Beacon Chain (BEP2)",
                    "BTC Beacon Chain (BEP3)",
                  ],
                  onChanged: (val) {
                    // viewModel.onChanged(val);
                  },
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
      ],
    );
  }
}
