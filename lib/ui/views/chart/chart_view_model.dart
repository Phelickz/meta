import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meta_trader/ui/widgets/chart/chart.dart';
import 'package:meta_trader/ui/widgets/chart/components/app_bar.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';

class ForexData {
  final DateTime time;
  final double price;

  ForexData(this.time, this.price);
}

class ChartViewModel extends CustomBaseViewModel {
  ChartViewModel() {
    init();
    hourOverviewData = generateMockData(8, interval: const Duration(hours: 1));
    todayOverviewData = generateMockData(7, interval: const Duration(days: 1));
    weekOverviewData = generateMockData(7, interval: const Duration(days: 7));
    monthOverviewData = generateMockData(4, interval: const Duration(days: 30));
    yearOverviewData =
        generateMockData(12, interval: const Duration(days: 365));
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

  List<ForexData> hourOverviewData = [];
  List<ForexData> todayOverviewData = [];
  List<ForexData> weekOverviewData = [];
  List<ForexData> monthOverviewData = [];
  List<ForexData> yearOverviewData = [];

  List<ForexData> generateMockData(int count,
      {Duration interval = const Duration(days: 1)}) {
    final List<ForexData> data = [];
    final DateTime now = DateTime.now();

    for (int i = 0; i < count; i++) {
      final DateTime time = now.subtract(interval * i);
      double price = (i + 1) * Random().nextDouble() * 10;
      price = price.roundToDouble();
      data.add(ForexData(time, price));
    }

    return data.reversed.toList();
  }
}
