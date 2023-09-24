import 'package:flutter/material.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';
import '../../views/payment_methods/payment_method_viewmodel.dart';
import '../buttons/buttons.dart';

class AddPaymentMethodSuccessPage extends StatelessWidget {
  final PaymentMethodViewModel viewModel;
  const AddPaymentMethodSuccessPage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      children: [
        verticalSpaceMedium(context),
        SizedBox(
          height: McGyver.rsDoubleH(context, 50),
          width: McGyver.rsDoubleW(context, 100),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: McGyver.rsDoubleW(context, 10),
            ),
            child: isDarkMode
                ? Image.asset(
                    "assets/images/success_illustration_dark.png",
                    fit: BoxFit.contain,
                  )
                : Image.asset(
                    "assets/images/success_illustration_light.png",
                  ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: McGyver.rsDoubleW(context, 10),
          ),
          child: Text(
            LocaleKeys
                .paymentMethod_addPaymentMethodSuccess_paymentMethodAddSuccess,
            textAlign: TextAlign.center,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 3),
              fontWeight: FontWeight.w700,
              color: isDarkMode
                  ? const Color(0xFFF2F4F7)
                  : const Color(0xff475467),
            ),
          ),
        ),
        verticalSpaceSmall(context),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text:
                LocaleKeys.paymentMethod_addPaymentMethodSuccess_nowYouCanMake,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 2),
              fontWeight: FontWeight.w500,
              color: isDarkMode
                  ? const Color(0xff667085)
                  : const Color(0xff667085),
            ),
            children: [
              TextSpan(
                text: viewModel
                    .paymentMethodLabel(viewModel.selectedAddPaymentMethodEnum),
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2),
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff77C5F8),
                ),
              ),
              const TextSpan(
                text: LocaleKeys
                    .paymentMethod_addPaymentMethodSuccess_usingInformation,
              )
            ],
          ),
        ),
        verticalSpaceMedium(context),
        CustomButtons.generalButton(
          context: context,
          onTap: () {
            viewModel.paymentMethodPageEnum = PaymentMethodPageEnum.main;
          },
          text: LocaleKeys.continueWord,
        ),
      ],
    );
  }
}
