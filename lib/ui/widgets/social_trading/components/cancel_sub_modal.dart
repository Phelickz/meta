import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
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
      height: McGyver.rsDoubleH(context, 60),
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
            LocaleKeys
                .socialTradingWidget_socialTradingComponent_cancelSub_cancelCoping,
            textAlign: TextAlign.center,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 2.8),
              fontWeight: FontWeight.bold,
              color: isDarkMode
                  ? const Color(0xFFD0D5DD)
                  : const Color(0xFF475467),
            ),
          ).tr(),
          verticalSpaceXSmall(context),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: McGyver.rsDoubleW(context, 10),
            ),
            child: Text(
              LocaleKeys
                  .socialTradingWidget_socialTradingComponent_cancelSub_onceYouCancel,
              textAlign: TextAlign.center,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.6),
                fontWeight: FontWeight.normal,
                color: isDarkMode
                    ? const Color(0xFFD0D5DD)
                    : const Color(0xFF667085),
              ),
            ).tr(),
          ),
          verticalSpaceMedium(context),
          CustomButtons.generalButton(
            text: LocaleKeys.proceed.tr(),
            context: context,
            onTap: () {
              viewModel.push(CopiedTraderTerminatedPage(viewModel: viewModel));
            },
          ),
          verticalSpaceSmall(context),
          CustomButtons.outlineButton(
            text: LocaleKeys.abort.tr(),
            context: context,
            textColor: Theme.of(context).primaryColor,
            onTap: () {
              Navigator.pop(context);
              // viewModel.setSocialTradingPageEnum =
              //     SocialTradingPageEnum.myTrades;
            },
          )
        ],
      ),
    );
  }
}
