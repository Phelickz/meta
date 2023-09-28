import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/provider/provider_view_model.dart';
import 'package:meta_trader/ui/widgets/provider/components/custom_provider_tab.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PGraph extends StatelessWidget {
  final ProviderViewModel viewModel;
  const PGraph({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 239.pHeight(context),
      width: 327.pWidth(context),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: viewModel.isDarkMode()
            ? ColorManager.darkHeaderColor
            : const Color(0xFFECF7FE),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                LocaleKeys
                    .providerWidget_providerComponent_pGraph_myPerformance,
                style: CustomThemeData.generateColoredStyle(
                    fontSize: 16,
                    context: context,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              CustomProviderTab(
                  firstTabName: "1W",
                  secondTabName: "2W",
                  thirdTabName: "1M",
                  fourthTabName: "3M",
                  fifthTabName: "6M",
                  tabIndex: viewModel.performanceTabSelectorNotifier.value,
                  onSelectTab: (val) {
                    viewModel.performanceTabSelectorNotifier.value = val;
                  })
            ],
          ),
          Expanded(
              child: ValueListenableBuilder<int>(
            valueListenable: viewModel.performanceTabSelectorNotifier,
            builder: (context, index, child) {
              return SizedBox(
                height: McGyver.rsDoubleH(context, 58),
                child: IndexedStack(
                  index: index,
                  children: [
                    chartDisplay(context),
                    chartDisplay(context),
                    chartDisplay(context),
                    chartDisplay(context),
                    chartDisplay(context),
                  ],
                ),
              );
            },
          ))
        ],
      ),
    );
  }

  Widget chartDisplay(BuildContext context) {
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
        LineSeries<CandleData, String>(
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
