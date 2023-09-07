import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';
import 'package:meta_trader/ui/widgets/social_trading/components/filter_modal.dart';

AppBar socialTradingAvatarAppBar(
  BuildContext context,
  SocialTradingViewModel viewModel,
) {
  var isDarkMode = CustomThemeData.isDarkMode(context);
  return AppBar(
    toolbarHeight: 80,
    elevation: 0,
    backgroundColor: isDarkMode
        ? const Color(0xff052844)
        : Theme.of(context).scaffoldBackgroundColor,
    leading: IconButton(
      icon: Icon(
        Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
        color: isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFF667085),
      ),
      onPressed: () {
        if (viewModel.socialTradingPageEnum ==
            SocialTradingPageEnum.copiedTraderPosition) {
          viewModel.setSocialTradingPageEnum = SocialTradingPageEnum.myTrades;
        }
      },
    ),
    title: Row(
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
                )
              ],
            )
          ],
        )
      ],
    ),
    actions: [
      if (viewModel.socialTradingPageEnum ==
          SocialTradingPageEnum.copiedTraderPosition)
        IconButton(
          onPressed: () {
            showFilterModal(context);
          },
          icon: SizedBox(
            height: McGyver.rsDoubleH(context, 2.8),
            width: McGyver.rsDoubleH(context, 2.8),
            child: SvgPicture.asset(
              "assets/icons/briefcase.svg",
              colorFilter: ColorFilter.mode(
                isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFF667085),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      if (viewModel.socialTradingPageEnum ==
          SocialTradingPageEnum.copiedTraderPosition)
        IconButton(
          onPressed: () {
            showFilterModal(context);
          },
          icon: SizedBox(
            height: McGyver.rsDoubleH(context, 2.8),
            width: McGyver.rsDoubleH(context, 2.8),
            child: SvgPicture.asset(
              "assets/icons/close-square.svg",
              colorFilter: ColorFilter.mode(
                isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFF667085),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
    ],
  );
}

AppBar socialTradingDashboardAppBar(
  BuildContext context,
  SocialTradingViewModel viewModel,
) {
  var isDarkMode = CustomThemeData.isDarkMode(context);
  return AppBar(
    centerTitle: true,
    backgroundColor: isDarkMode
        ? const Color(0xff052844)
        : Theme.of(context).scaffoldBackgroundColor,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
        color: isDarkMode ? Colors.white : Colors.black,
      ),
      onPressed: () {
        viewModel.goBack();
      },
    ),
    actions: [
      IconButton(
        onPressed: () {
          viewModel.setSocialTradingPageEnum = SocialTradingPageEnum.menuMain;
        },
        icon: Icon(
          Icons.menu,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      )
    ],
    title: Container(
      width: McGyver.rsDoubleW(context, 53),
      height: 46,
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF0C2031) : const Color(0xff073961),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => viewModel.setSocialTradingPageEnum =
                  SocialTradingPageEnum.masterTraders,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: viewModel.socialTradingPageEnum ==
                        SocialTradingPageEnum.masterTraders
                    ? BoxDecoration(
                        color: isDarkMode
                            ? const Color(0xFF47B0F5)
                            : const Color(0xff20A0F3),
                        borderRadius: BorderRadius.circular(16),
                      )
                    : null,
                child: Text(
                  'Master Traders',
                  style: CustomThemeData.generateStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: viewModel.socialTradingPageEnum ==
                            SocialTradingPageEnum.masterTraders
                        ? const Color(0xFF101828)
                        : Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            InkWell(
              onTap: () => viewModel.setSocialTradingPageEnum =
                  SocialTradingPageEnum.myTrades,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: viewModel.socialTradingPageEnum ==
                        SocialTradingPageEnum.myTrades
                    ? BoxDecoration(
                        color: isDarkMode
                            ? const Color(0xFF47B0F5)
                            : const Color(0xff20A0F3),
                        borderRadius: BorderRadius.circular(16),
                      )
                    : null,
                child: Text(
                  'My Trades',
                  style: CustomThemeData.generateStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: viewModel.socialTradingPageEnum ==
                            SocialTradingPageEnum.myTrades
                        ? isDarkMode
                            ? const Color(0xFF101828)
                            : Colors.white
                        : Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

AppBar socialTradingMenuAppBar(BuildContext context, String title,
    String subtitle, SocialTradingViewModel viewModel,
    [String assetName = '']) {
  var isDarkMode = CustomThemeData.isDarkMode(context);
  return AppBar(
    elevation: 0,
    backgroundColor:
        viewModel.socialTradingPageEnum == SocialTradingPageEnum.wallet
            ? isDarkMode
                ? const Color(0xff052844)
                : const Color(0xFF20A0F3)
            : isDarkMode
                ? const Color(0xff052844)
                : Theme.of(context).scaffoldBackgroundColor,
    automaticallyImplyLeading: false,
    leading: IconButton(
        icon: Icon(
          Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
          color: viewModel.socialTradingPageEnum == SocialTradingPageEnum.wallet
              ? isDarkMode
                  ? const Color(0xFFD0D5DD)
                  : const Color(0xFFF5FBFE)
              : isDarkMode
                  ? const Color(0xFFD0D5DD)
                  : const Color(0xFF344054),
        ),
        onPressed: () {
          if (viewModel.socialTradingPageEnum ==
              SocialTradingPageEnum.menuMain) {
            viewModel.setSocialTradingPageEnum =
                SocialTradingPageEnum.masterTraders;
          }

          if (viewModel.socialTradingPageEnum == SocialTradingPageEnum.wallet) {
            viewModel.setSocialTradingPageEnum = SocialTradingPageEnum.menuMain;
          }

          if (viewModel.socialTradingPageEnum ==
              SocialTradingPageEnum.notification) {
            viewModel.setSocialTradingPageEnum = SocialTradingPageEnum.menuMain;
          }
          if (viewModel.socialTradingPageEnum ==
              SocialTradingPageEnum.transactionHistory) {
            viewModel.setSocialTradingPageEnum = SocialTradingPageEnum.wallet;
          }
          if (viewModel.socialTradingPageEnum ==
              SocialTradingPageEnum.transactionDetails) {
            viewModel.setSocialTradingPageEnum =
                SocialTradingPageEnum.transactionHistory;
          }
        }),
    centerTitle: false,
    title: Text(
      title,
      style: CustomThemeData.generateStyle(
        fontSize: McGyver.textSize(context, 2),
        color: viewModel.socialTradingPageEnum == SocialTradingPageEnum.wallet
            ? isDarkMode
                ? const Color(0xFFD0D5DD)
                : const Color(0xFFF5FBFE)
            : isDarkMode
                ? const Color(0xFFD0D5DD)
                : const Color(0xFF344054),
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: [
      if (assetName != '')
        IconButton(
          onPressed: () {
            showFilterModal(context);
          },
          icon: SizedBox(
            height: McGyver.rsDoubleH(context, 2.8),
            width: McGyver.rsDoubleH(context, 2.8),
            child: SvgPicture.asset(
              assetName,
              colorFilter: ColorFilter.mode(
                isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFF667085),
                BlendMode.srcIn,
              ),
            ),
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
        return const FilterTransactionModal();
      });
}
