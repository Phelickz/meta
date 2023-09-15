import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/ui/views/internal_transfer/internal_transfer_view_model.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

import '../../../app/responsiveness/res.dart';

@RoutePage()
class InternalTransferView extends StackedView<InternalTransferViewModel> {
  const InternalTransferView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    InternalTransferViewModel viewModel,
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
  InternalTransferViewModel viewModelBuilder(BuildContext context) =>
      InternalTransferViewModel();
}
