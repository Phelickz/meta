import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';

class CancelSubModal extends StatelessWidget {
  final SocialTradingViewModel viewModel;
  const CancelSubModal({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      height: McGyver.rsDoubleH(context, 58),
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 6),
        vertical: McGyver.rsDoubleH(context, 4),
      ),
      child: Column(
        children: [
          Container(
            height: McGyver.rsDoubleH(context, 14),
            width: McGyver.rsDoubleH(context, 14),
            padding: EdgeInsets.all(
              McGyver.rsDoubleH(context, 2),
            ),
            decoration: BoxDecoration(
                color: isDarkMode
                    ? const Color(0xFF052844)
                    : const Color(0xFFD3ECFD),
                borderRadius: BorderRadius.circular(
                  McGyver.rsDoubleH(context, 3),
                )),
            child: SizedBox(
              height: McGyver.rsDoubleH(context, 9.5),
              width: McGyver.rsDoubleH(context, 9.5),
              child: SvgPicture.asset("assets/icons/clipboard-close_thin.svg"),
            ),
          ),
          verticalSpaceSmall(context),
          Text(
            "Cancel Copying?",
            textAlign: TextAlign.center,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 2.8),
              fontWeight: FontWeight.bold,
              color: isDarkMode
                  ? const Color(0xFFD0D5DD)
                  : const Color(0xFF475467),
            ),
          ),
          verticalSpaceXSmall(context),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: McGyver.rsDoubleW(context, 10),
            ),
            child: Text(
              "Once you cancel your subscription, your open trades with the master trader will be terminated automatically",
              textAlign: TextAlign.center,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.6),
                fontWeight: FontWeight.normal,
                color: isDarkMode
                    ? const Color(0xFFD0D5DD)
                    : const Color(0xFF667085),
              ),
            ),
          ),
          verticalSpaceMedium(context),
          CustomButtons.generalButton(
            text: "Proceed",
            context: context,
            onTap: () {},
          ),
          verticalSpaceSmall(context),
          CustomButtons.outlineButton(
            text: "Abort",
            context: context,
            textColor: Theme.of(context).primaryColor,
            onTap: () {
              Navigator.pop(context);
              viewModel.setSocialTradingPageEnum =
                  SocialTradingPageEnum.myTrades;
            },
          )
        ],
      ),
    );
  }
}
