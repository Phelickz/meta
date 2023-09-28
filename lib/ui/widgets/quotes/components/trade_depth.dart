import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/quotes/trade_utils.dart';

class TradeDepthGrid extends StatelessWidget {
  const TradeDepthGrid({super.key});

  @override
  Widget build(BuildContext context) {
    // var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 4),
      ),
      child: Column(
        children: [
          verticalSpaceSmall(context),
          Expanded(
            child: InteractiveViewer(
                constrained: false, child: _createDataTable()),
          ),
          // Expanded(
          //   child: _createDataTable(),
          // ),
          // const Spacer(),
          verticalSpaceSmall(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: genericButton(
                      () => null, LocaleKeys.sell, const Color(0xFFF04438))),
              SizedBox(width: 17.pWidth(context)),
              Expanded(
                  child: genericButton(
                      () => null, LocaleKeys.close, const Color(0xFF475467))),
              SizedBox(width: 17.pWidth(context)),
              Expanded(
                  child: genericButton(
                      () => null, LocaleKeys.buy, const Color(0xFF0C95EF))),
            ],
          ),
          verticalSpaceMedium(context),
        ],
      ),
    );
  }

  Widget _createDataTable() {
    return Builder(builder: (context) {
      var isDarkMode = CustomThemeData.isDarkMode(context);
      return DataTable(
          border: TableBorder(
            top: BorderSide(
                color: isDarkMode
                    ? const Color(0xFF344054)
                    : const Color(0xFF98A2B3),
                width: 0.5),
            bottom: BorderSide(
                color: isDarkMode
                    ? const Color(0xFF344054)
                    : const Color(0xFF98A2B3),
                width: 0.5),
            left: BorderSide(
                color: isDarkMode
                    ? const Color(0xFF344054)
                    : const Color(0xFF98A2B3),
                width: 0.5),
            right: BorderSide(
                color: isDarkMode
                    ? const Color(0xFF344054)
                    : const Color(0xFF98A2B3),
                width: 0.5),
            horizontalInside: BorderSide(
                color: isDarkMode
                    ? const Color(0xFF344054)
                    : const Color(0xFF98A2B3),
                width: 0.5),
            verticalInside: BorderSide(
                color: isDarkMode
                    ? const Color(0xFF344054)
                    : const Color(0xFF98A2B3),
                width: 0.5),
          ),
          headingRowHeight: 100.pHeight(context),
          dataRowMinHeight: 36.pHeight(context),
          columnSpacing: 0,
          horizontalMargin: 0,
          columns: _createColumns(context),
          rows: _createRows());
    });
  }

  List<DataColumn> _createColumns(BuildContext context) {
    return [
      DataColumn(
        label: Expanded(
          child: incrementContainer(
            () => null,
            () => null,
            const Text("Sl"),
            45.pHeight(context),
          ),
        ),
      ),
      DataColumn(
        label: Expanded(
          child: incrementContainer(
            () => null,
            () => null,
            const Text("1"),
            45.pHeight(context),
          ),
        ),
      ),
      DataColumn(
        label: Expanded(
          child: incrementContainer(
            () => null,
            () => null,
            const Text("tp"),
            45.pHeight(context),
          ),
        ),
      )
    ];
  }

  List<DataRow> _createRows() {
    return [
      DataRow(cells: [
        DataCell(containerIndicator("300,000.00", 0.6, true)),
        DataCell(containerIndicator("300,000.00", 0.6, true)),
        DataCell(incrementTp())
      ]),
      DataRow(cells: [
        DataCell(containerIndicator("20,000.00", 0.2, true)),
        DataCell(containerIndicator("300,000.00", 0.6, true)),
        DataCell(incrementTp())
      ]),
      DataRow(cells: [
        DataCell(containerIndicator("25,000,000.00", 0.9, true)),
        DataCell(containerIndicator("300,000.00", 0.6, true)),
        DataCell(incrementTp())
      ]),
      DataRow(cells: [
        DataCell(containerIndicator("500,000.00", 0.5, false)),
        DataCell(containerIndicator("800,000.00", 1, false)),
        DataCell(incrementTp())
      ]),
      DataRow(cells: [
        DataCell(containerIndicator("500,000.00", 0.5, false)),
        DataCell(containerIndicator("800,000.00", 1, false)),
        DataCell(incrementTp())
      ]),
      DataRow(cells: [
        DataCell(containerIndicator("500,000.00", 0.5, false)),
        DataCell(containerIndicator("800,000.00", 1, false)),
        DataCell(incrementTp())
      ]),
      DataRow(cells: [
        DataCell(containerIndicator("500,000.00", 0.5, false)),
        DataCell(containerIndicator("800,000.00", 1, false)),
        DataCell(incrementTp())
      ]),
      DataRow(cells: [
        DataCell(containerIndicator("300,000.00", 0.6, true)),
        DataCell(containerIndicator("300,000.00", 0.6, true)),
        DataCell(incrementTp())
      ]),
      DataRow(cells: [
        DataCell(containerIndicator("20,000.00", 0.2, true)),
        DataCell(containerIndicator("300,000.00", 0.6, true)),
        DataCell(incrementTp())
      ]),
      DataRow(cells: [
        DataCell(containerIndicator("20,000.00", 0.2, true)),
        DataCell(containerIndicator("300,000.00", 0.6, true)),
        DataCell(incrementTp())
      ]),
      DataRow(cells: [
        DataCell(containerIndicator("20,000.00", 0.2, true)),
        DataCell(containerIndicator("300,000.00", 0.6, true)),
        DataCell(incrementTp())
      ]),
      DataRow(cells: [
        DataCell(containerIndicator("20,000.00", 0.2, true)),
        DataCell(containerIndicator("300,000.00", 0.6, true)),
        DataCell(incrementTp())
      ]),
      DataRow(cells: [
        DataCell(containerIndicator("300,000.00", 0.6, true)),
        DataCell(containerIndicator("300,000.00", 0.6, true)),
        DataCell(incrementTp())
      ]),
      DataRow(cells: [
        DataCell(containerIndicator("500,000.00", 0.5, false)),
        DataCell(containerIndicator("800,000.00", 1, false)),
        DataCell(incrementTp())
      ]),
    ];
  }

  Widget containerIndicator(
      String text, double progressPercentage, bool isRed) {
    return Builder(
      builder: (context) {
        var isDarkMode = CustomThemeData.isDarkMode(context);
        return Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                // height: 4.pHeight(context),
                width: 100 * progressPercentage.pWidth(context),
                color: isRed
                    ? isDarkMode
                        ? const Color(0xFF9E165F).withOpacity(0.7)
                        : const Color(0xFF9E165F).withOpacity(0.4)
                    : const Color(0xFF0D99F4).withOpacity(0.4),
              ),
            ),
            Center(
              child: Text(
                text,
                style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.5),
                    color: isDarkMode ? Colors.white : const Color(0xFF475467),
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        );
      },
    );
  }

  Widget incrementTp() {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.keyboard_arrow_down,
              size: 24,
              color: Colors.red,
            )),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.keyboard_arrow_up,
            size: 24,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  Widget genericButton(Function() onTap, String title, Color color) {
    return Builder(builder: (context) {
      return InkWell(
        onTap: onTap,
        child: Container(
          height: 36.pHeight(context),
          // width: 154.dWidth(context),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              title,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.4),
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      );
    });
  }
}
