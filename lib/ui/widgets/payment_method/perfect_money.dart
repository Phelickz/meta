import 'package:flutter/material.dart';

import '../../../app/responsiveness/size.dart';
import '../../../generated/locale_keys.g.dart';
import '../../views/payment_methods/payment_method_viewmodel.dart';
import '../buttons/buttons.dart';
import '../textfields/label_text_field.dart';

class PerfectMoneyPage extends StatelessWidget {
  final PaymentMethodViewModel viewModel;
  const PerfectMoneyPage({super.key, required this.viewModel});

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
                  hintText: LocaleKeys.auth_enterEmail,
                ),
                const LabelTextField(
                  label: LocaleKeys.payId,
                  hintText: LocaleKeys.enterPayId,
                ),
                const LabelTextField(
                  label:
                      LocaleKeys.fundAccountWidget_onlineBankWidget_accountName,
                  hintText: "Susan Blake",
                  isEnabled: false,
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
