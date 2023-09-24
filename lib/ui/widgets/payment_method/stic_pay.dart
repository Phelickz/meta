import 'package:flutter/material.dart';

import '../../../app/responsiveness/size.dart';
import '../../../generated/locale_keys.g.dart';
import '../../views/payment_methods/payment_method_viewmodel.dart';
import '../buttons/buttons.dart';
import '../textfields/label_text_field.dart';

class SticPayPage extends StatelessWidget {
  final PaymentMethodViewModel viewModel;
  const SticPayPage({super.key, required this.viewModel});

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
                    label: LocaleKeys.emailAddress,
                    hintText: LocaleKeys.auth_enterEmail),
                const LabelTextField(
                  label: LocaleKeys.payId,
                  hintText: LocaleKeys.enterPayId,
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
          text: LocaleKeys.save,
        ),
        verticalSpaceSmall(context),
        verticalSpaceXSmall(context),
      ],
    );
  }
}
