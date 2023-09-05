import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../views/chart/chart_view_model.dart';

class ChartDisplay extends StatelessWidget {
  final ChartViewModel viewModel;
  const ChartDisplay({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return SfCartesianChart(
      backgroundColor: Colors.transparent,
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(
          width: 0.5, // Adjust the line width as needed
          color: Colors.grey, // Adjust the line color as needed
          dashArray: <double>[3, 2], // Set dash pattern for dotted lines
        ),
        minorGridLines: const MinorGridLines(
          width: 0.5,
          color: Colors.grey,
          dashArray: <double>[3, 2],
        ),
        axisLine: AxisLine(
          width: 2,
          color: isDarkMode ? const Color(0xFF475467) : const Color(0xFF667085),
        ),
      ),
      primaryYAxis: NumericAxis(
        majorGridLines: const MajorGridLines(
          width: 0.5,
          color: Colors.grey,
          dashArray: <double>[3, 2],
        ),
        minorGridLines: const MinorGridLines(
          width: 0.5,
          color: Colors.grey,
          dashArray: <double>[3, 2],
        ),
        axisLine: AxisLine(
          width: 2,
          color: isDarkMode ? const Color(0xFF475467) : const Color(0xFF667085),
        ),
      ),
      series: <ChartSeries>[
        viewModel.isCandle
            ? CandleSeries<CandleData, String>(
                dataSource: viewModel.getCandleData(),
                xValueMapper: (CandleData data, _) => data.date,
                lowValueMapper: (CandleData data, _) => data.low,
                highValueMapper: (CandleData data, _) => data.high,
                openValueMapper: (CandleData data, _) => data.open,
                closeValueMapper: (CandleData data, _) => data.close,
                bearColor: Colors.red,
                bullColor: Colors.blue,
              )
            : LineSeries<CandleData, String>(
                dataSource: viewModel.getCandleData(),
                xValueMapper: (CandleData data, _) => data.date,
                yValueMapper: (CandleData data, _) => data.close,
                // Customize the line color
                color: Colors.blue,
              ),
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
