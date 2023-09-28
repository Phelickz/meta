import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/provider/provider_view_model.dart';
import 'package:meta_trader/ui/widgets/provider/components/custom_provider_tab.dart';

class Psummary2 extends StatelessWidget {
  final ProviderViewModel viewModel;
  const Psummary2({super.key, required this.viewModel});

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
              : const Color(0xFFFAFDFF),
          border: Border.all(
            color: viewModel.isDarkMode()
                ? Colors.transparent
                : const Color(0xFFE4E7EC),
          )),
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
              ),
              const Spacer(),
              CustomProviderTab(
                  firstTabName: "1W",
                  secondTabName: "2W",
                  thirdTabName: "1M",
                  fourthTabName: "3M",
                  fifthTabName: "6M",
                  tabIndex: viewModel.summaryTwoTabSelectorNotifier.value,
                  onSelectTab: (val) {
                    viewModel.summaryTwoTabSelectorNotifier.value = val;
                  })
            ],
          ),
          // SizedBox(height: 48.pHeight(context),),
          Expanded(
            child: ValueListenableBuilder<int>(
                valueListenable: viewModel.summaryTwoTabSelectorNotifier,
                builder: (context, index, _) {
                  return IndexedStack(
                    index: index,
                    children: [
                      summaryContainer("0", "0", "0", "0", "1", "0", 0.23),
                      summaryContainer("10", "5", "1", "9", "222", "9", 0.45),
                      summaryContainer("0", "0", "0", "0", "1", "0", 0.7),
                      summaryContainer("0", "0", "0", "0", "1", "0", 0.9),
                      summaryContainer("0", "0", "0", "0", "1", "0", 0.5),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget summaryContainer(String successRate, String gain, String riskScore,
      String balance, String profit, String loss, double percentage) {
    return Builder(builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: quickContainer(LocaleKeys.home_higherSuccessRates,
                      "$successRate%", context)),
              Expanded(
                  child: quickContainer(LocaleKeys.gain, "$gain%", context)),
              Expanded(
                  child: quickContainer(
                      LocaleKeys.home_higherSuccessRates_riskScore,
                      "$riskScore / 10",
                      context)),
            ],
          ),
          Row(
            children: [
              Text(
                LocaleKeys.balance,
                style: CustomThemeData.generateColoredStyle(
                    fontSize: 12,
                    context: context,
                    fontWeight: FontWeight.w400),
              ),
              const Spacer(),
              Text(
                balance,
                style: CustomThemeData.generateColoredStyle(
                    fontSize: 14,
                    context: context,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.profit,
                    style: CustomThemeData.generateColoredStyle(
                        fontSize: 12,
                        context: context,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8.pHeight(context),
                  ),
                  Text(
                    "\$$profit",
                    style: CustomThemeData.generateColoredStyle(
                        fontSize: 14,
                        context: context,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    LocaleKeys.loss,
                    style: CustomThemeData.generateColoredStyle(
                        fontSize: 12,
                        context: context,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8.pHeight(context),
                  ),
                  Text(
                    "\$$loss",
                    style: CustomThemeData.generateColoredStyle(
                        fontSize: 14,
                        context: context,
                        fontWeight: FontWeight.w600),
                  )
                ],
              )
            ],
          ),
          LinearProgressIndicator(
            backgroundColor: const Color(0xFFF04438),
            color: const Color(0xFF47B0F5),
            value: percentage,
            minHeight: 10.pHeight(context),
          )
        ],
      );
    });
  }

  Widget quickContainer(String title, String subTitle, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.pWidth(context)),
      padding: EdgeInsets.symmetric(
          vertical: 8.pHeight(context), horizontal: 8.pWidth(context)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: viewModel.isDarkMode()
              ? ColorManager.darkHeaderColor
              : const Color(0xFFECF7FE),
          border: Border.all(
            color: viewModel.isDarkMode()
                ? Colors.transparent
                : const Color(0xFFE4E7EC),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: CustomThemeData.generateColoredStyle(
                fontSize: 12, context: context, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 8.pHeight(context),
          ),
          Text(subTitle,
              style: CustomThemeData.generateColoredStyle(
                  fontSize: 14, context: context, fontWeight: FontWeight.w600))
        ],
      ),
    );
  }
}
