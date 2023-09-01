import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/widgets/appbar.dart';

enum PriceTypeEnum { sentiments, favorites }

enum PriceSentimentPageEnum { home, details, search }

class PriceSentimentViewModel extends CustomBaseViewModel {
  PriceTypeEnum _priceTypeEnum = PriceTypeEnum.sentiments;
  PriceTypeEnum get priceTypeEnum => _priceTypeEnum;

  PriceSentimentPageEnum _priceSentimentPageEnum = PriceSentimentPageEnum.home;
  PriceSentimentPageEnum get priceSentimentPageEnum => _priceSentimentPageEnum;

  String _selectedPrice = 'AUDJPY';
  String get selectedPrice => _selectedPrice;

  bool _isTyping = false;
  bool get isTyping => _isTyping;

  // ignore: prefer_final_fields
  TextEditingController _priceSearchController = TextEditingController();
  TextEditingController get priceSearchController => _priceSearchController;

  set setTyping(bool val) {
    _isTyping = val;
    rebuildUi();
  }

  set setPrcieTypeEnum(PriceTypeEnum e) {
    _priceTypeEnum = e;
    rebuildUi();
  }

  set setPriceSentimentPageEnum(PriceSentimentPageEnum e) {
    _priceSentimentPageEnum = e;
    rebuildUi();
  }

  set setSelectedPrice(String e) {
    _selectedPrice = e;
    rebuildUi();
  }

  AppBar? returnAppbar(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    switch (priceSentimentPageEnum) {
      case PriceSentimentPageEnum.details:
        return globalAppBar(
          context,
          selectedPrice,
          'Price sentiments',
          () {
            setPriceSentimentPageEnum = PriceSentimentPageEnum.home;
          },
          [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(
                Icons.star,
                size: 27,
                color: isDarkMode ? Colors.white70 : Colors.amber,
              ),
            ),
            horizontalSpaceSmall(context),
          ],
        );
      case PriceSentimentPageEnum.search:
        return globalAppBar(
          context,
          'Market Sentiments',
          'Sentiments across markets',
          () {
            setPriceSentimentPageEnum = PriceSentimentPageEnum.home;
          },
          [],
        );
      case PriceSentimentPageEnum.home:
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
              goBack();
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                setPriceSentimentPageEnum = PriceSentimentPageEnum.search;
              },
              icon: Icon(
                Icons.search,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            )
          ],
          title: Container(
            width: 180,
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
                  TextButton(
                    style: priceTypeEnum == PriceTypeEnum.sentiments
                        ? ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          )
                        : null,
                    onPressed: () {
                      setPrcieTypeEnum = PriceTypeEnum.sentiments;
                    },
                    child: Text(
                      'Sentiments',
                      style: CustomThemeData.generateStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TextButton(
                    style: priceTypeEnum == PriceTypeEnum.favorites
                        ? ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          )
                        : null,
                    onPressed: () {
                      setPrcieTypeEnum = PriceTypeEnum.favorites;
                    },
                    child: Text(
                      'Favorites',
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
        );
      default:
        return null;
    }
  }
}
