import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/ui/views/fund_account/fund_account_view_model.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

import '../../../app/responsiveness/res.dart';

@RoutePage(name: "FundAccountRoute")
class FundAccountView extends StackedView<FundAccountViewModel> {
  const FundAccountView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    FundAccountViewModel viewModel,
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
  FundAccountViewModel viewModelBuilder(BuildContext context) =>
      FundAccountViewModel();
}
