import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

import 'notifications_view_model.dart';

@RoutePage(name: "NotificationRoute")
class NotificationView extends StackedView<NotificationViewModel> {
  const NotificationView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    NotificationViewModel viewModel,
    Widget? child,
  ) {
    return Skeleton(
      isBusy: viewModel.isBusy,
      bodyPadding: EdgeInsets.zero,
      appBar: viewModel.returnAppBar(context),
      body: SafeArea(
        child: viewModel.returnPage(),
      ),
    );
  }

  @override
  NotificationViewModel viewModelBuilder(BuildContext context) =>
      NotificationViewModel();
}
