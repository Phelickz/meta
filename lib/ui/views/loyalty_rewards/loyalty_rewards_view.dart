import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/loyalty_rewards/loyalty_rewards_view_model.dart';
import 'package:meta_trader/ui/widgets/appbar.dart';
import 'package:meta_trader/ui/widgets/loyalty_rewards/about_loyalty_rewards.dart';
import 'package:meta_trader/ui/widgets/loyalty_rewards/card.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';
import '../../../app/responsiveness/res.dart';

@RoutePage()
class LoyaltyRewardsView extends StackedView<LoyaltyRewardsViewModel> {
  const LoyaltyRewardsView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    LoyaltyRewardsViewModel viewModel,
    Widget? child,
  ) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
      isBusy: viewModel.isBusy,
      bodyPadding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 0),
      ),
      appBar: viewModel.loyaltyRewardsViewEnum == LoyaltyRewardsViewEnum.base
          ? globalAppBar(
              context,
              LocaleKeys.views_loyaltyRewardsView_loyaltyRewards.tr(),
              '',
              () {
                Navigator.pop(context);
              },
              [
                if (viewModel.loyaltyRewardsViewEnum ==
                    LoyaltyRewardsViewEnum.base) ...[
                  IconButton(
                    onPressed: () {
                      viewModel.setLoyaltyRewardsViewEnum =
                          LoyaltyRewardsViewEnum.about;
                    },
                    icon: Icon(
                      Icons.info_outlined,
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                ]
              ],
            )
          : globalAppBar(
              context,
              LocaleKeys.views_loyaltyRewardsView_aboutLoyaltyFeature.tr(),
              '',
              () {
                viewModel.setLoyaltyRewardsViewEnum =
                    LoyaltyRewardsViewEnum.base;
              },
              [],
            ),
      body: viewModel.loyaltyRewardsViewEnum == LoyaltyRewardsViewEnum.about
          ? const AboutLoyaltyRewards()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceSmall(context),
                  const LoyaltyRewardCard(),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(
                  //     horizontal: McGyver.rsDoubleW(context, 5),
                  //   ),
                  //   child: Align(
                  //     alignment: Alignment.center,
                  //     child: Image.asset(
                  //       "assets/images/silver.png",
                  //       width: double.infinity,
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  verticalSpaceSmall(context),
                  verticalSpaceSmall(context),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: McGyver.rsDoubleW(context, 5),
                    ),
                    child: Text(
                      LocaleKeys.views_loyaltyRewardsView_yourSilverBenefits,
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 2.2),
                        fontWeight: FontWeight.bold,
                        color:
                            isDarkMode ? Colors.white : const Color(0xff475467),
                      ),
                    ).tr(),
                  ),
                  verticalSpaceSmall(context),
                  silverBenefits(
                    context,
                    LocaleKeys.views_loyaltyRewardsView_sliverBenefit1
                        .tr(args: ['1%']),
                    LocaleKeys.views_loyaltyRewardsView_sliverBenefit1Sub.tr(),
                  ),
                  verticalSpaceXSmall(context),
                  silverBenefits(
                    context,
                    LocaleKeys.views_loyaltyRewardsView_sliverBenefit2.tr(),
                    LocaleKeys.views_loyaltyRewardsView_sliverBenefit2Sub
                        .tr(args: ['(-3%)']),
                  ),
                  verticalSpaceXSmall(context),
                  silverBenefits(
                    context,
                    LocaleKeys.views_loyaltyRewardsView_sliverBenefit3.tr(),
                    LocaleKeys.views_loyaltyRewardsView_sliverBenefit3Sub.tr(),
                  ),
                  verticalSpaceSmall(context),
                  verticalSpaceSmall(context),
                  Container(
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? const Color(0xff052844)
                          : const Color(0xffEBE9FE),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: McGyver.rsDoubleW(context, 5),
                          vertical: 8),
                      child: Row(
                        children: [
                          Text(
                            LocaleKeys
                                .views_loyaltyRewardsView_earnDailyRewards,
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 2),
                              color: isDarkMode
                                  ? Colors.white
                                  : const Color(0xff475467),
                              fontWeight: FontWeight.bold,
                            ),
                          ).tr(),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              viewModel.setViewDailyRewards =
                                  !viewModel.viewDailyRewards;
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: isDarkMode
                                    ? Theme.of(context).scaffoldBackgroundColor
                                    : Colors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4),
                                child: Row(
                                  children: [
                                    Text(
                                      LocaleKeys
                                          .views_loyaltyRewardsView_todayTask,
                                      style: CustomThemeData.generateStyle(
                                        fontSize: 12,
                                        color: isDarkMode
                                            ? const Color(0xffD0D5DD)
                                            : const Color(0xffD0D5DD),
                                      ),
                                    ).tr(),
                                    Icon(
                                      viewModel.viewDailyRewards
                                          ? Icons.keyboard_arrow_down_rounded
                                          : Icons.keyboard_arrow_up_rounded,
                                      color: isDarkMode
                                          ? const Color(0xffD0D5DD)
                                          : const Color(0xffD0D5DD),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: viewModel.viewDailyRewards,
                    child: Container(
                      decoration: BoxDecoration(
                        color: isDarkMode
                            ? const Color(0xff052844)
                            : const Color(0xffEBE9FE),
                      ),
                      child: Column(
                        children: [
                          dailyRewards(
                              context,
                              LocaleKeys.views_loyaltyRewardsView_dailyReward
                                  .tr(),
                              isActive: true),
                          dailyRewards(
                              context,
                              LocaleKeys.views_loyaltyRewardsView_dailyReward1
                                  .tr(),
                              isActive: false),
                        ],
                      ),
                    ),
                  ),
                  verticalSpaceSmall(context),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: McGyver.rsDoubleW(context, 5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys.views_loyaltyRewardsView_recentActivity,
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.8),
                            fontWeight: FontWeight.bold,
                            color: isDarkMode
                                ? const Color(0xff98A2B3)
                                : const Color(0xff475467),
                          ),
                        ).tr(),
                        TextButton(
                            onPressed: () {
                              viewModel.push(RecentActivity(model: viewModel));
                            },
                            child: Text(LocaleKeys.viewMore.tr()))
                      ],
                    ),
                  ),
                  verticalSpaceSmall(context),
                  activityTile(
                    context,
                    LocaleKeys.views_loyaltyRewardsView_activityTileText.tr(),
                    LocaleKeys.views_loyaltyRewardsView_activityTileTextSub
                        .tr(args: ['\$23']),
                  ),
                  verticalSpaceSmall(context),
                  activityTile(
                    context,
                    LocaleKeys.views_loyaltyRewardsView_activityTileText.tr(),
                    LocaleKeys.views_loyaltyRewardsView_activityTileTextSub
                        .tr(args: ['\$23']),
                  ),
                  verticalSpaceSmall(context),
                  activityTile(
                    context,
                    LocaleKeys.views_loyaltyRewardsView_activityTileText.tr(),
                    LocaleKeys.views_loyaltyRewardsView_activityTileTextSub
                        .tr(args: ['\$23']),
                  ),
                  verticalSpaceSmall(context),
                  activityTile(
                    context,
                    LocaleKeys.views_loyaltyRewardsView_activityTileText.tr(),
                    LocaleKeys.views_loyaltyRewardsView_activityTileTextSub
                        .tr(args: ['\$23']),
                  ),
                  verticalSpaceMedium(context),
                ],
              ),
            ),
    );
  }

  Widget silverBenefits(BuildContext context, String title, String subtitle) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 5),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: isDarkMode
              ? Theme.of(context).scaffoldBackgroundColor
              : Colors.white,
          border: Border.all(
            color: isDarkMode ? Colors.white30 : Colors.black12,
          ),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.4),
                  color: isDarkMode ? Colors.white : const Color(0xff475467),
                ),
              ).tr(),
              verticalSpaceXXSmall(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          isDarkMode ? Colors.white : const Color(0xff475467),
                    ),
                  ),
                  horizontalSpaceXXSmall(context),
                  Expanded(child: Text(subtitle)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget dailyRewards(BuildContext context, String title,
      {bool isActive = false}) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 5),
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isDarkMode
              ? SvgPicture.asset("assets/images/earn_rewards.svg")
              : SvgPicture.asset("assets/images/earn_rewards.svg"),
          horizontalSpaceXSmall(context),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.9),
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : const Color(0xff475467),
                  ),
                ).tr(),
                verticalSpaceXXSmall(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.views_loyaltyRewardsView_status,
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.2),
                            color: isDarkMode
                                ? Colors.white
                                : const Color(0xff475467),
                          ),
                        ).tr(),
                        verticalSpaceXXSmall(context),
                        Text(
                          LocaleKeys.reward,
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.2),
                            color: isDarkMode
                                ? Colors.white
                                : const Color(0xff475467),
                          ),
                        ).tr(),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.views_loyaltyRewardsView_notComplete,
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.2),
                            color: isDarkMode
                                ? Colors.white
                                : const Color(0xff475467),
                          ),
                        ).tr(),
                        verticalSpaceXXSmall(context),
                        Text(
                          LocaleKeys.views_loyaltyRewardsView_points,
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.2),
                            color: isDarkMode
                                ? Colors.white
                                : const Color(0xff475467),
                          ),
                        ).tr(),
                      ],
                    ),
                    Icon(
                      Icons.check_circle,
                      color: isActive
                          ? Colors.black38
                          : Theme.of(context).primaryColor,
                      size: 20,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget activityTile(BuildContext context, String title, String subtitle) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 5),
      ),
      child: Row(
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
                  fontSize: McGyver.textSize(context, 1.7),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : const Color(0xff475467),
                ),
              ).tr(),
              Text(
                subtitle,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.1),
                  color: isDarkMode ? Colors.white : const Color(0xff475467),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  LoyaltyRewardsViewModel viewModelBuilder(BuildContext context) =>
      LoyaltyRewardsViewModel();
}
