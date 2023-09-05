import 'package:flutter/material.dart';
import 'package:meta_trader/ui/views/chart/chart_view_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartLineChart extends StatelessWidget {
  final List<CandleData> data;
  const ChartLineChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      series: <ChartSeries>[
        LineSeries<CandleData, String>(
          dataSource: data,
          xValueMapper: (CandleData data, _) => data.date,
          yValueMapper: (CandleData data, _) => data.close,
          // Customize the line color
          color: Colors.blue,
        ),
      ],
    );
  }
}
