import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/price_sentiments/price_sentiments_view_model.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';
import 'package:meta_trader/ui/widgets/social_trading/components/custom_overview_summary_tab.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PriceSentimentDetails extends StatelessWidget {
  const PriceSentimentDetails({super.key, required this.model});
  final PriceSentimentViewModel model;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 5),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceSmall(context),
            Text(
              'Client Sentiment:',
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.8),
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : const Color(0xff475467),
              ),
            ),
            verticalSpaceSmall(context),
            _summaryActivity(context, model),
            // Container(
            //   width: double.infinity,
            //   height: McGyver.rsDoubleH(context, 15),
            //   decoration: BoxDecoration(
            //     color: isDarkMode ? const Color(0xff052844) : Colors.white,
            //     border: Border.all(
            //       width: 0.5,
            //       color: isDarkMode ? Colors.white : Colors.black38,
            //     ),
            //     borderRadius: BorderRadius.circular(14),
            //   ),
            // ),
            verticalSpaceSmall(context),
            verticalSpaceSmall(context),
            Text(
              'Trading Activity',
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.8),
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : const Color(0xff475467),
              ),
            ),
            verticalSpaceSmall(context),
            _summaryActivity(context, model),
            // Container(
            //   width: double.infinity,
            //   height: McGyver.rsDoubleH(context, 20),
            //   decoration: BoxDecoration(
            //     color: isDarkMode ? const Color(0xff052844) : Colors.white,
            //     border: Border.all(
            //       width: 0.5,
            //       color: isDarkMode ? Colors.white : Colors.black38,
            //     ),
            //     borderRadius: BorderRadius.circular(14),
            //   ),
            // ),
            verticalSpaceSmall(context),
            verticalSpaceSmall(context),
            Text(
              'Price Range',
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.8),
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : const Color(0xff475467),
              ),
            ),
            verticalSpaceSmall(context),
            _summaryActivity(context, model),
            // Container(
            //   width: double.infinity,
            //   height: McGyver.rsDoubleH(context, 25),
            //   decoration: BoxDecoration(
            //     color: isDarkMode ? const Color(0xff052844) : Colors.white,
            //     border: Border.all(
            //       width: 0.5,
            //       color: isDarkMode ? Colors.white : Colors.black38,
            //     ),
            //     borderRadius: BorderRadius.circular(14),
            //   ),
            // ),
            verticalSpaceSmall(context),
            verticalSpaceSmall(context),
            Text(
              'Price Volatility',
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.8),
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : const Color(0xff475467),
              ),
            ),
            verticalSpaceSmall(context),
            _summaryActivity(context, model),
            // Container(
            //   width: double.infinity,
            //   height: McGyver.rsDoubleH(context, 25),
            //   decoration: BoxDecoration(
            //     color: isDarkMode ? const Color(0xff052844) : Colors.white,
            //     border: Border.all(
            //       width: 0.5,
            //       color: isDarkMode ? Colors.white : Colors.black38,
            //     ),
            //     borderRadius: BorderRadius.circular(14),
            //   ),
            // ),
            verticalSpaceMedium(context),
          ],
        ),
      ),
    );
  }

  Widget _summaryActivity(
      BuildContext context, PriceSentimentViewModel viewModel) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      // height: 200,
      padding: EdgeInsets.symmetric(
        vertical: McGyver.rsDoubleH(context, 2),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 0),
      ),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF052844) : const Color(0xFFFAFDFF),
        borderRadius: BorderRadius.circular(McGyver.rsDoubleW(context, 4)),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: McGyver.rsDoubleW(context, 3.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Activity",
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 2),
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? const Color(0xFFFFFFFF)
                        : const Color(0xFF475467),
                  ),
                ),
                CustomOverviewSummaryTab(
                  firstTabName: "2W",
                  secondTabName: "1M",
                  thirdTabName: "3M",
                  fourthTabName: "6M",
                  tabIndex: viewModel.overviewSummaryTabSelectedNotifier.value,
                  onSelectTab: (val) {
                    viewModel.overviewSummaryTabSelectedNotifier.value = val;
                  },
                ),
              ],
            ),
          ),
          verticalSpaceXSmall(context),
          ValueListenableBuilder<int>(
            valueListenable: viewModel.overviewSummaryTabSelectedNotifier,
            builder: (context, index, child) {
              return SizedBox(
                height: McGyver.rsDoubleH(context, 30),
                child: IndexedStack(
                  index: index,
                  children: [
                    _summaryActivityComponent(context, viewModel),
                    _summaryActivityComponent(context, viewModel),
                    _summaryActivityComponent(context, viewModel),
                    _summaryActivityComponent(context, viewModel),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _summaryActivityComponent(
      BuildContext context, PriceSentimentViewModel viewModel) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        title: AxisTitle(
          text: 'Days',
          textStyle: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.5),
            fontWeight: FontWeight.bold,
            color:
                isDarkMode ? const Color(0xFFFFFFFF) : const Color(0xFF667085),
          ),
        ),
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
        labelStyle: CustomThemeData.generateStyle(
          fontSize: McGyver.textSize(context, 0.9),
          fontWeight: FontWeight.normal,
          color: isDarkMode ? const Color(0xFFFFFFFF) : const Color(0xFF667085),
        ),
      ),
      primaryYAxis: NumericAxis(
        labelStyle: CustomThemeData.generateStyle(
          fontSize: McGyver.textSize(context, 0.9),
          fontWeight: FontWeight.normal,
          color: isDarkMode ? const Color(0xFFFFFFFF) : const Color(0xFF667085),
        ),
        title: AxisTitle(
          text: 'price Movement',
          textStyle: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.5),
            fontWeight: FontWeight.bold,
            color:
                isDarkMode ? const Color(0xFFFFFFFF) : const Color(0xFF667085),
          ),
        ),
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
      series: <LineSeries<ActivityChartData, String>>[
        LineSeries<ActivityChartData, String>(
          dataSource: viewModel.activityChartData,
          xValueMapper: (ActivityChartData sales, _) => sales.day,
          yValueMapper: (ActivityChartData sales, _) => sales.price,
          name: 'Price',
        ),
      ],
    );
  }
}
