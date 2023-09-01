import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/ui/views/quotes/quotes_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../../app/utils/theme.dart';
import '../../widgets/skeleton.dart';

@RoutePage()
class QuotesView extends StackedView<QuotesViewModel> {
  const QuotesView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    QuotesViewModel viewModel,
    Widget? child,
  ) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
      isBusy: viewModel.isBusy,
      backgroundColor:
          isDarkMode ? const Color(0xFF0C2031) : const Color(0xFFFAFDFF),
      bodyPadding: EdgeInsets.zero,
      appBar: viewModel.returnAppBar(context),
      body: viewModel.returnPage(),
    );
  }

  @override
  QuotesViewModel viewModelBuilder(BuildContext context) => QuotesViewModel();
}
