import 'package:easy_localization/easy_localization.dart';
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
                LabelTextField(
                  label: LocaleKeys
                      .fundAccountWidget_onlineBankWidget_accountName
                      .tr(),
                  hintText: "Susan Blake",
                  isEnabled: false,
                ),
                LabelTextField(
                  label: LocaleKeys
                      .fundAccountWidget_onlineBankWidget_accountNumber
                      .tr(),
                  hintText: "23458755632",
                ),
                LabelTextField(
                  label:
                      LocaleKeys.paymentMethod_onlineBankWidgetP_bankName.tr(),
                  hintText: LocaleKeys
                      .paymentMethod_onlineBankWidgetP_enterBankName
                      .tr(),
                ),
                LabelTextField(
                  label: LocaleKeys
                      .paymentMethod_onlineBankWidgetP_accountOpening
                      .tr(),
                  hintText: LocaleKeys
                      .paymentMethod_onlineBankWidgetP_enterBranchInformation
                      .tr(),
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
          text: LocaleKeys.saveChanges.tr(),
        ),
        verticalSpaceSmall(context),
        verticalSpaceXSmall(context),
      ],
    );
  }
}
