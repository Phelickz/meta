import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/ui/views/settings/settings_view_model.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

@RoutePage(name: "SettingsRoute")
class SettingsView extends StackedView<SettingsViewModel> {
  const SettingsView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    SettingsViewModel viewModel,
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
  SettingsViewModel viewModelBuilder(BuildContext context) =>
      SettingsViewModel();
}
