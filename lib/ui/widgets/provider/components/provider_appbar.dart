import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/provider/provider_view_model.dart';
import 'package:meta_trader/ui/widgets/provider/components/profile_bar.dart';
import 'package:meta_trader/ui/widgets/provider/components/wallet_balance_container.dart';

import '../../../../app/responsiveness/res.dart';

class ProviderAppbar {
  static AppBar simpleAppBar(ProviderViewModel model, BuildContext context,
      String title, String subTitle, bool hasSubtitle, Widget? icon) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 67,
      backgroundColor: model.isDarkMode()
          ? ColorManager.darkHeaderColor
          : Theme.of(context).scaffoldBackgroundColor,
      automaticallyImplyLeading: false,
      leading: IconButton(
          icon: Icon(
            Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
            color: model.isDarkMode() ? const Color(0xffD2D2D2) : Colors.black,
          ),
          onPressed: () {
            if (model.providerPageEnum == ProviderPageEnum.notifications ||
                model.providerPageEnum == ProviderPageEnum.profileSettings) {
              model.setProviderPageEnum = ProviderPageEnum.options;
            } else if (model.providerPageEnum == ProviderPageEnum.followers) {
              model.setProviderPageEnum = ProviderPageEnum.dashboard;
            } else {
              Navigator.pop(context);
            }
            // Navigator.pop(context);
          }),
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: CustomThemeData.generateColoredStyle(
                fontSize: 18, context: context, fontWeight: FontWeight.w600),
          ),
          hasSubtitle
              ? SizedBox(
                  height: 4.pHeight(context),
                )
              : Container(),
          hasSubtitle
              ? Text(
                  subTitle,
                  style: CustomThemeData.generateColoredStyle(
                      fontSize: 14,
                      context: context,
                      fontWeight: FontWeight.w400),
                )
              : const SizedBox(),
        ],
      ),
      actions: [icon ?? const SizedBox()],
    );
  }

  static AppBar appBarTwo(
    ProviderViewModel model,
    BuildContext context,
  ) {
    return AppBar(
      elevation: 0,
      backgroundColor: model.isDarkMode()
          ? ColorManager.darkHeaderColor
          : Theme.of(context).scaffoldBackgroundColor,
      leading: IconButton(
          icon: Icon(
            Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
            color: model.isDarkMode() ? const Color(0xffD2D2D2) : Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      centerTitle: true,
      title: Container(
        width: 180,
        height: 46,
        decoration: BoxDecoration(
          color: const Color(0xff1D2939),
          borderRadius: BorderRadius.circular(60),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: model.overviewTabSelectedNotifier.value == 0
                    ? ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      )
                    : null,
                onPressed: () => model.setTabNotifiier(0),
                child: Text(
                  'Overview',
                  style: CustomThemeData.generateStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ),
              TextButton(
                style: model.overviewTabSelectedNotifier.value == 1
                    ? ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      )
                    : null,
                onPressed: () => model.setTabNotifiier(1),
                child: Text(
                  'Trade History',
                  style: CustomThemeData.generateStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottom: PreferredSize(
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: ProfileBar(
              name: "Adenuga Kolade",
              job: "Flutter Developer",
              nationality: "NGR"),
        ),
        preferredSize: Size.fromHeight(
          60.pHeight(context),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {
              model.setProviderPageEnum = ProviderPageEnum.options;
            },
            icon: Icon(
              Icons.menu,
              color: model.isDarkMode() ? Colors.white : Colors.black,
            ))
      ],
    );
  }

  static walletAppBar(BuildContext context, String title, String subtitle,
      ProviderViewModel viewModel,
      [String assetName = '']) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return AppBar(
      elevation: 0,
      backgroundColor:
          isDarkMode ? const Color(0xff052844) : const Color(0xFF20A0F3),
      automaticallyImplyLeading: false,
      leading: IconButton(
          icon: Icon(
              Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
              color: isDarkMode
                  ? const Color(0xFFD0D5DD)
                  : const Color(0xFFF5FBFE)),
          onPressed: () {
            viewModel.setProviderPageEnum = ProviderPageEnum.options;
          }),
      centerTitle: false,
      title: Text(
        title,
        style: CustomThemeData.generateStyle(
          fontSize: McGyver.textSize(context, 2),
          color: isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFFF5FBFE),
          fontWeight: FontWeight.bold,
        ),
      ),
      bottom: PreferredSize(
        child: const WalletBalanceContainer(),
        preferredSize: Size.fromHeight(75.pHeight(context)),
      ),
    );
  }
}
