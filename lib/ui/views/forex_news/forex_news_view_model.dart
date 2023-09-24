// ignore_for_file: prefer_final_fields

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/appbar.dart';

enum ForexNewsViewEnum {
  all,
  currencyPairs,
  metals,
  cryptoCurrency,
  search,
  details;

  // String get label {
  //   switch (this) {
  //     case ForexNewsViewEnum.all:
  //       return '';

  //   }
  // }
}

class ForexNewsViewModel extends CustomBaseViewModel {
  ForexNewsViewEnum _forexNewsViewEnum = ForexNewsViewEnum.all;
  ForexNewsViewEnum get forexNewsViewEnum => _forexNewsViewEnum;

  bool _isTyping = false;
  bool get isTyping => _isTyping;

  TextEditingController _brokerSearchController = TextEditingController();
  TextEditingController get brokerSearchController => _brokerSearchController;

  set setTyping(bool val) {
    _isTyping = val;
    rebuildUi();
  }

  set setForexNewsViewEnum(ForexNewsViewEnum e) {
    _forexNewsViewEnum = e;
    rebuildUi();
  }

  AppBar? returnAppbar(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    switch (_forexNewsViewEnum) {
      case ForexNewsViewEnum.all:
        return globalAppBar(
          context,
          LocaleKeys.forexNews.tr(),
          '',
          () {
            Navigator.pop(context);
          },
          [
            IconButton(
              onPressed: () {
                setForexNewsViewEnum = ForexNewsViewEnum.search;
              },
              icon: Icon(
                Icons.search_outlined,
                color: isDarkMode ? Colors.white : Colors.black54,
              ),
            )
          ],
        );
      case ForexNewsViewEnum.currencyPairs:
        return globalAppBar(context, LocaleKeys.forexNews.tr(), '', () {
          //  Navigator.pop(context);
          Navigator.pop(context);
        }, [
          IconButton(
            onPressed: () {
              setForexNewsViewEnum = ForexNewsViewEnum.search;
            },
            icon: Icon(
              Icons.search_outlined,
              color: isDarkMode ? Colors.white : Colors.black54,
            ),
          )
        ]);
      case ForexNewsViewEnum.metals:
        return globalAppBar(context, LocaleKeys.forexNews.tr(), '', () {
          Navigator.pop(context);
        }, [
          IconButton(
            onPressed: () {
              setForexNewsViewEnum = ForexNewsViewEnum.search;
            },
            icon: Icon(
              Icons.search_outlined,
              color: isDarkMode ? Colors.white : Colors.black54,
            ),
          )
        ]);
      case ForexNewsViewEnum.cryptoCurrency:
        return globalAppBar(context, LocaleKeys.forexNews.tr(), '', () {
          Navigator.pop(context);
        }, [
          IconButton(
            onPressed: () {
              setForexNewsViewEnum = ForexNewsViewEnum.search;
            },
            icon: Icon(
              Icons.search_outlined,
              color: isDarkMode ? Colors.white : Colors.black54,
            ),
          )
        ]);
      case ForexNewsViewEnum.search:
        return globalAppBar(context, LocaleKeys.forexNews.tr(),
            LocaleKeys.views_forexNews_forexNewsView_exploreForex.tr(), () {
          setForexNewsViewEnum = ForexNewsViewEnum.all;
        }, []);
      case ForexNewsViewEnum.details:
        return globalAppBar(context, LocaleKeys.forexNews.tr(), '', () {
          setForexNewsViewEnum = ForexNewsViewEnum.all;
        }, []);

      default:
        return null;
    }
  }
}
