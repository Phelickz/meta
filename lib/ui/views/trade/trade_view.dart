import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/ui/views/trade/trade_view_model.dart';
import 'package:stacked/stacked.dart';
import '../../../app/utils/theme.dart';
import '../../widgets/skeleton.dart';

@RoutePage()
class TradeView extends StackedView<TradeViewModel> {
  const TradeView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    TradeViewModel viewModel,
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
  TradeViewModel viewModelBuilder(BuildContext context) => TradeViewModel();
}
