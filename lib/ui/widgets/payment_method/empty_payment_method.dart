import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';

import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';
import '../../../generated/locale_keys.g.dart';
import '../../views/payment_methods/payment_method_viewmodel.dart';
import '../buttons/buttons.dart';

class EmptyPaymentMethod extends StatelessWidget {
  final PaymentMethodViewModel viewModel;
  const EmptyPaymentMethod({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          verticalSpaceLarge(context),
          Container(
            height: McGyver.rsDoubleH(context, 10),
            width: McGyver.rsDoubleH(context, 10),
            padding: EdgeInsets.all(
              McGyver.rsDoubleH(context, 1.5),
            ),
            decoration: BoxDecoration(
                color: isDarkMode
                    ? const Color(0xFF052844)
                    : const Color(0xFFD3ECFD),
                borderRadius: BorderRadius.circular(
                  McGyver.rsDoubleH(context, 2),
                )),
            child: SizedBox(
                height: McGyver.rsDoubleH(context, 8),
                width: McGyver.rsDoubleH(context, 8),
                child: SvgPicture.asset("assets/images/empty_payment.svg")),
          ),
          verticalSpaceSmall(context),
          Text(
            LocaleKeys.paymentMethod_emptyPaymentWidgetP_noPaymentMethod,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.8),
              fontWeight: FontWeight.bold,
              color: isDarkMode
                  ? const Color(0xFFD0D5DD)
                  : const Color(0xFF98A2B3),
            ),
          ),
          SizedBox(
            height: McGyver.rsDoubleH(context, 48),
          ),
          CustomButtons.generalButton(
            context: context,
            onTap: () {
              viewModel.paymentMethodPageEnum =
                  PaymentMethodPageEnum.addPaymentMethod;
            },
            text: LocaleKeys.paymentMethod_emptyPaymentWidgetP_addPayMethod,
          ),
        ],
      ),
    );
  }
}
