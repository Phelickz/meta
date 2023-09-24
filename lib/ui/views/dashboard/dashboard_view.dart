import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

import '../../../app/responsiveness/res.dart';
import '../../../generated/locale_keys.g.dart';
import 'dashboard_view_model.dart';

@RoutePage()
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
        body: Center(
          child: Text(LocaleKeys.views_dashboard_dashboard.tr()),
        ));
  }

  @override
  DashboardViewModel viewModelBuilder(BuildContext context) =>
      DashboardViewModel();
}
