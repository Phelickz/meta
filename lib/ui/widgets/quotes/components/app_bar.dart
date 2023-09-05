import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/ui/widgets/quotes/components/pop_up_menu.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/utils/asset_manager.dart';
import '../../../../app/utils/theme.dart';
import '../../../views/quotes/quotes_view_model.dart';

AppBar quotesAppBar(BuildContext context, String title, String subtitle,
    QuotesViewModel model) {
  var isDarkMode = CustomThemeData.isDarkMode(context);
  return AppBar(
    elevation: 0,
    backgroundColor: isDarkMode
        ? const Color(0xff052844)
        : Theme.of(context).scaffoldBackgroundColor,
    automaticallyImplyLeading: false,
    leading: QuotesPopUpMenu(
      model: model,
    ),
    centerTitle: false,
    title: model.quotesPageEnum == QuotesPageEnum.search ||
            model.quotesPageEnum == QuotesPageEnum.details
        ? Column(
            children: [
              Text(
                title,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2),
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.5),
                  color: isDarkMode ? Colors.white54 : const Color(0xff667085),
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          )
        : Container(
            width: 160.pWidth(context),
            padding: EdgeInsets.symmetric(
                horizontal: 8.pWidth(context), vertical: 8.pHeight(context)),
            decoration: BoxDecoration(
                color: Color(0xff1D2939),
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    model.setQuotesPageEnum = QuotesPageEnum.markets;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.pWidth(context),
                        vertical: 2.pHeight(context)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color:
                            (model.quotesPageEnum == QuotesPageEnum.markets ||
                                    model.quotesPageEnum == QuotesPageEnum.edit)
                                ? Color(0xff47B0F5)
                                : null),
                    child: Text(
                      "Markets",
                      style: CustomThemeData.generateColoredStyle(
                          darkTextColor:
                              (model.quotesPageEnum == QuotesPageEnum.markets)
                                  ? Color(0xff101828)
                                  : Color(0xffE4E7EC),
                          lightTextColor:
                              (model.quotesPageEnum == QuotesPageEnum.markets)
                                  ? Color(0xffFCFCFD)
                                  : Color(0xffE4E7EC),
                          fontSize: 12,
                          context: context),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    model.setQuotesPageEnum = QuotesPageEnum.favorites;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.pWidth(context),
                        vertical: 2.pHeight(context)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color:
                            (model.quotesPageEnum == QuotesPageEnum.favorites)
                                ? Color(0xff47B0F5)
                                : null),
                    child: Text(
                      "Favorites",
                      style: CustomThemeData.generateColoredStyle(
                          darkTextColor:
                              (model.quotesPageEnum == QuotesPageEnum.favorites)
                                  ? Color(0xff101828)
                                  : Color(0xffE4E7EC),
                          lightTextColor:
                              (model.quotesPageEnum == QuotesPageEnum.favorites)
                                  ? Color(0xffFCFCFD)
                                  : Color(0xffE4E7EC),
                          fontSize: 12,
                          context: context),
                    ),
                  ),
                )
              ],
            ),
          ),
    actions: [
      model.quotesPageEnum == QuotesPageEnum.search
          ? SizedBox()
          : Padding(
              padding: EdgeInsets.only(right: 24.pWidth(context)),
              child: Row(
                children: [
                  model.quotesPageEnum == QuotesPageEnum.edit
                      ? SizedBox()
                      : InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(
                            AssetManager.search,
                            color: Color(0xff98A2B3),
                          ),
                        ),
                  SizedBox(
                    width: 24.pWidth(context),
                  ),
                  InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      AssetManager.edit,
                      color: Color(0xff98A2B3),
                    ),
                  ),
                ],
              ),
            )
    ],
  );
}
