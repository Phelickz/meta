// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/quotes/quotes_view_model.dart';

class QuotesPopUpMenu extends StatelessWidget {
  final QuotesViewModel model;
  const QuotesPopUpMenu({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return PopupMenuButton(
      color: Theme.of(context).scaffoldBackgroundColor,
      icon: SvgPicture.asset(
        AssetManager.options,
        color: isDarkMode ? Colors.white60 : Colors.black45,
      ),
      itemBuilder: (context) {
        return <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: LocaleKeys.simpleView.tr(),
            child: Row(
              children: [
                SvgPicture.asset(AssetManager.simpleQuoteIcon),
                SizedBox(
                  width: 12.pWidth(context),
                ),
                Text(
                  LocaleKeys.simpleView,
                  style: CustomThemeData.generateColoredStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      context: context),
                ).tr(),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: LocaleKeys.advancedView.tr(),
            child: Row(
              children: [
                SvgPicture.asset(AssetManager.advancedQuoteIcon),
                SizedBox(
                  width: 12.pWidth(context),
                ),
                Text(
                  LocaleKeys.advancedView,
                  style: CustomThemeData.generateColoredStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      context: context),
                ).tr(),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: LocaleKeys.modernView.tr(),
            child: Row(
              children: [
                SvgPicture.asset(AssetManager.modernQuoteIcon),
                SizedBox(
                  width: 12.pWidth(context),
                ),
                Text(
                  LocaleKeys.modernView,
                  style: CustomThemeData.generateColoredStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      context: context),
                ).tr(),
              ],
            ),
          ),
        ];
      },
      onSelected: (String value) {
        if (value == LocaleKeys.simpleView.tr()) {
          model.setMarketViewEnum = MarketViewEnum.simpleView;
          model.setQuotesPageEnum = QuotesPageEnum.markets;
        }
        if (value == LocaleKeys.modernView.tr()) {
          model.setMarketViewEnum = MarketViewEnum.modernView;
          model.setQuotesPageEnum = QuotesPageEnum.markets;
        }
        if (value == LocaleKeys.advancedView.tr()) {
          model.setMarketViewEnum = MarketViewEnum.advancedView;
          model.setQuotesPageEnum = QuotesPageEnum.markets;
        }
      },
    );
  }
}
