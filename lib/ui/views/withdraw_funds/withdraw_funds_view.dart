import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/ui/views/withdraw_funds/withdraw_funds_view_model.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

import '../../../app/responsiveness/res.dart';

@RoutePage()
class WithdrawFundView extends StackedView<WithdrawFundViewModel> {
  const WithdrawFundView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    WithdrawFundViewModel viewModel,
    Widget? child,
  ) {
    return Skeleton(
        isBusy: viewModel.isBusy,
        appBar: viewModel.returnAppbar(context),
        bodyPadding: EdgeInsets.symmetric(
          horizontal: McGyver.rsDoubleW(context, 0),
        ),
        body: viewModel.returnBody(context));
  }

  @override
  WithdrawFundViewModel viewModelBuilder(BuildContext context) =>
      WithdrawFundViewModel();
}
