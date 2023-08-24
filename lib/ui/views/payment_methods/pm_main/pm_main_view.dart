import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/ui/widgets/payment_method/payment_method_tile.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/utils/theme.dart';
import '../../../widgets/payment_method/custom_back_button.dart';
import '../../../widgets/skeleton.dart';
import '../payment_method_viewmodel.dart';

enum PaymentMethodEnum {
  onlineBank,
  binancePay,
  neteller,
  bitcoin,
  perfectMoney,
  skrill,
  sticPay,
  tether,
  none,
}

@RoutePage()
class PmMainView extends StackedView<PaymentMethodViewModel> {
  const PmMainView({super.key});

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
                    child: Text(
                      "Payment Methods",
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 2.2),
                        fontWeight: FontWeight.bold,
                        color: isDarkMode
                            ? const Color(0xFFD0D5DD)
                            : const Color(0xFF344054),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      viewModel.push(const PmAddRoute());
                    },
                    child: SizedBox(
                      height: McGyver.rsDoubleH(context, 2.8),
                      width: McGyver.rsDoubleH(context, 2.8),
                      child: SvgPicture.asset(
                        "assets/images/add_square.svg",
                        colorFilter: ColorFilter.mode(
                          isDarkMode
                              ? const Color(0xff98A2B3)
                              : const Color(0xFF667085),
                          BlendMode.srcIn,
                        ),
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
                      Text(
                        "Manage your cash payment methods",
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 1.5),
                          fontWeight: FontWeight.w500,
                          color: isDarkMode
                              ? const Color(0xFF98A2B3)
                              : const Color(0xFF475467),
                        ),
                      ),
                      PaymentMethodTile(
                        vm: viewModel,
                        paymentMethodEnum: PaymentMethodEnum.onlineBank,
                      ),
                      PaymentMethodTile(
                        vm: viewModel,
                        paymentMethodEnum: PaymentMethodEnum.binancePay,
                      ),
                      PaymentMethodTile(
                        vm: viewModel,
                        paymentMethodEnum: PaymentMethodEnum.neteller,
                      ),
                      PaymentMethodTile(
                        vm: viewModel,
                        paymentMethodEnum: PaymentMethodEnum.perfectMoney,
                      ),
                      PaymentMethodTile(
                        vm: viewModel,
                        paymentMethodEnum: PaymentMethodEnum.skrill,
                      ),
                      PaymentMethodTile(
                        vm: viewModel,
                        paymentMethodEnum: PaymentMethodEnum.sticPay,
                      ),
                      PaymentMethodTile(
                        vm: viewModel,
                        paymentMethodEnum: PaymentMethodEnum.tether,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  PaymentMethodViewModel viewModelBuilder(BuildContext context) =>
      PaymentMethodViewModel();
}
