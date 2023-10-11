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

  AppBar? returnAppBar(
      BuildContext context, bool showBackButton, void Function()? onPressed) {
    return chartAppBar(context, "USDJPY", "", this,
        showBackButton: showBackButton, build: onPressed);
  }

  final tabSelectedNotifier = ValueNotifier(0);
  final overviewTabSelectedNotifier = ValueNotifier(0);
  final chartTabSelectedNotifier = ValueNotifier(0);

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

  bool isCandle = false;

  bool isFav = false;
  void toggleFav() {
    isFav = !isFav;
    notifyListeners();
  }

  void toggleCandleView() {
    isCandle = !isCandle;
    notifyListeners();
  }

  List<CandleData> getCandleData() {
    //TODO: work on the localization for charts
    return [
      CandleData('3 Sept 20:14', 50000, 70000, 60000, 55000),
      CandleData('3 Sept 20:24', 60000, 80000, 70000, 65000),
      CandleData('3 Sept 21:37', 60000, 80000, 70000, 65000),
      CandleData('3 Sept 21:50', 70000, 90000, 85000, 70000),
      CandleData('3 Sept 21:58', 70000, 80000, 65000, 40000),
      CandleData('3 Sept 00:34', 70000, 90000, 75000, 60000),
      CandleData('3 Sept 00:38', 80000, 90000, 80000, 60000),
      CandleData('3 Sept 00:39', 40000, 60000, 50000, 45000),
      CandleData('3 Sept 01:00', 40000, 60000, 50000, 45000),
      // Add more data points as needed
    ];
  }
}

class CandleData {
  final String date;
  final double low;
  final double high;
  final double open;
  final double close;

  CandleData(this.date, this.low, this.high, this.open, this.close);
}
