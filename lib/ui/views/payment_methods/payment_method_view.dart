import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/utils/theme.dart';
import '../../../widgets/payment_method/custom_back_button.dart';
import '../../../widgets/skeleton.dart';
import '../../widgets/skeleton.dart';
import '../payment_method_viewmodel.dart';
import 'payment_method_viewmodel.dart';

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
      backgroundColor:
          isDarkMode ? const Color(0xFF0C2031) : const Color(0xFFFAFDFF),
      bodyPadding: EdgeInsets.zero,
      body: SafeArea(
        child: Column(
          children: [
            viewModel.returnAppBar(context),
            viewModel.returnPage(),
          ],
        ),
      ),
    );
  }

  @override
  PaymentMethodViewModel viewModelBuilder(BuildContext context) =>
      PaymentMethodViewModel();
}
