import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/responsiveness/size.dart';
import '../../../../app/utils/theme.dart';
import '../../../widgets/buttons/buttons.dart';
import '../../../widgets/skeleton.dart';
import '../payment_method_viewmodel.dart';
import 'package:meta_trader/app/router/router.gr.dart';

@RoutePage(name: "PmAddPaymentSuccessRoute")
class PmAddPaymentSuccessView extends StackedView<PaymentMethodViewModel> {
  const PmAddPaymentSuccessView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    PaymentMethodViewModel viewModel,
    Widget? child,
  ) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
      isBusy: viewModel.isBusy,
      bodyPadding: EdgeInsets.zero,
      backgroundColor:
          isDarkMode ? const Color(0xFF0C2031) : const Color(0xFFFAFDFF),
      body: SafeArea(
        child: Column(
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
                "Payment Method Added Successfully",
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
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: McGyver.rsDoubleW(context, 12),
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Now you can make withdrawals via ',
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 2),
                    fontWeight: FontWeight.w500,
                    color: isDarkMode
                        ? const Color(0xff667085)
                        : const Color(0xff667085),
                  ),
                  children: [
                    TextSpan(
                      text: viewModel.paymentMethodLabel(
                          viewModel.selectedAddPaymentMethodEnum),
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 2),
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff77C5F8),
                      ),
                    ),
                    const TextSpan(
                      text: ', using the information you provided',
                    )
                  ],
                ),
              ),
            ),
            verticalSpaceMedium(context),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: McGyver.rsDoubleW(context, 6),
              ),
              child: CustomButtons.generalButton(
                context: context,
                onTap: () {
                  viewModel.push(const PmMainRoute());
                },
                text: 'Continue',
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  PaymentMethodViewModel viewModelBuilder(BuildContext context) =>
      PaymentMethodViewModel();
}
