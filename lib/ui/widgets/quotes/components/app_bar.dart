// ignore_for_file: deprecated_member_use

import 'dart:io';

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
    toolbarHeight: 70,
    backgroundColor: isDarkMode
        ? const Color(0xff052844)
        : Theme.of(context).scaffoldBackgroundColor,
    automaticallyImplyLeading: false,
    leading: model.quotesPageEnum == QuotesPageEnum.markets ||
            model.quotesPageEnum == QuotesPageEnum.favorites
        ? QuotesPopUpMenu(
            model: model,
          )
        : IconButton(
            icon: Icon(
              Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            onPressed: () {
              if (model.quotesPageEnum == QuotesPageEnum.details) {
                model.setQuotesPageEnum = QuotesPageEnum.search;
              } else if (model.quotesPageEnum == QuotesPageEnum.edit) {
                model.setQuotesPageEnum = QuotesPageEnum.markets;
              } else if (model.quotesPageEnum == QuotesPageEnum.subGroups) {
                model.setQuotesPageEnum = QuotesPageEnum.search;
              } else if (model.quotesPageEnum == QuotesPageEnum.search) {
                model.setQuotesPageEnum = QuotesPageEnum.markets;
              } else {
                model.goBack();
              }
            }),
    centerTitle: model.quotesPageEnum == QuotesPageEnum.markets ||
            model.quotesPageEnum == QuotesPageEnum.favorites ||
            model.quotesPageEnum == QuotesPageEnum.edit
        ? true
        : false,
    title: model.quotesPageEnum == QuotesPageEnum.search ||
            model.quotesPageEnum == QuotesPageEnum.details ||
            model.quotesPageEnum == QuotesPageEnum.subGroups
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
            width: 160,
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
                    style: model.quotesPageEnum == QuotesPageEnum.markets ||
                            model.quotesPageEnum == QuotesPageEnum.edit
                        ? ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          )
                        : null,
                    onPressed: () {
                      model.setQuotesPageEnum = QuotesPageEnum.markets;
                    },
                    child: Text(
                      'Markets',
                      style: CustomThemeData.generateStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TextButton(
                    style: model.quotesPageEnum == QuotesPageEnum.favorites
                        ? ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          )
                        : null,
                    onPressed: () {
                      model.setQuotesPageEnum = QuotesPageEnum.favorites;
                    },
                    child: Text(
                      'Favorites',
                      style: CustomThemeData.generateStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     model.setQuotesPageEnum = QuotesPageEnum.favorites;
                  //   },
                  //   child: Container(
                  //     padding: EdgeInsets.symmetric(
                  //         horizontal: 8.pWidth(context),
                  //         vertical: 2.pHeight(context)),
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(12),
                  //         color:
                  //             (model.quotesPageEnum == QuotesPageEnum.favorites)
                  //                 ? Color(0xff47B0F5)
                  //                 : null),
                  //     child: Text(
                  //       "Favorites",
                  //       style: CustomThemeData.generateColoredStyle(
                  //           darkTextColor:
                  //               (model.quotesPageEnum == QuotesPageEnum.favorites)
                  //                   ? Color(0xff101828)
                  //                   : Color(0xffE4E7EC),
                  //           lightTextColor:
                  //               (model.quotesPageEnum == QuotesPageEnum.favorites)
                  //                   ? Color(0xffFCFCFD)
                  //                   : Color(0xffE4E7EC),
                  //           fontSize: 12,
                  //           context: context),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
    actions: [
      model.quotesPageEnum == QuotesPageEnum.search ||
              model.quotesPageEnum == QuotesPageEnum.details
          ? const SizedBox()
          : Padding(
              padding: EdgeInsets.only(right: 24.pWidth(context)),
              child: Row(
                children: [
                  model.quotesPageEnum == QuotesPageEnum.edit
                      ? const SizedBox()
                      : InkWell(
                          onTap: () {
                            model.setQuotesPageEnum = QuotesPageEnum.search;
                          },
                          child: SvgPicture.asset(
                            AssetManager.search,
                            color: const Color(0xff98A2B3),
                          ),
                        ),
                  SizedBox(
                    width: 24.pWidth(context),
                  ),
                  InkWell(
                    onTap: () {
                      model.setQuotesPageEnum = QuotesPageEnum.edit;
                    },
                    child: SvgPicture.asset(
                      AssetManager.edit,
                      color: const Color(0xff98A2B3),
                    ),
                  ),
                ],
              ),
            )
    ],
  );
}
