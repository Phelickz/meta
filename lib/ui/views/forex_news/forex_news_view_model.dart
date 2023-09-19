// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/widgets/appbar.dart';

enum ForexNewsViewEnum {
  all,
  currencyPairs,
  metals,
  cryptoCurrency,
  search,
  details
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
          'Forex News',
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
        return globalAppBar(context, 'Forex News', '', () {
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
        return globalAppBar(context, 'Forex News', '', () {
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
        return globalAppBar(context, 'Forex News', '', () {
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
        return globalAppBar(
            context, 'Forex News', 'Explore Forex news across the world', () {
          setForexNewsViewEnum = ForexNewsViewEnum.all;
        }, []);
      case ForexNewsViewEnum.details:
        return globalAppBar(context, 'Forex News', '', () {
          setForexNewsViewEnum = ForexNewsViewEnum.all;
        }, []);

      default:
        return null;
    }
  }
}
