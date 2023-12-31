import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/loyalty_rewards/loyalty_rewards_view_model.dart';
import 'package:meta_trader/ui/widgets/appbar.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';

import '../../../generated/locale_keys.g.dart';

@RoutePage()
class RecentActivity extends StatelessWidget {
  const RecentActivity({super.key, required this.model});
  final LoyaltyRewardsViewModel model;

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      isBusy: model.isBusy,
      appBar: globalAppBar(
          context, LocaleKeys.views_loyaltyRewardsView_recentActivity.tr(), '',
          () {
        Navigator.pop(context);
      }, []),
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpaceSmall(context),
            activityTile(
              context,
              LocaleKeys.loyaltyReward_recentActivityWidget_activityTile1.tr(),
              LocaleKeys.loyaltyReward_recentActivityWidget_activityTile2.tr(),
            ),
            verticalSpaceSmall(context),
            activityTile(
              context,
              LocaleKeys.loyaltyReward_recentActivityWidget_activityTile1.tr(),
              LocaleKeys.loyaltyReward_recentActivityWidget_activityTile2.tr(),
            ),
            verticalSpaceSmall(context),
            activityTile(
              context,
              LocaleKeys.loyaltyReward_recentActivityWidget_activityTile1.tr(),
              LocaleKeys.loyaltyReward_recentActivityWidget_activityTile2.tr(),
            ),
            verticalSpaceSmall(context),
            activityTile(
              context,
              LocaleKeys.loyaltyReward_recentActivityWidget_activityTile1.tr(),
              LocaleKeys.loyaltyReward_recentActivityWidget_activityTile2.tr(),
            ),
          ],
        ),
      ),
    );
  }

  Widget activityTile(BuildContext context, String title, String subtitle) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Row(
      children: [
        isDarkMode
            ? SvgPicture.asset("assets/icons/trophy_dark.svg")
            : SvgPicture.asset("assets/icons/trophy.svg"),
        horizontalSpaceXSmall(context),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.8),
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : const Color(0xff475467),
              ),
            ),
            Text(
              subtitle,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.3),
                color: isDarkMode ? Colors.white : const Color(0xff475467),
              ),
            ),
          ],
        )
      ],
    );
  }
}
