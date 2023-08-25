import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/responsiveness/size.dart';
import '../../../../app/utils/theme.dart';
import '../../../widgets/buttons/buttons.dart';
import '../../../widgets/payment_method/add_payment_method_tile.dart';
import '../../../widgets/payment_method/custom_back_button.dart';
import '../../../widgets/skeleton.dart';
import '../payment_method_viewmodel.dart';
import '../pm_main/pm_main_view.dart';

@RoutePage()
class PmAddView extends StackedView<PaymentMethodViewModel> {
  const PmAddView({super.key});

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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                        "Payment Method",
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 2.2),
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? const Color(0xFFD0D5DD)
                              : const Color(0xFF344054),
                        ),
                      ),
                      Text(
                        "Select payment method",
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
                SizedBox(
                  height: 20,
                  width: 20,
                  child: SvgPicture.asset(
                    "assets/images/trash.svg",
                    width: 20,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                      isDarkMode
                          ? const Color(0xff98A2B3)
                          : const Color(0xFF667085),
                      BlendMode.srcIn,
                    ),
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
                    AddPaymentMethodTile(
                      vm: viewModel,
                      paymentMethodEnum: PaymentMethodEnum.onlineBank,
                    ),
                    AddPaymentMethodTile(
                      vm: viewModel,
                      paymentMethodEnum: PaymentMethodEnum.binancePay,
                    ),
                    AddPaymentMethodTile(
                      vm: viewModel,
                      paymentMethodEnum: PaymentMethodEnum.neteller,
                    ),
                    AddPaymentMethodTile(
                      vm: viewModel,
                      paymentMethodEnum: PaymentMethodEnum.perfectMoney,
                    ),
                    AddPaymentMethodTile(
                      vm: viewModel,
                      paymentMethodEnum: PaymentMethodEnum.skrill,
                    ),
                    AddPaymentMethodTile(
                      vm: viewModel,
                      paymentMethodEnum: PaymentMethodEnum.sticPay,
                    ),
                    AddPaymentMethodTile(
                      vm: viewModel,
                      paymentMethodEnum: PaymentMethodEnum.tether,
                    ),
                    verticalSpaceXSmall(context),
                    CustomButtons.generalButton(
                      context: context,
                      onTap: () {
                        viewModel.onTap(viewModel.selectedAddPaymentMethodEnum);
                      },
                      text: 'Continue',
                    ),
                    verticalSpaceSmall(context),
                    verticalSpaceXSmall(context),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  @override
  PaymentMethodViewModel viewModelBuilder(BuildContext context) =>
      PaymentMethodViewModel();
}