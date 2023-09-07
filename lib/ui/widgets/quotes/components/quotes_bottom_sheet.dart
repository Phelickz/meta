import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/quotes/quotes_view_model.dart';
import 'package:meta_trader/ui/views/quotes/trade_close_screen.dart';
import 'package:meta_trader/ui/views/quotes/trade_depth_screen.dart';
import 'package:meta_trader/ui/views/quotes/trade_details_screen.dart';
import 'package:meta_trader/ui/views/quotes/trade_excuetion_screen1.dart';
import 'package:meta_trader/ui/views/quotes/trade_statistics_screen.dart';

import '../../../../app/responsiveness/size.dart';
import '../../buttons/buttons.dart';

class QuotesBottomSheet extends StatelessWidget {
  final QuotesViewModel model;
  const QuotesBottomSheet({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return SingleChildScrollView(
      child: Container(
        height: McGyver.rsDoubleH(context, 40),
        padding: EdgeInsets.symmetric(
          horizontal: McGyver.rsDoubleH(context, 2),
          vertical: McGyver.rsDoubleH(context, 4),
        ),
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF0C2031) : const Color(0xFFFAFDFF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(McGyver.rsDoubleH(context, 2)),
            topRight: Radius.circular(McGyver.rsDoubleH(context, 2)),
          ),
        ),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Text(
              "EURUSDs: Euro vs US Dollar",
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.9),
                fontWeight: FontWeight.bold,
                color: const Color(0xFF98A2B3),
              ),
            ),
            verticalSpaceSmall(context),
            QuotesBottomSheetTile(
                label: "Trade",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return TradeExecuetionScreen();
                  }));
                }),
            QuotesBottomSheetTile(
                label: "Chart",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return TradeCloseScreen();
                  }));
                }),
            QuotesBottomSheetTile(
                label: "Details",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return TradeDetailsScreen();
                  }));
                }),
            QuotesBottomSheetTile(
                label: "Statistics",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return TradeStatisticsScreen();
                  }));
                }),
            QuotesBottomSheetTile(
                label: "Depth of market",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return TradeDepthScreen();
                  }));
                }),
            QuotesBottomSheetTile(
                label: "Delete", isRed: true, onPressed: () {}),
            verticalSpaceSmall(context),
            CustomButtons.generalButton(
              context: context,
              onTap: () {
                Navigator.pop(context);
              },
              text: "Cancel",
              color: isDarkMode
                  ? const Color(0xFF052844)
                  : const Color(0xFFD3ECFD),
              textColor: isDarkMode
                  ? const Color(0xFFD0D5DD)
                  : const Color(0xFF667085),
            ),
          ],
        )),
      ),
    );
  }
}

class QuotesBottomSheetTile extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final bool isRed;
  const QuotesBottomSheetTile(
      {Key? key,
      required this.label,
      required this.onPressed,
      this.isRed = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Text(label,
          style: CustomThemeData.generateColoredStyle(
              fontSize: 16,
              context: context,
              darkTextColor:
                  isRed ? const Color(0xffF97066) : const Color(0xffD0D5DD),
              fontWeight: FontWeight.bold,
              lightTextColor:
                  isRed ? const Color(0xffF97066) : const Color(0xff667085))),
    );
  }
}
