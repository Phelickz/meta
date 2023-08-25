import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/responsiveness/size.dart';
import '../../../../app/utils/theme.dart';
import '../../../widgets/buttons/buttons.dart';
import '../../../widgets/payment_method/custom_back_button.dart';
import '../../../widgets/skeleton.dart';
import '../payment_method_viewmodel.dart';

@RoutePage()
class PmQrcodeView extends StackedView<PaymentMethodViewModel> {
  const PmQrcodeView({super.key});

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
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: McGyver.rsDoubleW(context, 6),
                vertical: McGyver.rsDoubleW(context, 4),
              ),
              decoration: BoxDecoration(
                color: isDarkMode
                    ? const Color(0xFF052844)
                    : const Color(0xFFFAFDFF),
              ),
              child: Row(
                children: [
                  CustomBackButton(
                    onTap: () => viewModel.goBack(),
                  ),
                  horizontalSpaceMedium(context),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "BinancePay",
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 2.2),
                            fontWeight: FontWeight.bold,
                            color: isDarkMode
                                ? const Color(0xFFD0D5DD)
                                : const Color(0xFF344054),
                          ),
                        ),
                        Text(
                          "Scan QR code",
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.7),
                            fontWeight: FontWeight.w500,
                            color: isDarkMode
                                ? const Color(0xFF667085)
                                : const Color(0xFF667085),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
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
                              "Point the camera at the QR code",
                              style: CustomThemeData.generateStyle(
                                fontSize: McGyver.textSize(context, 1.8),
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFD0D5DD),
                              ),
                            ),
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
                              "Or enter BinancePay ID Instead",
                              style: CustomThemeData.generateStyle(
                                fontSize: McGyver.textSize(context, 1.8),
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFD0D5DD),
                              ),
                            ),
                          ],
                        ),
                        verticalSpaceSmall(context),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: McGyver.rsDoubleW(context, 6),
                          ),
                          child: CustomButtons.generalButton(
                            context: context,
                            onTap: () {
                              viewModel.goToAddPaymentMethodSucess();
                            },
                            text: 'Enter Pay ID',
                          ),
                        ),
                        verticalSpaceSmall(context),
                        verticalSpaceXSmall(context),
                      ],
                    ),
                  ),
                ],
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
