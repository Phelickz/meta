import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';
import 'package:meta_trader/ui/widgets/appbar.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';

@RoutePage()
class SubscriptionGuidePage extends StatelessWidget {
  final SocialTradingViewModel viewModel;
  const SubscriptionGuidePage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
      appBar: globalAppBar(context, LocaleKeys.subscriptionGuide,
          LocaleKeys.socialTradingWidget_subscriptionGuideWidget_learnAbout,
          () {
        Navigator.pop(context);
      }, []),
      isBusy: viewModel.isBusy,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceXSmall(context),
          Text(
            LocaleKeys
                .socialTradingWidget_subscriptionGuideWidget_copyProportion,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.9),
              fontWeight: FontWeight.bold,
              color: isDarkMode
                  ? const Color(0xFFFFFFFF)
                  : const Color(0xFF475467),
            ),
          ),
          verticalSpaceXSmall(context),
          Text(
            LocaleKeys
                .socialTradingWidget_subscriptionGuideWidget_selectTheSize,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.6),
              fontWeight: FontWeight.w500,
              color: isDarkMode
                  ? const Color(0xFF98A2B3)
                  : const Color(0xFF667085),
            ),
          ),
          verticalSpaceXSmall(context),
          _bulletPointText(
              context,
              LocaleKeys.equal1,
              LocaleKeys
                  .socialTradingWidget_subscriptionGuideWidget_theVolumeOf),
          verticalSpaceXSmall(context),
          _bulletPointText(
              context,
              LocaleKeys.double2,
              LocaleKeys
                  .socialTradingWidget_subscriptionGuideWidget_toFacilitate),
          verticalSpaceXSmall(context),
          _bulletPointText(
              context,
              LocaleKeys.triple3,
              LocaleKeys
                  .socialTradingWidget_subscriptionGuideWidget_weMayAutomatically),
          verticalSpaceSmall(context),
          Text(
            LocaleKeys.addSupportFunds,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.9),
              fontWeight: FontWeight.bold,
              color: isDarkMode
                  ? const Color(0xFFFFFFFF)
                  : const Color(0xFF475467),
            ),
          ),
          verticalSpaceXSmall(context),
          Text(
            LocaleKeys
                .socialTradingWidget_subscriptionGuideWidget_supportFundsHelp,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.6),
              fontWeight: FontWeight.w500,
              color: isDarkMode
                  ? const Color(0xFF98A2B3)
                  : const Color(0xFF667085),
            ),
          )
        ],
      ),
    );
  }

  Widget _bulletPointText(
      BuildContext context, String boldText, String mediumText) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.only(left: McGyver.rsDoubleW(context, 2)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              CircleAvatar(
                radius: McGyver.rsDoubleW(context, .5),
                backgroundColor: isDarkMode
                    ? const Color(0xFF98A2B3)
                    : const Color(0xFF667085),
              ),
            ],
          ),
          horizontalSpaceXSmall(context),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: boldText,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.6),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode
                      ? const Color(0xFFFFFFFF)
                      : const Color(0xFF475467),
                ),
                children: [
                  TextSpan(
                    text: " ",
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.6),
                      fontWeight: FontWeight.w500,
                      color: isDarkMode
                          ? const Color(0xFF98A2B3)
                          : const Color(0xFF667085),
                    ),
                  ),
                  TextSpan(
                    text: mediumText,
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.6),
                      fontWeight: FontWeight.w500,
                      color: isDarkMode
                          ? const Color(0xFF98A2B3)
                          : const Color(0xFF667085),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
