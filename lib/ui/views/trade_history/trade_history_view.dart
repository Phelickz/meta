import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/utils/theme.dart';
import '../../widgets/skeleton.dart';
import 'trade_history_view_model.dart';

@RoutePage()
class TradeHistoryView extends StackedView<TradeHistoryViewModel> {
  const TradeHistoryView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    TradeHistoryViewModel viewModel,
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
  TradeHistoryViewModel viewModelBuilder(BuildContext context) =>
      TradeHistoryViewModel();
}
