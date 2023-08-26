import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/utils/theme.dart';
import '../../widgets/skeleton.dart';
import 'payment_method_viewmodel.dart';

@RoutePage()
class PaymentMethodView extends StackedView<PaymentMethodViewModel> {
  const PaymentMethodView({super.key});

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
      appBar: viewModel.returnAppBar(context), // isn't the appbar better here?
      body: SafeArea(
        child: Column(
          children: [
            //  viewModel.returnAppBar(context), // is there a reason you are not using the skeleton's app bar ?
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
