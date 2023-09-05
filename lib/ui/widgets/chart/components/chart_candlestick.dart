import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../views/chart/chart_view_model.dart';

class ChartCandleStick extends StatefulWidget {
  final List<CandleData> data;
  const ChartCandleStick({super.key, required this.data});

  @override
  State<ChartCandleStick> createState() => _ChartCandleStickState();
}

class _ChartCandleStickState extends State<ChartCandleStick> {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      backgroundColor: Colors.transparent,
      primaryXAxis: CategoryAxis(),
      series: <ChartSeries>[
        CandleSeries<CandleData, String>(
          dataSource: widget.data,
          xValueMapper: (CandleData data, _) => data.date,
          lowValueMapper: (CandleData data, _) => data.low,
          highValueMapper: (CandleData data, _) => data.high,
          openValueMapper: (CandleData data, _) => data.open,
          closeValueMapper: (CandleData data, _) => data.close,
          bearColor: Colors.red,
          bullColor: Colors.blue,
        ),
        // LineSeries<CandleData, String>(
        //   dataSource: widget.data,
        //   xValueMapper: (CandleData data, _) => data.date,
        //   yValueMapper: (CandleData data, _) => data.open,
        //   // Customize the line color
        //   color: Colors.blue,
        // ),
      ],
      selectionType: SelectionType.cluster,
      selectionGesture: ActivationMode.singleTap,
      zoomPanBehavior: ZoomPanBehavior(
        enablePanning: true,
        enablePinching: true,
        zoomMode: ZoomMode.x,
        selectionRectBorderColor: Colors.blue,
        selectionRectColor: Colors.blue.withOpacity(0.1),
        selectionRectBorderWidth: 1.0,
        enableSelectionZooming: true,
      ),
    );
  }
}
