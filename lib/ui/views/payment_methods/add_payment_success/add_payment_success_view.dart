import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/responsiveness/size.dart';
import '../../../../app/utils/theme.dart';
import '../../../widgets/buttons/buttons.dart';
import '../../../widgets/skeleton.dart';
import '../payment_method_viewmodel.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "assets/images/success_illustration.svg",
              height: McGyver.rsDoubleH(context, 50),
              width: McGyver.rsDoubleH(context, 70),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: McGyver.rsDoubleW(context, 6),
              ),
              child: CustomButtons.generalButton(
                context: context,
                onTap: () {},
                text: 'Continue',
              ),
            ),
            verticalSpaceMedium(context),
            verticalSpaceSmall(context),
          ],
        ),
      ),
    );
  }

  @override
  PaymentMethodViewModel viewModelBuilder(BuildContext context) =>
      PaymentMethodViewModel();
}
