import 'package:flutter/material.dart';
import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../generated/locale_keys.g.dart';
import '../../views/payment_methods/payment_method_viewmodel.dart';
import '../buttons/buttons.dart';
import '../dropdown/label_dropdown.dart';
import '../textfields/label_text_field.dart';

class BitcoinPage extends StatelessWidget {
  final PaymentMethodViewModel viewModel;
  const BitcoinPage({super.key, required this.viewModel});

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
                      label: LocaleKeys.walletAddress,
                      hintText: LocaleKeys
                          .paymentMethod_bitcoinWidgetP_enterBitcoinWallet,
                    ),
                    LabelDropdown(
                      value: LocaleKeys.btcBeacon,
                      label: LocaleKeys.chooseNetwork,
                      options: const [
                        LocaleKeys.btcBeacon,
                        LocaleKeys.btcBeanBEP3,
                      ],
                      onChanged: (val) {
                        // viewModel.onChanged(val);
                      },
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
              text: LocaleKeys.save,
            ),
          ),
          verticalSpaceSmall(context),
          verticalSpaceXSmall(context),
        ],
      ),
    );
  }
}
