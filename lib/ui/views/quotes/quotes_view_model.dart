import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
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
      "trend": LocaleKeys.positive.tr(),
      "currencyPairFull": LocaleKeys
          .views_quotesView_quotesViewModel_quoteList_greatBritainPounds
          .tr(),
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
      "trend": LocaleKeys.positive.tr(),
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
      "trend": LocaleKeys.negative.tr(),
      "currencyPairFull": LocaleKeys
          .views_quotesView_quotesViewModel_quoteList_usDollarCan
          .tr(),
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
      "trend": LocaleKeys.negative.tr(),
      "currencyPairFull": LocaleKeys
          .views_quotesView_quotesViewModel_quoteList_greatBritainPounds
          .tr(),
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
      "trend": LocaleKeys.negative.tr(),
      "currencyPairFull": LocaleKeys
          .views_quotesView_quotesViewModel_quoteList_greatBritainPounds
          .tr(),
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
      "trend": LocaleKeys.negative.tr(),
      "currencyPairFull": LocaleKeys
          .views_quotesView_quotesViewModel_quoteList_greatBritainPounds
          .tr(),
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
      "title": LocaleKeys.sector.tr(),
      "value": "21212122121",
    },
    {
      "title": LocaleKeys.industry.tr(),
      "value": "21212122121",
    },
    {
      "title": LocaleKeys.country.tr(),
      "value": "21212122121",
    },
    {
      "title": LocaleKeys.digits.tr(),
      "value": "21212122121",
    },
    {
      "title": LocaleKeys.chart_specification_contractSize.tr(),
      "value": "21212122121",
    },
    {
      "title": LocaleKeys.spread.tr(),
      "value": "21212122121",
    },
    {
      "title": LocaleKeys.views_quotesView_quotesViewModel_stopLevel.tr(),
      "value": "21212122121",
    },
    {
      "title": LocaleKeys.views_quotesView_quotesViewModel_marginCurrency.tr(),
      "value": "21212122121",
    },
    {
      "title": LocaleKeys.views_quotesView_quotesViewModel_profitCurrency.tr(),
      "value": "21212122121",
    },
    {
      "title": LocaleKeys.views_quotesView_quotesViewModel_tickSize.tr(),
      "value": "21212122121",
    },
    {
      "title": LocaleKeys.views_quotesView_quotesViewModel_tickValue.tr(),
      "value": "21212122121",
    },
  ];

  List symbolGroups = [
    {"title": "Forex", "subtitle": "inst\\forex"},
    {"title": LocaleKeys.metals.tr(), "subtitle": "inst\\forx"},
    {"title": "Comms", "subtitle": "inst\\comms"},
    {"title": LocaleKeys.exotics.tr(), "subtitle": "inst\\exotic"},
    {"title": LocaleKeys.minors.tr(), "subtitle": "inst\\minors"},
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
    var isDarkMode = CustomThemeData.isDarkMode(context);
    showModalBottomSheet(
      backgroundColor:
          isDarkMode ? const Color(0xFF0C2031) : const Color(0xFFFAFDFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(McGyver.rsDoubleH(context, 2)),
          topRight: Radius.circular(McGyver.rsDoubleH(context, 2)),
        ),
      ),
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
        return quotesAppBar(context, LocaleKeys.quotes.tr(),
            LocaleKeys.views_quotesView_quotesViewModel_addSymbol.tr(), this);
      case QuotesPageEnum.subGroups:
        return quotesAppBar(context, LocaleKeys.quotes.tr(),
            LocaleKeys.views_quotesView_quotesViewModel_addSymbol.tr(), this);
      case QuotesPageEnum.details:
        return quotesAppBar(context, "CORN", LocaleKeys.details.tr(), this);
      default:
        return quotesAppBar(context, "", "", this);
    }
  }
}
