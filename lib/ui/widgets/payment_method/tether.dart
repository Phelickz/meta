import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../app/responsiveness/size.dart';
import '../../../generated/locale_keys.g.dart';
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
                LabelTextField(
                  label: LocaleKeys.walletAddress.tr(),
                  hintText: LocaleKeys
                      .paymentMethod_tetherWidgetP_enterTetherUSd
                      .tr(),
                ),
                LabelDropdown(
                  value: LocaleKeys.btcBeacon.tr(),
                  label: LocaleKeys.chooseNetwork.tr(),
                  options: [
                    LocaleKeys.btcBeacon.tr(),
                    LocaleKeys.btcBeanBEP3.tr(),
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
          text: LocaleKeys.save.tr(),
        ),
        verticalSpaceSmall(context),
        verticalSpaceXSmall(context),
      ],
    );
  }
}
