import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/ui/views/referral/referral_view_model.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

@RoutePage(name: "ReferralRoute")
class ReferralView extends StackedView<ReferralViewModel> {
  const ReferralView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    ReferralViewModel viewModel,
    Widget? child,
  ) {
    return Skeleton(
      isBusy: viewModel.isBusy,
      bodyPadding: EdgeInsets.zero,
      body: viewModel.returnPage(),
      appBar: viewModel.returnAppBar(context),
    );
  }

  @override
  ReferralViewModel viewModelBuilder(BuildContext context) =>
      ReferralViewModel();
}
