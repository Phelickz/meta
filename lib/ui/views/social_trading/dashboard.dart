import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

import '../../../app/responsiveness/res.dart';

@RoutePage()
class SocialTradingDasboard extends StackedView<SocialTradingViewModel> {
  const SocialTradingDasboard({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    SocialTradingViewModel viewModel,
    Widget? child,
  ) {
    // var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
      isBusy: viewModel.isBusy,
      bodyPadding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 0),
      ),
      appBar: viewModel.returnAppBar(context),
      body: viewModel.returnPage(context),
    );
  }

  @override
  SocialTradingViewModel viewModelBuilder(BuildContext context) =>
      SocialTradingViewModel();
}
