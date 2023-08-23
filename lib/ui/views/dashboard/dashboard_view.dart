import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

import '../../../app/responsiveness/res.dart';
import 'dashboard_view_model.dart';

@RoutePage(name: "DashboardView")
class DashboardView extends StackedView<DashboardViewModel> {
  const DashboardView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    DashboardViewModel viewModel,
    Widget? child,
  ) {
    return Skeleton(
        isBusy: viewModel.isBusy,
        bodyPadding: EdgeInsets.symmetric(
          horizontal: McGyver.rsDoubleW(context, 0),
        ),
        body: const Center(
          child: Text('Dashboard'),
        ));
  }

  @override
  DashboardViewModel viewModelBuilder(BuildContext context) =>
      DashboardViewModel();
}
