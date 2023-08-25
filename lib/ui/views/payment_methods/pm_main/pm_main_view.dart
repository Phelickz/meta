import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/ui/widgets/payment_method/app_bar.dart';
import 'package:meta_trader/ui/widgets/payment_method/empty_payment_method.dart';
import 'package:meta_trader/ui/widgets/payment_method/payment_method_tile.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/utils/theme.dart';
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
  home,
  add,
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
        appBar: paymentMethodAppBar(context, viewModel),
        body: viewModel.returnPage(context));
  }

  @override
  PaymentMethodViewModel viewModelBuilder(BuildContext context) =>
      PaymentMethodViewModel();
}

class PaymentMethodHome extends StatelessWidget {
  const PaymentMethodHome({super.key, required this.viewModel});
  final PaymentMethodViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        viewModel.hasEmptyPaymentMethod
            ? EmptyPaymentMethod(
                viewModel: viewModel,
              )
            : Expanded(
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
                        verticalSpaceSmall(context),
                        PaymentMethodTile(
                          vm: viewModel,
                          paymentMethodEnum: PaymentMethodEnum.onlineBank,
                        ),
                        verticalSpaceXSmall(context),
                        PaymentMethodTile(
                          vm: viewModel,
                          paymentMethodEnum: PaymentMethodEnum.binancePay,
                        ),
                        verticalSpaceXSmall(context),
                        PaymentMethodTile(
                          vm: viewModel,
                          paymentMethodEnum: PaymentMethodEnum.neteller,
                        ),
                        verticalSpaceXSmall(context),
                        PaymentMethodTile(
                          vm: viewModel,
                          paymentMethodEnum: PaymentMethodEnum.perfectMoney,
                        ),
                        verticalSpaceXSmall(context),
                        PaymentMethodTile(
                          vm: viewModel,
                          paymentMethodEnum: PaymentMethodEnum.skrill,
                        ),
                        verticalSpaceXSmall(context),
                        PaymentMethodTile(
                          vm: viewModel,
                          paymentMethodEnum: PaymentMethodEnum.sticPay,
                        ),
                        verticalSpaceXSmall(context),
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
    );
  }
}
