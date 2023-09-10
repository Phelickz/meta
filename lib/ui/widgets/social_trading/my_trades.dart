import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/social_trading/components/copied_trader_tile.dart';

class MyTrades extends StatelessWidget {
  const MyTrades({super.key, required this.model});
  final SocialTradingViewModel model;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceSmall(context),
          Text(
            "Copied Traders",
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.9),
              fontWeight: FontWeight.bold,
              color: isDarkMode
                  ? const Color(0xff98A2B3)
                  : const Color(0xFF475467),
            ),
          ),
          verticalSpaceSmall(context),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (_, index) {
                return CopiedTraderTile(
                  viewModel: model,
                  onTap: () {
                    model.setSocialTradingPageEnum =
                        SocialTradingPageEnum.copiedTraderPosition;
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  // ignore: unused_element
  Widget _emptyWidget(BuildContext context, SocialTradingViewModel viewModel) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          verticalSpaceLarge(context),
          Container(
            height: McGyver.rsDoubleH(context, 10),
            width: McGyver.rsDoubleH(context, 10),
            padding: EdgeInsets.all(
              McGyver.rsDoubleH(context, 1.5),
            ),
            decoration: BoxDecoration(
                color: isDarkMode
                    ? const Color(0xFF052844)
                    : const Color(0xFFD3ECFD),
                borderRadius: BorderRadius.circular(
                  McGyver.rsDoubleH(context, 2),
                )),
            child: SizedBox(
              height: McGyver.rsDoubleH(context, 8),
              width: McGyver.rsDoubleH(context, 8),
              child: SvgPicture.asset("assets/icons/document_copy.svg.svg"),
            ),
          ),
          verticalSpaceSmall(context),
          Text(
            "You Are Not Copying Any Master Trader  Yet",
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.8),
              fontWeight: FontWeight.bold,
              color: isDarkMode
                  ? const Color(0xFFD0D5DD)
                  : const Color(0xFF98A2B3),
            ),
          ),
          SizedBox(
            height: McGyver.rsDoubleH(context, 48),
          ),
          CustomButtons.generalButton(
            context: context,
            onTap: () {
              viewModel.setSocialTradingPageEnum =
                  SocialTradingPageEnum.subscriptionSetup;
            },
            text: 'Start Copying',
          ),
        ],
      ),
    );
  }
}
