import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/provider/provider_view_model.dart';
import 'package:meta_trader/ui/widgets/provider/components/custom_provider_tab.dart';

class Psummary extends StatelessWidget {
  final ProviderViewModel viewModel;
  const Psummary({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 239.pHeight(context),
      width: 327.pWidth(context),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: viewModel.isDarkMode()
            ? ColorManager.darkHeaderColor
            : const Color(0xFFECF7FE),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                LocaleKeys.summary,
                style: CustomThemeData.generateColoredStyle(
                    fontSize: 16,
                    context: context,
                    fontWeight: FontWeight.w600),
              ).tr(),
              const Spacer(),
              CustomProviderTab(
                  firstTabName: "1W",
                  secondTabName: "2W",
                  thirdTabName: "1M",
                  fourthTabName: "3M",
                  fifthTabName: "6M",
                  tabIndex: viewModel.summaryOneTabSelectorNotifier.value,
                  onSelectTab: (val) {
                    viewModel.summaryOneTabSelectorNotifier.value = val;
                  })
            ],
          ),
          SizedBox(
            height: 8.pHeight(context),
          ),
          InkWell(
            onTap: () {
              // viewModel.setProviderPageEnum = ProviderPageEnum.followers;
              viewModel.push(ProviderFollowerPage(viewModel: viewModel));
            },
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: 6.pHeight(context),
                    horizontal: 10.pWidth(context)),
                decoration: BoxDecoration(
                    color: const Color(0xFF0C95EF),
                    borderRadius: BorderRadius.circular(12)),
                child: Text(
                  LocaleKeys
                      .providerWidget_providerComponent_pSummary_viewFollowers
                      .tr(),
                  style: CustomThemeData.generateColoredStyle(
                      fontSize: 12,
                      context: context,
                      fontWeight: FontWeight.w400,
                      lightTextColor: const Color(0xFFFCFCFD),
                      darkTextColor: const Color(0xFFFCFCFD)),
                ),
              ),
            ),
          ),
          // SizedBox(height: 48.pHeight(context),),
          // const Spacer(),
          Expanded(
            child: ValueListenableBuilder<int>(
                valueListenable: viewModel.summaryOneTabSelectorNotifier,
                builder: (context, index, _) {
                  return IndexedStack(
                    index: index,
                    children: [
                      summaryContainer("0", "0", "0", "0", "1", "0"),
                      summaryContainer("10", "5", "1", "9", "222", "9"),
                      summaryContainer("0", "0", "0", "0", "1", "0"),
                      summaryContainer("0", "0", "0", "0", "1", "0"),
                      summaryContainer("0", "0", "0", "0", "1", "0"),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget summaryContainer(String auto, String fixed, String reverse, String fee,
      String active, String inActive) {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Text(
                LocaleKeys
                    .providerWidget_providerComponent_pSummary_followersAutoScale,
                style: CustomThemeData.generateColoredStyle(
                    fontSize: 12,
                    context: context,
                    fontWeight: FontWeight.w400),
              ).tr(),
              const Spacer(),
              Text(
                auto,
                style: CustomThemeData.generateColoredStyle(
                    fontSize: 14,
                    context: context,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Row(
            children: [
              Text(
                LocaleKeys
                    .providerWidget_providerComponent_pSummary_followersFixedLot,
                style: CustomThemeData.generateColoredStyle(
                    fontSize: 12,
                    context: context,
                    fontWeight: FontWeight.w400),
              ).tr(),
              const Spacer(),
              Text(
                fixed,
                style: CustomThemeData.generateColoredStyle(
                    fontSize: 14,
                    context: context,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Row(
            children: [
              Text(
                LocaleKeys
                    .providerWidget_providerComponent_pSummary_followersReverse,
                style: CustomThemeData.generateColoredStyle(
                    fontSize: 12,
                    context: context,
                    fontWeight: FontWeight.w400),
              ).tr(),
              const Spacer(),
              Text(
                reverse,
                style: CustomThemeData.generateColoredStyle(
                    fontSize: 14,
                    context: context,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Row(
            children: [
              Text(
                LocaleKeys
                    .providerWidget_providerComponent_pSummary_performanceFee,
                style: CustomThemeData.generateColoredStyle(
                    fontSize: 12,
                    context: context,
                    fontWeight: FontWeight.w400),
              ).tr(),
              const Spacer(),
              Text(
                "$fee%",
                style: CustomThemeData.generateColoredStyle(
                    fontSize: 14,
                    context: context,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.status,
                style: CustomThemeData.generateColoredStyle(
                    fontSize: 12,
                    context: context,
                    fontWeight: FontWeight.w400),
              ).tr(),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.active,
                    style: CustomThemeData.generateColoredStyle(
                        fontSize: 12,
                        context: context,
                        fontWeight: FontWeight.w400),
                  ).tr(),
                  SizedBox(
                    height: 4.pHeight(context),
                  ),
                  Text(
                    active,
                    style: CustomThemeData.generateColoredStyle(
                        fontSize: 14,
                        context: context,
                        fontWeight: FontWeight.w400,
                        darkTextColor: const Color(0xFF47B0F5),
                        lightTextColor: const Color(0xFF47B0F5)),
                  )
                ],
              ),
              SizedBox(
                width: 16.pWidth(context),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.inActive,
                    style: CustomThemeData.generateColoredStyle(
                        fontSize: 12,
                        context: context,
                        fontWeight: FontWeight.w400),
                  ).tr(),
                  SizedBox(
                    height: 4.pHeight(context),
                  ),
                  Text(
                    inActive,
                    style: CustomThemeData.generateColoredStyle(
                        fontSize: 14,
                        context: context,
                        fontWeight: FontWeight.w400,
                        darkTextColor: const Color(0xFF47B0F5),
                        lightTextColor: const Color(0xFF47B0F5)),
                  )
                ],
              ),
            ],
          ),
        ],
      );
    });
  }
}
