import 'package:flutter/material.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';

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
                  label:
                      LocaleKeys.fundAccountWidget_onlineBankWidget_accountName,
                  hintText: "Susan Blake",
                  isEnabled: false,
                ),
                const LabelTextField(
                  label: LocaleKeys
                      .fundAccountWidget_onlineBankWidget_accountNumber,
                  hintText: "23458755632",
                ),
                const LabelTextField(
                  label: LocaleKeys.paymentMethod_onlineBankWidgetP_bankName,
                  hintText:
                      LocaleKeys.paymentMethod_onlineBankWidgetP_enterBankName,
                ),
                const LabelTextField(
                  label:
                      LocaleKeys.paymentMethod_onlineBankWidgetP_accountOpening,
                  hintText: LocaleKeys
                      .paymentMethod_onlineBankWidgetP_enterBranchInformation,
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
          text: LocaleKeys.saveChanges,
        ),
        verticalSpaceSmall(context),
        verticalSpaceXSmall(context),
      ],
    );
  }
}
