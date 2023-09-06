import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/ui/widgets/quotes/advanced_view.dart';
import 'package:meta_trader/ui/widgets/quotes/components/quotes_bottom_sheet.dart';
import 'package:meta_trader/ui/widgets/quotes/edit.dart';
import 'package:meta_trader/ui/widgets/quotes/modern_view.dart';
import 'package:meta_trader/ui/widgets/quotes/search.dart';
import 'package:meta_trader/ui/widgets/quotes/search_quote_details.dart';
import 'package:meta_trader/ui/widgets/quotes/search_subgroup.dart';
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
  MarketViewEnum _marketViewEnum = MarketViewEnum.advancedView;
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
      "percentageChange": "10",
      "currencyPair": "GBPUSG",
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
      "high": "11.8018",
      "trend": "positive",
      "currencyPairFull": "Great Britain Pound vs US Dollar",
      "currencyIcon": AssetManager.gbpUSD
    },
    {
      "percentageChange": "50",
      "currencyPair": "BTC",
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
      "high": "11.8018",
      "trend": "positive",
      "currencyPairFull": "Bitcoin",
      "currencyIcon": AssetManager.btc
    },
    {
      "percentageChange": "20",
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
      "high": "11.8018",
      "trend": "negative",
      "currencyPairFull": "US Dollar vs Canagian Dollor",
      "currencyIcon": AssetManager.gbpUSD
    },
    {
      "percentageChange": "20",
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
      "high": "11.8018",
      "trend": "negative",
      "currencyPairFull": "Great Britain Pound vs US Dollar",
      "currencyIcon": AssetManager.btc
    },
    {
      "percentageChange": "20",
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
      "high": "11.8018",
      "trend": "negative",
      "currencyPairFull": "Great Britain Pound vs US Dollar",
      "currencyIcon": AssetManager.btc
    },
    {
      "percentageChange": "20",
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
      "high": "11.8018",
      "trend": "negative",
      "currencyPairFull": "Great Britain Pound vs US Dollar",
      "currencyIcon": AssetManager.btc
    },
  ];

  List marketDetailList = [
    {
      "digits": '2',
      "contractSize": "332",
      "spread": "35",
      "stopsLevel": "0",
      "contractSize1": "1211122212",
      "spread1": "1211122212",
      "stopsLevel1": "1211122212",
      "marginCurrency": "1211122212",
      "profitCurrency": "1211122212",
      "calculations": "1211122212",
      "tickSize": "1211122212",
      "tickValue": "1211122212"
    }
  ];

  List marketStats = [
    {
      "initialMargin": "2",
      "bid": "3.1",
      "bidHigh": "4.55",
      "ask": "1.4",
      "askHigh": "1.33",
      "askLow": "0.3",
      "priceChange": "0.3",
      "openPrice": "2.1",
      "closePrice": "2.3"
    }
  ];
  bool _isFav = false;
  bool get isFav => _isFav;
  List favQuotes = [];

  int lotSize = 0;
  int stopLosss = 0;
  int takeProfit = 0;
  bool isDurationEnabled = false;

  void tapToIncrease(String option) {
    if (option == 'lotSize') {
      lotSize++;
    } else if (option == "stopLoss") {
      stopLosss++;
    } else {
      takeProfit++;
    }
  }

  void tapToDecrese(String option) {
    if (option == 'lotSize' && lotSize > 0) {
      lotSize--;
    } else if (option == "stopLoss" && stopLosss > 0) {
      stopLosss--;
    } else if (option == "takeProfit" && takeProfit > 0) {
      takeProfit--;
    }
  }

  List sampleQuoteDetails = [
    {
      "title": "ISIN",
      "value": "21212122121",
    },
    {
      "title": "Sector",
      "value": "21212122121",
    },
    {
      "title": "Industry",
      "value": "21212122121",
    },
    {
      "title": "Country",
      "value": "21212122121",
    },
    {
      "title": "Digits",
      "value": "21212122121",
    },
    {
      "title": "Contract Size",
      "value": "21212122121",
    },
    {
      "title": "Spread",
      "value": "21212122121",
    },
    {
      "title": "Stop Level",
      "value": "21212122121",
    },
    {
      "title": "Margin currency",
      "value": "21212122121",
    },
    {
      "title": "Profit currency",
      "value": "21212122121",
    },
    {
      "title": "Tick size",
      "value": "21212122121",
    },
    {
      "title": "Tick value",
      "value": "21212122121",
    },
  ];

  List symbolGroups = [
    {"title": "Forex", "subtitle": "inst\\forex"},
    {"title": "Metals", "subtitle": "inst\\forx"},
    {"title": "Comms", "subtitle": "inst\\comms"},
    {"title": "Exotic", "subtitle": "inst\\exotic"},
    {"title": "Minors", "subtitle": "inst\\minors"},
  ];

  List symbolSubgroup = [
    {"title": "WTIs", "subtitle": "inst\\forex"},
    {"title": "BRENT", "subtitle": "inst\\forx"},
    {"title": "NGS", "subtitle": "inst\\comms"},
    {"title": "CORNS", "subtitle": "inst\\exotic"},
    {"title": "WHEAT", "subtitle": "inst\\minors"},
  ];

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

  void openOptionsBottomSheet(
    BuildContext context,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return QuotesBottomSheet(model: this);
      },
    );
  }

  Widget returnPage() {
    switch (_quotesPageEnum) {
      case QuotesPageEnum.markets:
        return returnMarketView();
      case QuotesPageEnum.favorites:
        return returnMarketView();
      case QuotesPageEnum.edit:
        return EditPage(model: this);
      case QuotesPageEnum.search:
        return SearchPage(model: this);
      case QuotesPageEnum.details:
        return SearchQuoteDetailsPage(model: this);
      case QuotesPageEnum.subGroups:
        return SearchSubgroupPage(model: this);
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
