import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

import 'help_and_support_view_model.dart';

@RoutePage()
class HelpAndSupportView extends StackedView<HelpAndSupportViewModel> {
  const HelpAndSupportView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    HelpAndSupportViewModel viewModel,
    Widget? child,
  ) {
    return Skeleton(
      isBusy: viewModel.isBusy,
      bodyPadding: EdgeInsets.zero,
      appBar: viewModel.returnAppBar(context),
      body: viewModel.returnPage(),
    );
  }

  @override
  HelpAndSupportViewModel viewModelBuilder(BuildContext context) =>
      HelpAndSupportViewModel();
}
