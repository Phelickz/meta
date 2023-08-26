import 'package:flutter/material.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../views/payment_methods/payment_method_viewmodel.dart';
import '../buttons/buttons.dart';
import '../textfields/label_text_field.dart';

class SkrillPage extends StatelessWidget {
  final PaymentMethodViewModel viewModel;
  const SkrillPage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
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
                    const LabelTextField(
                      label: "Email Address",
                      hintText: "Enter Email address",
                    ),
                    const LabelTextField(
                      label: "Pay ID",
                      hintText: "Enter Pay ID",
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: McGyver.rsDoubleW(context, 6),
            ),
            child: CustomButtons.generalButton(
              context: context,
              onTap: () {
                viewModel.paymentMethodPageEnum =
                    PaymentMethodPageEnum.addPaymentMethodSuccess;
              },
              text: 'Save',
            ),
          ),
          verticalSpaceSmall(context),
          verticalSpaceXSmall(context),
        ],
      ),
    );
  }
}
