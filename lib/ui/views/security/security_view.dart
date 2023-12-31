import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/utils/theme.dart';
import '../../widgets/skeleton.dart';
import 'security_view_model.dart';

@RoutePage()
class SecurityView extends StackedView<SecurityViewModel> {
  const SecurityView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    SecurityViewModel viewModel,
    Widget? child,
  ) {
    viewModel.updateValue();
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
      isBusy: viewModel.isBusy,
      backgroundColor:
          isDarkMode ? const Color(0xFF0C2031) : const Color(0xFFFAFDFF),
      appBar: viewModel.returnAppBar(context),
      body: viewModel.returnPage(),
    );
  }

  @override
  SecurityViewModel viewModelBuilder(BuildContext context) =>
      SecurityViewModel();
}
