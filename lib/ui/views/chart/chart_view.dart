import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/utils/theme.dart';
import '../../widgets/skeleton.dart';
import 'chart_view_model.dart';

@RoutePage()
class ChartView extends StackedView<ChartViewModel> {
  const ChartView({super.key, this.showBackButton = false, this.onPressed});
  final bool? showBackButton;
  final void Function()? onPressed;

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    ChartViewModel viewModel,
    Widget? child,
  ) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
      isBusy: viewModel.isBusy,
      backgroundColor:
          isDarkMode ? const Color(0xFF0C2031) : const Color(0xFFFAFDFF),
      bodyPadding: EdgeInsets.zero,
      appBar:
          viewModel.returnAppBar(context, showBackButton ?? false, onPressed),
      body: viewModel.returnPage(),
    );
  }

  @override
  ChartViewModel viewModelBuilder(BuildContext context) => ChartViewModel();
}
