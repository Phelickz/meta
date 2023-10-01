import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';
import 'package:meta_trader/ui/widgets/appbar.dart';

import '../../../generated/locale_keys.g.dart';

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

  final openSummaryTabSelectedNotifier = ValueNotifier(0);
  final closedSummaryTabSelectedNotifier = ValueNotifier(0);
  final performanceSummaryTabSelectedNotifier = ValueNotifier(0);
  final overviewSummaryTabSelectedNotifier = ValueNotifier(0);

  List<int> _stars = [];
  List<int> get stars => _stars;

  void addStar(int val) {
    _stars.add(val);
    rebuildUi();
  }

  void removeStar(int val) {
    _stars.remove(val);
    rebuildUi();
  }

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
      // case PriceSentimentPageEnum.details:
      //   return globalAppBar(
      //     context,
      //     selectedPrice,
      //     'Price sentiments',
      //     () {
      //       setPriceSentimentPageEnum = PriceSentimentPageEnum.home;
      //     },
      //     [
      //       IconButton(
      //         padding: EdgeInsets.zero,
      //         onPressed: () {},
      //         icon: Icon(
      //           Icons.star,
      //           size: 27,
      //           color: isDarkMode ? Colors.white70 : Colors.amber,
      //         ),
      //       ),
      //       horizontalSpaceSmall(context),
      //     ],
      //   );
      case PriceSentimentPageEnum.search:
        return globalAppBar(
          context,
          LocaleKeys.views_priceSentiments_marketSentiments.tr(),
          LocaleKeys.views_priceSentiments_sentimentsAcrossM.tr(),
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
              Navigator.pop(context);
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
                      LocaleKeys.sentiments.tr(),
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
                      LocaleKeys.favorites,
                      style: CustomThemeData.generateStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ).tr(),
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

  List<ActivityChartData> activityChartData = [
    ActivityChartData('22 Jun', 1300),
    ActivityChartData('23 Jun', 1400),
    ActivityChartData('24 Jun', 1500),
    ActivityChartData('25 Jun', 1600),
    ActivityChartData('26 Jun', 1460),
    ActivityChartData('27 Jun', 1300),
    ActivityChartData('29 Jun', 1500),
  ];
}
