import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import '../../../app/utils/theme.dart';
import 'security_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/skeleton.dart';

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
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
      isBusy: viewModel.isBusy,
      backgroundColor:
          isDarkMode ? const Color(0xFF0C2031) : const Color(0xFFFAFDFF),
      bodyPadding: EdgeInsets.zero,
      body: SafeArea(
        child: Column(
          children: [
            viewModel.returnAppBar(context),
            viewModel.returnPage(),
          ],
        ),
      ),
    );
  }

  @override
  SecurityViewModel viewModelBuilder(BuildContext context) =>
      SecurityViewModel();
}
