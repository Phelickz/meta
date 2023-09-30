import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';
import '../../../generated/locale_keys.g.dart';
import '../../views/payment_methods/payment_method_viewmodel.dart';
import '../buttons/buttons.dart';

class QrcodePage extends StatelessWidget {
  final PaymentMethodViewModel viewModel;
  const QrcodePage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //TODO
        // Camera Preview
        Container(
          color: Colors.white12,
        ),
        Container(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpaceXSmall(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.paymentMethod_qrCodeP_pointCamera,
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.8),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFD0D5DD),
                    ),
                  ).tr(),
                ],
              ),
              verticalSpaceMedium(context),
              Container(
                height: McGyver.rsDoubleW(context, 80),
                width: McGyver.rsDoubleW(context, 80),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(
                      McGyver.rsDoubleH(context, 3),
                    )),
              ),
              verticalSpaceLarge(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.paymentMethod_qrCodeP_enterBinancePay,
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.8),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFD0D5DD),
                    ),
                  ).tr(),
                ],
              ),
              verticalSpaceSmall(context),
              CustomButtons.generalButton(
                context: context,
                onTap: () {
                  //TODO:
                },
                text: LocaleKeys.enterPayId.tr(),
              ),
              verticalSpaceSmall(context),
              verticalSpaceXSmall(context),
            ],
          ),
        ),
      ],
    );
  }
}
