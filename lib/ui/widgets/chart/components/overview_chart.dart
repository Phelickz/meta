import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/chart/chart_view_model.dart';

class OverviewChart extends StatelessWidget {
  final List<ForexData> data;
  const OverviewChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: SizedBox(
        width: double.infinity,
        height: McGyver.rsDoubleH(context, 24),
        child: LineChart(createLineChartData(context)),
      ),
    );
  }

  LineChartData createLineChartData(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return LineChartData(
      backgroundColor: isDarkMode
          ? const Color(0xff052844)
          : const Color(0xffD3ECFD).withOpacity(0.3),
      gridData: const FlGridData(show: false),
      titlesData: const FlTitlesData(
        bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      lineTouchData: LineTouchData(
          enabled: true,
          touchCallback:
              (FlTouchEvent event, LineTouchResponse? touchResponse) {
            // TODO : Utilize touch event here to perform any operation
          },
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.transparent,
            tooltipRoundedRadius: 20.0,
            fitInsideHorizontally: true,
            tooltipMargin: 16,
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map(
                (LineBarSpot touchedSpot) {
                  return LineTooltipItem(
                    LocaleKeys.max.tr(),
                    const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff98A2B3),
                    ),
                    children: [
                      TextSpan(
                          text:
                              " ${data[touchedSpot.spotIndex].price.toString()} ",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: isDarkMode
                                ? Colors.white
                                : const Color(0xff98A2B3),
                          )),
                      TextSpan(
                        text: DateFormat.Hm()
                            .format(data[touchedSpot.spotIndex].time),
                      ),
                    ],
                  );
                },
              ).toList();
            },
          ),
          getTouchedSpotIndicator:
              (LineChartBarData barData, List<int> indicators) {
            return indicators.map(
              (int index) {
                const line = FlLine(
                    color: Colors.grey, strokeWidth: 1, dashArray: [2, 4]);
                return const TouchedSpotIndicatorData(
                  line,
                  FlDotData(show: false),
                );
              },
            ).toList();
          },
          getTouchLineEnd: (_, __) => double.infinity),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff475467), width: 0.4),
      ),
      minX: 0,
      maxX: data.length.toDouble() - 1,
      minY: data
              .map((e) => e.price)
              .reduce((min, price) => price < min ? price : min) -
          5,
      maxY: data
              .map((e) => e.price)
              .reduce((max, price) => price > max ? price : max) +
          5,
      lineBarsData: [
        LineChartBarData(
          spots: data
              .asMap()
              .entries
              .map((entry) => FlSpot(entry.key.toDouble(), entry.value.price))
              .toList(),
          isCurved: false,
          color: const Color(0xFF47B0F5),
          dotData: FlDotData(
            show: true,
            getDotPainter: (FlSpot spot, double percent,
                LineChartBarData barData, int index) {
              return FlDotCirclePainter(
                radius: 7,
                color: const Color(0xFF47B0F5),
                strokeWidth: 2,
                strokeColor: Colors.white,
              );
            },
          ),
          belowBarData: BarAreaData(show: false),
        ),
      ],
    );
  }
}
