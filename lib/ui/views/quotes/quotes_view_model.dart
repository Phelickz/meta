import 'package:flutter/material.dart';
import 'package:meta_trader/ui/widgets/quotes/advanced_view.dart';
import 'package:meta_trader/ui/widgets/quotes/edit.dart';
import 'package:meta_trader/ui/widgets/quotes/modern_view.dart';
import 'package:meta_trader/ui/widgets/quotes/simple_view.dart';

import '../../../app/core/custom_base_view_model.dart';
import '../../widgets/quotes/components/app_bar.dart';

enum QuotesPageEnum { markets, favorites, search, edit, subGroups, details }

enum MarketViewEnum {
  simpleView,
  modernView,
  advancedView,
}

class QuotesViewModel extends CustomBaseViewModel {
  QuotesViewModel() {
    init();
  }

  Future<void> init() async {}
  MarketViewEnum _marketViewEnum = MarketViewEnum.simpleView;
  MarketViewEnum get marketViewEnum => _marketViewEnum;

  QuotesPageEnum _quotesPageEnum = QuotesPageEnum.markets;
  QuotesPageEnum get quotesPageEnum => _quotesPageEnum;
  List<String> availablePairs = [
    "USDCAD",
    "USDGBP",
    "USDAUD",
    "GBPCAD",
    "NZDCAD",
    "GPBUSD",
    "CADUSD"
  ];
  List<String> selectedOptions = [];

  List quoteList = [
    {
      "percentageChange": "-20%",
      "currencyPair": "USDCAD",
      "spread": "280",
      "time": "12:13:14",
      "pairId": "2980",
      "askingPricePrimary": "63.2",
      "askingPriceSecondary": "23",
      "sellingPricePrimary": "63.2",
      "askingPips": "9",
      "sellingPips": "3",
      "sellingPriceSecondary": "23",
      "low": "63.2018",
      "high": "11.8018"
    },
    {
      "percentageChange": "-20%",
      "currencyPair": "USDCAD",
      "spread": "280",
      "time": "12:13:14",
      "pairId": "2980",
      "askingPricePrimary": "63.2",
      "askingPriceSecondary": "23",
      "sellingPricePrimary": "63.2",
      "askingPips": "9",
      "sellingPips": "3",
      "sellingPriceSecondary": "23",
      "low": "63.2018",
      "high": "11.8018"
    },
    {
      "percentageChange": "-20%",
      "currencyPair": "USDCAD",
      "spread": "280",
      "time": "12:13:14",
      "pairId": "2980",
      "askingPricePrimary": "63.2",
      "askingPriceSecondary": "23",
      "sellingPricePrimary": "63.2",
      "askingPips": "9",
      "sellingPips": "3",
      "sellingPriceSecondary": "23",
      "low": "63.2018",
      "high": "11.8018"
    },
    {
      "percentageChange": "-20%",
      "currencyPair": "USDCAD",
      "spread": "280",
      "time": "12:13:14",
      "pairId": "2980",
      "askingPricePrimary": "63.2",
      "askingPriceSecondary": "23",
      "sellingPricePrimary": "63.2",
      "askingPips": "9",
      "sellingPips": "3",
      "sellingPriceSecondary": "23",
      "low": "63.2018",
      "high": "11.8018"
    },
    {
      "percentageChange": "-20%",
      "currencyPair": "USDCAD",
      "spread": "280",
      "time": "12:13:14",
      "pairId": "2980",
      "askingPricePrimary": "63.2",
      "askingPriceSecondary": "23",
      "sellingPricePrimary": "63.2",
      "askingPips": "9",
      "sellingPips": "3",
      "sellingPriceSecondary": "23",
      "low": "63.2018",
      "high": "11.8018"
    },
    {
      "percentageChange": "-20%",
      "currencyPair": "USDCAD",
      "spread": "280",
      "time": "12:13:14",
      "pairId": "2980",
      "askingPricePrimary": "63.2",
      "askingPriceSecondary": "23",
      "sellingPricePrimary": "63.2",
      "askingPips": "9",
      "sellingPips": "3",
      "sellingPriceSecondary": "23",
      "low": "63.2018",
      "high": "11.8018"
    },
  ];
  bool _isFav = false;
  bool get isFav => _isFav;
  List favQuotes = [];

  void togglePair(String option) {
    if (selectedOptions.contains(option)) {
      selectedOptions.remove(option);
    } else {
      selectedOptions.add(option);
    }
    rebuildUi();
  }

  void toggleFavQuote(Map quote) {
    _isFav = !_isFav;
    if (favQuotes.contains(quote)) {
      favQuotes.remove(quote);
    } else {
      favQuotes.add(quote);
    }
    rebuildUi();
  }

  set setQuotesPageEnum(QuotesPageEnum e) {
    _quotesPageEnum = e;
    rebuildUi();
  }

  set setMarketViewEnum(MarketViewEnum e) {
    _marketViewEnum = e;
    rebuildUi();
  }

  Widget returnPage() {
    switch (_quotesPageEnum) {
      case QuotesPageEnum.markets:
        return AdvancedMarketView(model: this);
      case QuotesPageEnum.edit:
        return EditPage(model: this);
      default:
        return Container();
    }
  }

  Widget returnMarketView() {
    switch (_marketViewEnum) {
      case MarketViewEnum.advancedView:
        return AdvancedMarketView(model: this);
      case MarketViewEnum.modernView:
        return ModernMarketView(model: this);
      case MarketViewEnum.simpleView:
        return SimpleMarketView(model: this);
      default:
        return Container();
    }
  }

  AppBar? returnAppBar(BuildContext context) {
    switch (_quotesPageEnum) {
      case QuotesPageEnum.markets:
        return quotesAppBar(context, "", "", this);
      case QuotesPageEnum.edit:
        return quotesAppBar(context, "", "", this);
      case QuotesPageEnum.search:
        return quotesAppBar(
            context, "Quotes", "Add symbol to market list", this);
      case QuotesPageEnum.subGroups:
        return quotesAppBar(
            context, "Quotes", "Add symbol to market list", this);
      case QuotesPageEnum.details:
        return quotesAppBar(context, "Quotes", "Details", this);
      default:
        return quotesAppBar(context, "", "", this);
    }
  }
}
