import 'package:flutter/material.dart';
import 'package:meta_trader/ui/widgets/chart/chart.dart';
import 'package:meta_trader/ui/widgets/chart/components/app_bar.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';

class ChartViewModel extends CustomBaseViewModel {
  ChartViewModel() {
    init();
  }

  Future<void> init() async {}

  Widget returnPage() {
    return ChartPage(viewModel: this);
  }

  AppBar? returnAppBar(BuildContext context) {
    return chartAppBar(
      context,
      "USDJPY",
      "",
      this,
    );
  }

  final tabSelectedNotifier = ValueNotifier(0);
  final overviewTabSelectedNotifier = ValueNotifier(0);

  final specificationStatus = ValueNotifier(true);
}
