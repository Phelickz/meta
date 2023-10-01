import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../app/responsiveness/size.dart';
import '../../../generated/locale_keys.g.dart';
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
              LabelTextField(
                label: LocaleKeys.name.tr(),
                hintText: LocaleKeys
                    .paymentMethod_binancePayWidgetP_enterWalletInformation
                    .tr(),
              ),
              LabelTextField(
                label: LocaleKeys.payId.tr(),
                hintText: LocaleKeys.enterPayId.tr(),
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
        text: LocaleKeys.save.tr(),
      ),
      verticalSpaceSmall(context),
      verticalSpaceXSmall(context),
    ]);
  }
}
