import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';
import 'package:meta_trader/ui/widgets/appbar.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:meta_trader/ui/widgets/social_trading/components/cancel_sub_modal.dart';
import 'package:meta_trader/ui/widgets/textfields/label_text_field.dart';
import 'package:meta_trader/ui/widgets/trade/components/plus_minus_text.dart';

@RoutePage()
class SubscriptionSetupPage extends StatelessWidget {
  final SocialTradingViewModel viewModel;
  const SubscriptionSetupPage({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
      isBusy: viewModel.isBusy,
      appBar: globalAppBar(
          context,
          LocaleKeys
              .socialTradingWidget_subscriptionSetupWidget_subscriptionSetup
              .tr(),
          '', () {
        Navigator.pop(context);
      }, [
        IconButton(
          onPressed: () {
            // viewModel.setSocialTradingPageEnum =
            //     SocialTradingPageEnum.subscriptionGuide;
            viewModel.push(SubscriptionGuidePage(viewModel: viewModel));
          },
          icon: SizedBox(
            height: McGyver.rsDoubleH(context, 2.8),
            width: McGyver.rsDoubleH(context, 2.8),
            child: SvgPicture.asset(
              "assets/icons/info-circle.svg",
              colorFilter: ColorFilter.mode(
                isDarkMode ? const Color(0xFFD0D5DD) : Colors.black,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpaceXSmall(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/btc.png',
                      width: 35,
                    ),
                    horizontalSpaceXXSmall(context),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Satoshi Nakamoto',
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.8),
                            color: isDarkMode ? Colors.white70 : Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.amber[300],
                            ),
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.amber[300],
                            ),
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.amber[300],
                            ),
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.amber[300],
                            ),
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.amber[300],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Text(
                              "22.8",
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
                    horizontalSpaceXSmall(context),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          "22",
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
                  ],
                ),
              ],
            ),
            verticalSpaceSmall(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys
                      .socialTradingWidget_subscriptionSetupWidget_fundInWallet,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.6),
                    fontWeight: FontWeight.w500,
                    color: isDarkMode
                        ? const Color(0xFF98A2B3)
                        : const Color(0xFF667085),
                  ),
                ).tr(),
                Text(
                  "\$12 000",
                  textAlign: TextAlign.end,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? const Color(0xFFD0D5DD)
                        : const Color(0xFF98A2B3),
                  ),
                ),
              ],
            ),
            verticalSpaceSmall(context),
            // Copy Proportion
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: McGyver.rsDoubleW(context, 3.5),
                vertical: McGyver.rsDoubleH(context, 2),
              ),
              decoration: BoxDecoration(
                color: isDarkMode
                    ? const Color(0xFF052844)
                    : const Color(0xFFFAFDFF),
                borderRadius:
                    BorderRadius.circular(McGyver.rsDoubleW(context, 4)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.copyProportion,
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 1.9),
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? const Color(0xFFFFFFFF)
                              : const Color(0xFF475467),
                        ),
                      ).tr(),
                      InkWell(
                        onTap: () {
                          viewModel.isCustomCopyProportionNotifier.value =
                              !viewModel.isCustomCopyProportionNotifier.value;
                        },
                        child: ValueListenableBuilder<bool>(
                          valueListenable:
                              viewModel.isCustomCopyProportionNotifier,
                          builder: (context, isCustom, child) => Text(
                            isCustom
                                ? LocaleKeys.custom.tr()
                                : LocaleKeys.defaultText.tr(),
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.5),
                              fontWeight: FontWeight.normal,
                              color: isDarkMode
                                  ? const Color(0xFF94D1F9)
                                  : const Color(0xFF47B0F5),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  verticalSpaceSmall(context),
                  ValueListenableBuilder<bool>(
                    valueListenable: viewModel.isCustomCopyProportionNotifier,
                    builder: (context, isCustom, child) => isCustom
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: viewModel.copyProportions.map((item) {
                              final index =
                                  viewModel.copyProportions.indexOf(item);
                              return InkWell(
                                onTap: () {
                                  viewModel.selectedCopyProportionNotifier
                                      .value = index;
                                },
                                child: ValueListenableBuilder<int>(
                                    valueListenable: viewModel
                                        .selectedCopyProportionNotifier,
                                    builder: (context, selectedIndex, child) {
                                      return Container(
                                        height: McGyver.rsDoubleH(context, 11),
                                        width: McGyver.rsDoubleW(context, 26),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              McGyver.rsDoubleW(context, 2),
                                            ),
                                            color: isDarkMode
                                                ? selectedIndex == index
                                                    ? const Color(0xff153856)
                                                    : const Color(0xff0C2031)
                                                : selectedIndex == index
                                                    ? const Color(0xff0C95EF)
                                                    : Colors.transparent,
                                            border: isDarkMode
                                                ? selectedIndex == index
                                                    ? Border.all(
                                                        color: const Color(
                                                            0xff667085))
                                                    : null
                                                : selectedIndex != index
                                                    ? Border.all(
                                                        color: const Color(
                                                            0xffE4E7EC))
                                                    : null),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${item["title"]}",
                                                style: CustomThemeData
                                                    .generateStyle(
                                                  fontSize: McGyver.textSize(
                                                      context, 1.7),
                                                  fontWeight: FontWeight.bold,
                                                  color: isDarkMode
                                                      ? const Color(0xFFFFFFFF)
                                                      : selectedIndex == index
                                                          ? Colors.white
                                                          : const Color(
                                                              0xFF475467),
                                                ),
                                              ),
                                              const SizedBox(height: 7),
                                              Text(
                                                LocaleKeys
                                                    .socialTradingWidget_subscriptionSetupWidget_argumentItemRequired
                                                    .tr(),
                                                style: CustomThemeData
                                                    .generateStyle(
                                                  fontSize: McGyver.textSize(
                                                      context, 1.4),
                                                  fontWeight: FontWeight.normal,
                                                  color: isDarkMode
                                                      ? const Color(0xFFFFFFFF)
                                                      : selectedIndex == index
                                                          ? Colors.white
                                                          : const Color(
                                                              0xFF475467),
                                                ),
                                              ).tr(args: [
                                                '\$${item["amount"]}'
                                              ]),
                                              const SizedBox(height: 3),
                                              Text(
                                                LocaleKeys
                                                    .socialTradingWidget_subscriptionSetupWidget_argumentTradeVolume
                                                    .tr(),
                                                style: CustomThemeData
                                                    .generateStyle(
                                                  fontSize: McGyver.textSize(
                                                      context, 1.3),
                                                  fontWeight: FontWeight.w500,
                                                  color: isDarkMode
                                                      ? const Color(0xFF98A2B3)
                                                      : selectedIndex == index
                                                          ? Colors.white
                                                          : const Color(
                                                              0xFF475467),
                                                ),
                                              ).tr(args: ['${item["volume"]}']),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              );
                            }).toList(),
                          )
                        : PlusMinusText(
                            value: "x4",
                            label: LocaleKeys
                                .socialTradingWidget_subscriptionSetupWidget_enterValue
                                .tr(),
                            onPlus: () {},
                            onMinus: () {},
                            onTextChanged: (val) {},
                          ),
                  ),
                ],
              ),
            ),
            verticalSpaceSmall(context),
            Container(
              padding: EdgeInsets.only(
                top: McGyver.rsDoubleW(context, 2),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  McGyver.rsDoubleW(context, 2),
                ),
                border: Border.all(
                  width: 0.3,
                  color: isDarkMode
                      ? const Color(0xFF667085)
                      : const Color(0xFF98A2B3),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: McGyver.rsDoubleW(context, 4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys.addSupportFunds.tr(),
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.8),
                            fontWeight: FontWeight.w500,
                            color: isDarkMode
                                ? const Color(0xFFD0D5DD)
                                : const Color(0xFF667085),
                          ),
                        ).tr(),
                        ValueListenableBuilder<bool>(
                          valueListenable: viewModel.willSupportFundNotifier,
                          builder: (context, willSupport, child) =>
                              Switch.adaptive(
                            value: willSupport,
                            onChanged: (value) {
                              viewModel.willSupportFundNotifier.value = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpaceXSmall(context),
                  ValueListenableBuilder<bool>(
                      valueListenable: viewModel.willSupportFundNotifier,
                      builder: (context, willSupport, child) => willSupport
                          ? Container(
                              padding:
                                  EdgeInsets.all(McGyver.rsDoubleW(context, 4)),
                              decoration: BoxDecoration(
                                color: isDarkMode
                                    ? const Color(0xFF052844)
                                    : Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(
                                  McGyver.rsDoubleW(context, 2),
                                ),
                                border: Border.all(
                                  width: 0.3,
                                  color: isDarkMode
                                      ? const Color(0xFF667085)
                                      : const Color(0xFF98A2B3),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LabelTextField(
                                    label: LocaleKeys
                                        .socialTradingWidget_subscriptionSetupWidget_supportAmount
                                        .tr(),
                                    hintText: LocaleKeys
                                        .socialTradingWidget_subscriptionSetupWidget_enterAmount
                                        .tr(),
                                    keyboardType: TextInputType.number,
                                    hasSmallMargin: true,
                                  ),
                                  Text(
                                    LocaleKeys
                                        .socialTradingWidget_subscriptionSetupWidget_55OfTheRequired
                                        .tr(),
                                    textAlign: TextAlign.start,
                                    style: CustomThemeData.generateStyle(
                                      fontSize: McGyver.textSize(context, 1.3),
                                      fontWeight: FontWeight.normal,
                                      color: isDarkMode
                                          ? const Color(0xFF47B0F5)
                                          : const Color(0xFF20A0F3),
                                    ),
                                  ).tr(),
                                ],
                              ),
                            )
                          : Container()),
                ],
              ),
            ),

            verticalSpaceXXSmall(context),
            Row(
              children: [
                SizedBox(
                  height: McGyver.rsDoubleH(context, 2.5),
                  width: McGyver.rsDoubleH(context, 2.5),
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
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    LocaleKeys
                        .socialTradingWidget_subscriptionSetupWidget_supportFundsProtect
                        .tr(),
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.4),
                      fontWeight: FontWeight.w500,
                      color: isDarkMode
                          ? const Color(0xFF98A2B3)
                          : const Color(0xFF667085),
                    ),
                  ).tr(),
                ),
              ],
            ),
            verticalSpaceSmall(context),
            verticalSpaceXSmall(context),
            // Summary
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: McGyver.rsDoubleW(context, 3.5),
                vertical: McGyver.rsDoubleH(context, 2),
              ),
              decoration: BoxDecoration(
                color: isDarkMode
                    ? const Color(0xFF052844)
                    : Theme.of(context).primaryColor.withOpacity(0.2),
                borderRadius:
                    BorderRadius.circular(McGyver.rsDoubleW(context, 4)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.summary.tr(),
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 1.9),
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? const Color(0xFFFFFFFF)
                              : const Color(0xFF475467),
                        ),
                      ).tr(),
                    ],
                  ),
                  verticalSpaceSmall(context),
                  ValueListenableBuilder<int>(
                    valueListenable: viewModel.selectedCopyProportionNotifier,
                    builder: (context, selectedIndex, child) => _twotext(
                      context,
                      LocaleKeys.copyProportion.tr(),
                      "${viewModel.copyProportions[selectedIndex]["title"]}",
                    ),
                  ),
                  verticalSpaceXSmall(context),
                  _twotext(
                      context,
                      LocaleKeys
                          .socialTradingWidget_subscriptionSetupWidget_requiredInvestment
                          .tr(),
                      "\$26.00"),
                  verticalSpaceXSmall(context),
                  _twotext(context, LocaleKeys.supportFunds.tr(), "\$0.00"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.home_higherSuccessRates_riskScore.tr(),
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 1.4),
                          fontWeight: FontWeight.w500,
                          color: isDarkMode
                              ? const Color(0xFF98A2B3)
                              : const Color(0xFF667085),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 5),
                          child: RichText(
                            text: TextSpan(
                              text: LocaleKeys.home_higherSuccessRates_riskScore
                                  .tr(),
                              style: CustomThemeData.generateStyle(
                                fontSize: 10,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: LocaleKeys
                                      .home_higherSuccessRates_mediumCap
                                      .tr(),
                                  style: CustomThemeData.generateStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
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
                  ),
                ],
              ),
            ),
            verticalSpaceSmall(context),
            verticalSpaceSmall(context),
            CustomButtons.generalButton(
              context: context,
              color: viewModel.socialTradingPageEnum ==
                      SocialTradingPageEnum.copiedTraderPosition
                  ? Colors.red
                  : Theme.of(context).primaryColor,
              onTap: () {
                if (viewModel.socialTradingPageEnum ==
                    SocialTradingPageEnum.copiedTraderPosition) {
                  showFilterModal(context, viewModel);
                } else {
                  viewModel.push(CopiedTraderSuccessPage(viewModel: viewModel));
                }
              },
              text: viewModel.socialTradingPageEnum ==
                      SocialTradingPageEnum.copiedTraderPosition
                  ? LocaleKeys.stopCoping.tr()
                  : LocaleKeys.socialTradingWidget_myTrades_startCopying.tr(),
            ),
            verticalSpaceSmall(context),
          ],
        ),
      ),
    );
  }

  void showFilterModal(BuildContext context, SocialTradingViewModel vm) {
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
}
