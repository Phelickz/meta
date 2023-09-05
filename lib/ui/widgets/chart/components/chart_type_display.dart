import 'package:flutter/material.dart';
import 'package:meta_trader/ui/widgets/chart/components/chart_candlestick.dart';
import 'package:meta_trader/ui/widgets/chart/components/chart_line_chart.dart';

import '../../../views/chart/chart_view_model.dart';

class ChartTypeDisplay extends StatelessWidget {
  final ChartViewModel viewModel;
  const ChartTypeDisplay({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return viewModel.isCandle
        ? ChartCandleStick(
            data: viewModel.getCandleData(),
          )
        : ChartLineChart(
            data: viewModel.getCandleData(),
          );
  }
}
