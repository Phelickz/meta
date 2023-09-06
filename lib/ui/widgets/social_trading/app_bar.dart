import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';
import 'package:meta_trader/ui/widgets/social_trading/components/filter_modal.dart';

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
      width: 210,
      height: 46,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(60),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => viewModel.setSocialTradingPageEnum =
                  SocialTradingPageEnum.masterTraders,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: viewModel.socialTradingPageEnum ==
                        SocialTradingPageEnum.masterTraders
                    ? BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(16),
                      )
                    : null,
                child: Text(
                  'Master Traders',
                  style: CustomThemeData.generateStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => viewModel.setSocialTradingPageEnum =
                  SocialTradingPageEnum.myTrades,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: viewModel.socialTradingPageEnum ==
                        SocialTradingPageEnum.myTrades
                    ? BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(16),
                      )
                    : null,
                child: Text(
                  'My Trades',
                  style: CustomThemeData.generateStyle(
                    fontSize: 13,
                    color: Colors.white,
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
    backgroundColor: isDarkMode
        ? viewModel.socialTradingPageEnum == SocialTradingPageEnum.wallet
            ? const Color(0xff052844)
            : Theme.of(context).scaffoldBackgroundColor
        : const Color(0xFFD3ECFD),
    automaticallyImplyLeading: false,
    leading: IconButton(
        icon: Icon(
          Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
          color: isDarkMode ? const Color(0xffD2D2D2) : Colors.black,
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
        color: isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFF344054),
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
                isDarkMode ? const Color(0xff98A2B3) : const Color(0xFF667085),
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
