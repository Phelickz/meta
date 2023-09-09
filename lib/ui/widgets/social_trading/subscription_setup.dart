import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/textfields/label_text_field.dart';
import 'package:meta_trader/ui/widgets/trade/components/plus_minus_text.dart';

class SubscriptionSetupPage extends StatelessWidget {
  final SocialTradingViewModel viewModel;
  const SubscriptionSetupPage({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: McGyver.rsDoubleW(context, 5),
        ),
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
                          "Commission",
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.4),
                            fontWeight: FontWeight.w500,
                            color: isDarkMode
                                ? const Color(0xFF98A2B3)
                                : const Color(0xFF667085),
                          ),
                        ),
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
                          "Equity",
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.4),
                            fontWeight: FontWeight.w500,
                            color: isDarkMode
                                ? const Color(0xFF98A2B3)
                                : const Color(0xFF667085),
                          ),
                        ),
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
            verticalSpaceXSmall(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Funds In Wallet:",
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.6),
                    fontWeight: FontWeight.w500,
                    color: isDarkMode
                        ? const Color(0xFF98A2B3)
                        : const Color(0xFF667085),
                  ),
                ),
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
                        "Copy Proportion",
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 1.9),
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? const Color(0xFFFFFFFF)
                              : const Color(0xFF475467),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          viewModel.isCustomCopyProportionNotifier.value =
                              !viewModel.isCustomCopyProportionNotifier.value;
                        },
                        child: ValueListenableBuilder<bool>(
                          valueListenable:
                              viewModel.isCustomCopyProportionNotifier,
                          builder: (context, isCustom, child) => Text(
                            isCustom ? "Custom" : "Default",
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
                                        height: McGyver.rsDoubleH(context, 9),
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
                                                      : const Color(0xFF475467),
                                                ),
                                              ),
                                              const SizedBox(height: 7),
                                              Text(
                                                "\$${item["amount"]} required",
                                                style: CustomThemeData
                                                    .generateStyle(
                                                  fontSize: McGyver.textSize(
                                                      context, 1.4),
                                                  fontWeight: FontWeight.normal,
                                                  color: isDarkMode
                                                      ? const Color(0xFFFFFFFF)
                                                      : const Color(0xFF475467),
                                                ),
                                              ),
                                              const SizedBox(height: 3),
                                              Text(
                                                "${item["volume"]}x trade volume",
                                                style: CustomThemeData
                                                    .generateStyle(
                                                  fontSize: McGyver.textSize(
                                                      context, 1.3),
                                                  fontWeight: FontWeight.w500,
                                                  color: isDarkMode
                                                      ? const Color(0xFF98A2B3)
                                                      : const Color(0xFF667085),
                                                ),
                                              ),
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
                            label: "Enter value",
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
                          "Add Support Funds",
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.8),
                            fontWeight: FontWeight.w500,
                            color: isDarkMode
                                ? const Color(0xFFD0D5DD)
                                : const Color(0xFF667085),
                          ),
                        ),
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
                                    : const Color(0xFFE4E7EC),
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
                                  const LabelTextField(
                                    label: "Support amount",
                                    hintText: "Enter amount",
                                    keyboardType: TextInputType.number,
                                    hasSmallMargin: true,
                                  ),
                                  Text(
                                    "55% of the required investment",
                                    textAlign: TextAlign.start,
                                    style: CustomThemeData.generateStyle(
                                      fontSize: McGyver.textSize(context, 1.3),
                                      fontWeight: FontWeight.normal,
                                      color: isDarkMode
                                          ? const Color(0xFF47B0F5)
                                          : const Color(0xFF20A0F3),
                                    ),
                                  ),
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
                    "Support funds protect your business from unexpected market movements",
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.4),
                      fontWeight: FontWeight.w500,
                      color: isDarkMode
                          ? const Color(0xFF98A2B3)
                          : const Color(0xFF667085),
                    ),
                  ),
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
                        "Summary",
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 1.9),
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? const Color(0xFFFFFFFF)
                              : const Color(0xFF475467),
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceSmall(context),
                  ValueListenableBuilder<int>(
                    valueListenable: viewModel.selectedCopyProportionNotifier,
                    builder: (context, selectedIndex, child) => _twotext(
                      context,
                      "Copy proportion:",
                      "${viewModel.copyProportions[selectedIndex]["title"]}",
                    ),
                  ),
                  verticalSpaceXSmall(context),
                  _twotext(context, "Required Investment", "\$26.00"),
                  verticalSpaceXSmall(context),
                  _twotext(context, "Support Funds:", "\$0.00"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Risk Score:",
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
                              text: 'Risk score: ',
                              style: CustomThemeData.generateStyle(
                                fontSize: 10,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: ' MEDIUM',
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
              onTap: () {},
              text: "Start Copying",
            ),
            verticalSpaceSmall(context),
          ],
        ),
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
}
