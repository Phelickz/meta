import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/responsiveness/size.dart';
import '../../../../app/utils/theme.dart';
import '../../../widgets/buttons/buttons.dart';
import '../../../widgets/skeleton.dart';
import '../../../widgets/textfields/label_text_field.dart';
import '../payment_method_viewmodel.dart';

@RoutePage()
class PmSticPayView extends StackedView<PaymentMethodViewModel> {
  const PmSticPayView({super.key});

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
                  SizedBox(
                    height: 15,
                    width: 15,
                    child: SvgPicture.asset(
                      "assets/images/arrow_left.svg",
                      width: 15,
                      height: 15,
                      colorFilter: ColorFilter.mode(
                        isDarkMode
                            ? const Color(0xff98A2B3)
                            : const Color(0xFF667085),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  horizontalSpaceMedium(context),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "SticPay",
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 2.1),
                            fontWeight: FontWeight.bold,
                            color: isDarkMode
                                ? const Color(0xFFD0D5DD)
                                : const Color(0xFF344054),
                          ),
                        ),
                        Text(
                          "Enter SticPay account details",
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.6),
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
                        label: "Email Address",
                        hintText: "Enter Email address",
                      ),
                      const LabelTextField(
                        label: "Pay ID",
                        hintText: "Enter Pay ID",
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
                onTap: () {},
                text: 'Save',
              ),
            ),
            verticalSpaceSmall(context),
            verticalSpaceXSmall(context),
          ],
        ),
      ),
    );
  }

  @override
  PaymentMethodViewModel viewModelBuilder(BuildContext context) =>
      PaymentMethodViewModel();
}
