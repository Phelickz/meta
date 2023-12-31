import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/social_trading/components/cancel_sub_modal.dart';
import 'package:meta_trader/ui/widgets/social_trading/components/filter_positon_modal.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'components/custom_overview_summary_tab.dart';

class TraderOverview extends StatelessWidget {
  const TraderOverview({super.key, required this.model});
  final SocialTradingViewModel model;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          verticalSpaceSmall(context),
          _summaryTop(context, model),
          verticalSpaceSmall(context),
          verticalSpaceXXSmall(context),
          _summaryBottomComponent(context, model),
          verticalSpaceSmall(context),
          verticalSpaceXXSmall(context),
          _summaryPerformance(context, model),
          verticalSpaceSmall(context),
          verticalSpaceXXSmall(context),
          _summaryAccountDetails(context, model),
          verticalSpaceSmall(context),
          verticalSpaceXXSmall(context),
          _summaryRiskManagement(context, model),
          verticalSpaceSmall(context),
          verticalSpaceXXSmall(context),
          _summaryActivity(context, model),
          verticalSpaceSmall(context),
          verticalSpaceSmall(context),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: McGyver.rsDoubleW(context, 6),
            ),
            child: CustomButtons.generalButton(
              context: context,
              color: model.socialTradingPageEnum ==
                      SocialTradingPageEnum.copiedTraderPosition
                  ? Colors.red
                  : Theme.of(context).primaryColor,
              onTap: () {
                // showFilterModal(context);
                // model.setSocialTradingPageEnum =
                //     SocialTradingPageEnum.subscriptionSetup;
                // if (model.socialTradingPageEnum ==
                //     SocialTradingPageEnum.masterTraders) {
                if (model.socialTradingPageEnum ==
                    SocialTradingPageEnum.copiedTraderPosition) {
                  showCancelCopyingModal(context, model);
                } else {
                  model.setSocialTradingPageEnum =
                      SocialTradingPageEnum.subscriptionSetup;
                  model.push(SubscriptionSetupPage(viewModel: model));
                }
                // }
              },
              text: model.socialTradingPageEnum ==
                      SocialTradingPageEnum.copiedTraderPosition
                  ? LocaleKeys.stopCoping.tr()
                  : LocaleKeys.socialTradingWidget_overViewWidget_setupCopying
                      .tr(),
            ),
          ),
          verticalSpaceSmall(context),
          verticalSpaceXSmall(context)
        ],
      ),
    );
  }

  void showCancelCopyingModal(BuildContext context, SocialTradingViewModel vm) {
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
          return CancelSubModal(
            viewModel: vm,
          );
        });
  }

  Widget _summaryBottomComponent(
      BuildContext context, SocialTradingViewModel viewModel) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 3.5),
        vertical: McGyver.rsDoubleH(context, 2),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 5),
      ),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF052844) : const Color(0xFFFAFDFF),
        borderRadius: BorderRadius.circular(McGyver.rsDoubleW(context, 4)),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            height: McGyver.rsDoubleH(context, 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: isDarkMode
                            ? const Color(0xFF073961)
                            : const Color(0xFFECF7FE),
                        borderRadius: BorderRadius.circular(
                            McGyver.rsDoubleW(context, 2)),
                        border: !isDarkMode
                            ? Border.all(color: const Color(0xffE4E7EC))
                            : null),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.experience,
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.4),
                            fontWeight: FontWeight.w500,
                            color: isDarkMode
                                ? const Color(0xFF98A2B3)
                                : const Color(0xFF667085),
                          ),
                        ).tr(),
                        SizedBox(
                          height: McGyver.rsDoubleH(context, 0.7),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "54216",
                              style: CustomThemeData.generateStyle(
                                fontSize: McGyver.textSize(context, 1.5),
                                fontWeight: FontWeight.bold,
                                color: isDarkMode
                                    ? const Color(0xFFD0D5DD)
                                    : const Color(0xFF98A2B3),
                              ),
                            ),
                            const SizedBox(
                              width: 1,
                            ),
                            Text(
                              LocaleKeys.days,
                              style: CustomThemeData.generateStyle(
                                fontSize: McGyver.textSize(context, 1.3),
                                fontWeight: FontWeight.normal,
                                color: isDarkMode
                                    ? const Color(0xFFD0D5DD)
                                    : const Color(0xFF98A2B3),
                              ),
                            ).tr(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                horizontalSpaceXXSmall(context),
                horizontalSpaceXXSmall(context),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? const Color(0xFF073961)
                          : const Color(0xFFECF7FE),
                      borderRadius:
                          BorderRadius.circular(McGyver.rsDoubleW(context, 2)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.commission,
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.4),
                            fontWeight: FontWeight.w500,
                            color: isDarkMode
                                ? const Color(0xFF98A2B3)
                                : const Color(0xFF667085),
                          ),
                        ).tr(),
                        SizedBox(
                          height: McGyver.rsDoubleH(context, 0.7),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "29",
                              style: CustomThemeData.generateStyle(
                                fontSize: McGyver.textSize(context, 1.5),
                                fontWeight: FontWeight.bold,
                                color: isDarkMode
                                    ? const Color(0xFFD0D5DD)
                                    : const Color(0xFF98A2B3),
                              ),
                            ),
                            const SizedBox(
                              width: 1,
                            ),
                            Text(
                              "%",
                              style: CustomThemeData.generateStyle(
                                fontSize: McGyver.textSize(context, 1.3),
                                fontWeight: FontWeight.normal,
                                color: isDarkMode
                                    ? const Color(0xFFD0D5DD)
                                    : const Color(0xFF98A2B3),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                horizontalSpaceXXSmall(context),
                horizontalSpaceXXSmall(context),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? const Color(0xFF073961)
                          : const Color(0xFFECF7FE),
                      borderRadius:
                          BorderRadius.circular(McGyver.rsDoubleW(context, 2)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.equity,
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.4),
                            fontWeight: FontWeight.w500,
                            color: isDarkMode
                                ? const Color(0xFF98A2B3)
                                : const Color(0xFF667085),
                          ),
                        ).tr(),
                        SizedBox(
                          height: McGyver.rsDoubleH(context, 0.7),
                        ),
                        Text(
                          "24",
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.5),
                            fontWeight: FontWeight.bold,
                            color: isDarkMode
                                ? const Color(0xFFD0D5DD)
                                : const Color(0xFF98A2B3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          verticalSpaceSmall(context),
          _twotext(
              context,
              LocaleKeys.socialTradingWidget_overViewWidget_totalCopiers.tr(),
              "326,096"),
          verticalSpaceXXSmall(context),
          _twotext(context, LocaleKeys.strategyDescriptionText.tr(), ""),
          verticalSpaceXXSmall(context),
          Text(
            LocaleKeys.socialTradingWidget_overViewWidget_helloEveryOne,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.5),
              fontWeight: FontWeight.bold,
              color: isDarkMode
                  ? const Color(0xFFD0D5DD)
                  : const Color(0xFF98A2B3),
            ),
          ).tr()
        ],
      ),
    );
  }

  Widget _twotext(BuildContext context, String text1, String text2) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.4),
            fontWeight: FontWeight.w500,
            color:
                isDarkMode ? const Color(0xFF98A2B3) : const Color(0xFF667085),
          ),
        ),
        Text(
          text2,
          textAlign: TextAlign.end,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.7),
            fontWeight: FontWeight.bold,
            color:
                isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFF98A2B3),
          ),
        ),
      ],
    );
  }

  void showFilterModal(BuildContext context) {
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
          return const FilterPositionModal();
        });
  }

  Widget _summaryTopComponent(
      BuildContext context, SocialTradingViewModel viewModel) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(children: [
      _twotext(context, LocaleKeys.home_higherSuccessRates_successRate.tr(),
          "99.32%"),
      verticalSpaceXSmall(context),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LocaleKeys.home_higherSuccessRates_riskScore,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.4),
              fontWeight: FontWeight.w500,
              color: isDarkMode
                  ? const Color(0xFF98A2B3)
                  : const Color(0xFF667085),
            ),
          ).tr(),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: RichText(
                text: TextSpan(
                  text: LocaleKeys.home_higherSuccessRates_riskScore.tr(),
                  style: CustomThemeData.generateStyle(
                    fontSize: 10,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: LocaleKeys.home_higherSuccessRates_mediumCap.tr(),
                      style: CustomThemeData.generateStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              Text(
                "8/10",
                textAlign: TextAlign.end,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.7),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode
                      ? const Color(0xFFD0D5DD)
                      : const Color(0xFF98A2B3),
                ),
              ),
              horizontalSpaceXXSmall(context),
              SizedBox(
                height: McGyver.rsDoubleH(context, 1.7),
                width: McGyver.rsDoubleH(context, 1.7),
                child: SvgPicture.asset(
                  "assets/icons/info-circle.svg",
                  colorFilter: ColorFilter.mode(
                    isDarkMode
                        ? const Color(0xFFD0D5DD)
                        : const Color(0xFF667085),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    ]);
  }

  Widget _summaryTop(BuildContext context, SocialTradingViewModel viewModel) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 3.5),
        vertical: McGyver.rsDoubleH(context, 2),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 5),
      ),
      decoration: BoxDecoration(
        color: isDarkMode
            ? const Color(0xFF052844)
            : const Color(
                0xFFFAFDFF,
              ),
        borderRadius: BorderRadius.circular(
          McGyver.rsDoubleW(context, 4),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.summary,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode
                      ? const Color(0xFFFFFFFF)
                      : const Color(0xFF475467),
                ),
              ).tr(),
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
          verticalSpaceXSmall(context),
          ValueListenableBuilder<int>(
            valueListenable: viewModel.overviewSummaryTabSelectedNotifier,
            builder: (context, index, child) {
              return SizedBox(
                height: McGyver.rsDoubleH(context, 8.5),
                child: IndexedStack(
                  index: index,
                  children: [
                    _summaryTopComponent(context, viewModel),
                    _summaryTopComponent(context, viewModel),
                    _summaryTopComponent(context, viewModel),
                    _summaryTopComponent(context, viewModel)
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _summaryPerformanceComponent(
      BuildContext context, SocialTradingViewModel viewModel) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.gain,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.4),
                    fontWeight: FontWeight.w500,
                    color: isDarkMode
                        ? const Color(0xFF98A2B3)
                        : const Color(0xFF667085),
                  ),
                ).tr(),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Text(
                      "32.8",
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.6),
                        fontWeight: FontWeight.bold,
                        color: isDarkMode
                            ? const Color(0xFF94D1F9)
                            : const Color(0xFF47B0F5),
                      ),
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    Text(
                      "%",
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.3),
                        fontWeight: FontWeight.normal,
                        color: isDarkMode
                            ? const Color(0xFF94D1F9)
                            : const Color(0xFF47B0F5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            horizontalSpaceXXSmall(context),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.copiers,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.4),
                    fontWeight: FontWeight.w500,
                    color: isDarkMode
                        ? const Color(0xFF98A2B3)
                        : const Color(0xFF667085),
                  ),
                ).tr(),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "222",
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.6),
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? const Color(0xFF94D1F9)
                        : const Color(0xFF47B0F5),
                  ),
                ),
              ],
            ),
            horizontalSpaceXSmall(context),
            Row(
              children: [
                Icon(
                  CupertinoIcons.arrow_up,
                  color: isDarkMode
                      ? const Color(0xFF94D1F9)
                      : const Color(0xFF47B0F5),
                  size: 14,
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  "11.80%",
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.5),
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? const Color(0xFFD0D5DD)
                        : const Color(0xFF98A2B3),
                  ),
                )
              ],
            )
          ],
        ),
        verticalSpaceXSmall(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LocaleKeys.profits,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.4),
                fontWeight: FontWeight.w500,
                color: isDarkMode
                    ? const Color(0xFF98A2B3)
                    : const Color(0xFF667085),
              ),
            ).tr(),
            Text(
              LocaleKeys.loss,
              textAlign: TextAlign.end,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.4),
                fontWeight: FontWeight.w500,
                color: isDarkMode
                    ? const Color(0xFF98A2B3)
                    : const Color(0xFF667085),
              ),
            ).tr(),
          ],
        ),
        verticalSpaceXXSmall(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$300",
              textAlign: TextAlign.end,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.7),
                fontWeight: FontWeight.bold,
                color: isDarkMode
                    ? const Color(0xFFD0D5DD)
                    : const Color(0xFF98A2B3),
              ),
            ),
            Text(
              "\$21",
              textAlign: TextAlign.end,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.7),
                fontWeight: FontWeight.bold,
                color: isDarkMode
                    ? const Color(0xFFD0D5DD)
                    : const Color(0xFF98A2B3),
              ),
            ),
          ],
        ),
        SizedBox(
          height: McGyver.rsDoubleH(context, 0.5),
        ),
        LinearProgressIndicator(
          minHeight: McGyver.rsDoubleH(context, 1),
          value: 0.5,
          color: const Color(0xff47b0f5),
          backgroundColor: const Color(0xFFF04438),
        ),
      ],
    );
  }

  Widget _summaryPerformance(
      BuildContext context, SocialTradingViewModel viewModel) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 3.5),
        vertical: McGyver.rsDoubleH(context, 2),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 5),
      ),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF052844) : const Color(0xFFFAFDFF),
        borderRadius: BorderRadius.circular(McGyver.rsDoubleW(context, 4)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.performance,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode
                      ? const Color(0xFFFFFFFF)
                      : const Color(0xFF475467),
                ),
              ).tr(),
              CustomOverviewSummaryTab(
                firstTabName: "2W",
                secondTabName: "1M",
                thirdTabName: "3M",
                fourthTabName: "6M",
                tabIndex: viewModel.performanceSummaryTabSelectedNotifier.value,
                onSelectTab: (val) {
                  viewModel.performanceSummaryTabSelectedNotifier.value = val;
                },
              ),
            ],
          ),
          verticalSpaceXSmall(context),
          ValueListenableBuilder<int>(
            valueListenable: viewModel.performanceSummaryTabSelectedNotifier,
            builder: (context, index, child) {
              return SizedBox(
                height: McGyver.rsDoubleH(context, 12.5),
                child: IndexedStack(
                  index: index,
                  children: [
                    _summaryPerformanceComponent(context, viewModel),
                    _summaryPerformanceComponent(context, viewModel),
                    _summaryPerformanceComponent(context, viewModel),
                    _summaryPerformanceComponent(context, viewModel)
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _summaryAccountDetails(
      BuildContext context, SocialTradingViewModel viewModel) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 3.5),
        vertical: McGyver.rsDoubleH(context, 2),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 5),
      ),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF052844) : const Color(0xFFFAFDFF),
        borderRadius: BorderRadius.circular(McGyver.rsDoubleW(context, 4)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.socialTradingWidget_overViewWidget_accountDetails,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode
                      ? const Color(0xFFFFFFFF)
                      : const Color(0xFF475467),
                ),
              ).tr(),
            ],
          ),
          verticalSpaceXSmall(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _twotextInfo(
                context,
                LocaleKeys.socialTradingWidget_overViewWidget_floatingProfit
                    .tr(),
                "\$ 32.8",
                CrossAxisAlignment.start,
              ),
              _twotextInfo(
                context,
                LocaleKeys.socialTradingWidget_overViewWidget_masterTraderBonus
                    .tr(),
                "% 73",
                CrossAxisAlignment.end,
              )
            ],
          ),
          verticalSpaceXSmall(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _twotextInfo(
                context,
                LocaleKeys.balance.tr(),
                "\$ 32.8",
                CrossAxisAlignment.start,
              ),
              _twotextInfo(
                context,
                LocaleKeys.leverage.tr(),
                "1:500",
                CrossAxisAlignment.end,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _summaryRiskManagement(
      BuildContext context, SocialTradingViewModel viewModel) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 3.5),
        vertical: McGyver.rsDoubleH(context, 2),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 5),
      ),
      decoration: BoxDecoration(
        color: isDarkMode
            ? const Color(0xFF052844)
            : const Color(
                0xFFFAFDFF,
              ),
        borderRadius: BorderRadius.circular(
          McGyver.rsDoubleW(context, 4),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.socialTradingWidget_overViewWidget_riskManagement,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode
                      ? const Color(0xFFFFFFFF)
                      : const Color(0xFF475467),
                ),
              ).tr(),
            ],
          ),
          verticalSpaceXSmall(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _twotextInfo(
                context,
                LocaleKeys.socialTradingWidget_overViewWidget_maxUnrealizedLoss
                    .tr(),
                "\$ 32.8",
                CrossAxisAlignment.start,
              ),
              _twotextInfo(
                context,
                LocaleKeys
                    .socialTradingWidget_overViewWidget_maxDrawDownDuration
                    .tr(),
                "% 73",
                CrossAxisAlignment.end,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _twotextInfo(BuildContext context, String text1, String text2,
      CrossAxisAlignment alignment) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Row(
          children: [
            Text(
              text1,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.4),
                fontWeight: FontWeight.w500,
                color: isDarkMode
                    ? const Color(0xFF98A2B3)
                    : const Color(0xFF667085),
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            SizedBox(
              height: McGyver.rsDoubleH(context, 1.7),
              width: McGyver.rsDoubleH(context, 1.7),
              child: SvgPicture.asset(
                "assets/icons/info-circle.svg",
                colorFilter: ColorFilter.mode(
                  isDarkMode
                      ? const Color(0xFF98A2B3)
                      : const Color(0xFF667085),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: McGyver.rsDoubleH(context, 0.5),
        ),
        Text(
          text2,
          textAlign: TextAlign.end,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.6),
            fontWeight: FontWeight.bold,
            color:
                isDarkMode ? const Color(0xFF94D1F9) : const Color(0xFF47B0F5),
          ),
        ),
      ],
    );
  }

  Widget _summaryActivity(
      BuildContext context, SocialTradingViewModel viewModel) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: McGyver.rsDoubleH(context, 2),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 5),
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
                  LocaleKeys.activity,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 2),
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? const Color(0xFFFFFFFF)
                        : const Color(0xFF475467),
                  ),
                ).tr(),
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
      BuildContext context, SocialTradingViewModel viewModel) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        title: AxisTitle(
          text: LocaleKeys.days.tr(),
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
          text: LocaleKeys.priceSentimentWidget_details_priceMovement.tr(),
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
          name: LocaleKeys.price.tr(),
        ),
      ],
    );
  }
}
