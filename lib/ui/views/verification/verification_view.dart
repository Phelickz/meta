import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/ui/views/verification/verification_view_model.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

import '../../../app/responsiveness/res.dart';

@RoutePage(name: "VerificationView")
class VerificationView extends StackedView<VerificationViewModel> {
  const VerificationView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    VerificationViewModel viewModel,
    Widget? child,
  ) {
    return Skeleton(
      isBusy: viewModel.isBusy,
      bodyPadding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 0),
      ),
      appBar: viewModel.returnAppBar(context),
      body: viewModel.returnPage(),
    );
  }

  @override
  VerificationViewModel viewModelBuilder(BuildContext context) =>
      VerificationViewModel();
}
