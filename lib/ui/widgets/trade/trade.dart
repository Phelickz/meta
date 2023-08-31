import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/trade/trade_view_model.dart';
import '../../../app/responsiveness/size.dart';
import 'components/position_modal.dart';
import 'components/trade_header_details.dart';
import 'components/trade_tile.dart';

class TradePage extends StatelessWidget {
  final TradeViewModel viewModel;
  const TradePage({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      children: [
        TradeHeaderDetails(
          viewModel: viewModel,
        ),
        verticalSpaceSmall(context),
        verticalSpaceXSmall(context),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: McGyver.rsDoubleW(context, 6),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Positions",
                style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? const Color(0xFF98A2B3)
                        : const Color(0xFF667085)),
              ),
              GestureDetector(
                onTap: () {
                  showPositionModal(context);
                },
                child: SvgPicture.asset(
                  "assets/images/more.svg",
                  colorFilter: ColorFilter.mode(
                    isDarkMode
                        ? const Color(0xff98A2B3)
                        : const Color(0xFF667085),
                    BlendMode.srcIn,
                  ),
                ),
              )
            ],
          ),
        ),
        verticalSpaceXSmall(context),
        if (!viewModel.isEmpty)
          Expanded(
            child: ListView(
              children: [
                TradeTile(
                  tradeType: TradeType.buy,
                  viewModel: viewModel,
                ),
                TradeTile(
                  tradeType: TradeType.sell,
                  viewModel: viewModel,
                ),
              ],
            ),
          ),
      ],
    );
  }

  void showPositionModal(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    showModalBottomSheet(
        backgroundColor:
            isDarkMode ? const Color(0xFF0C2031) : const Color(0xFFFAFDFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(McGyver.rsDoubleH(context, 2)),
            topRight: Radius.circular(McGyver.rsDoubleH(context, 2)),
          ),
        ),
        context: context,
        isDismissible: true,
        enableDrag: true,
        isScrollControlled: true,
        builder: (context) {
          return const PositionModal();
        });
  }
}
