// ignore_for_file: prefer_final_fields

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/app/models/all_forex_news.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/appbar.dart';

import '../../../app/locator/locator.dart';
import '../../../app/models/trending_headlines.dart';
import '../../../app/services/forex_news_client_service.dart';

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

  final forexNewsService = locator<ForexNewsService>();

  AllForexNews? _allForexNews;
  AllForexNews? get allForexNews => _allForexNews;

  AllForexNews? _searchForexNews;
  AllForexNews? get searchForexNews => _searchForexNews;

  AllForexNews? _allCurrencyPairNews;
  AllForexNews? get allCurrencyPairNews => _allCurrencyPairNews;

  AllForexNews? _allMetalNews;
  AllForexNews? get allMetalNews => _allMetalNews;

  TrendingHeadline? _trendingHeadline;
  TrendingHeadline? get trendingHeadline => _trendingHeadline;

  ScrollController _currencyPairController = ScrollController();
  ScrollController get currencyPairController => _currencyPairController;

  ScrollController _metalsNewsController = ScrollController();
  ScrollController get metalsNewsController => _metalsNewsController;

  ScrollController _cryptoCurrencyController = ScrollController();
  ScrollController get cryptoCurrencyController => _cryptoCurrencyController;

  NewsData? _selectedNews;
  NewsData? get selectedNews => _selectedNews;

  GlobalKey<ContainedTabBarViewState> _key = GlobalKey();
  GlobalKey<ContainedTabBarViewState> get key => _key;

  int _currencyPairPage = 1;
  int _metalNewsPage = 1;
  int _cryptoCurrencyPage = 1;

  bool _isRefreshingCurrencyPair = false;
  bool _isRefreshingMetal = false;
  bool _isRefreshingCryptoCurrency = false;

  String? _searchText;
  String? get searchText => _searchText;

  ForexNewsViewModel({bool? loadForexNews = true}) {
    if (loadForexNews != false) {
      fetchAllForexNews();
      fetchAllCurrencyPairNews();
      fetchAllMetalNews();
      fetchAllTrendingHeadlines();
    }
  }

  set setTyping(bool val) {
    _isTyping = val;
    rebuildUi();
  }

  set setSearchText(String? val) {
    _searchText = val;
    rebuildUi();
  }

  set setForexNewsViewEnum(ForexNewsViewEnum e) {
    _forexNewsViewEnum = e;
    rebuildUi();
  }

  set setSelectedNews(NewsData? news) {
    _selectedNews = news;
    rebuildUi();
  }

  void setRefreshCurrencyPair(bool val) {
    _isRefreshingCurrencyPair = val;
    rebuildUi();
  }

  void setRefreshMetal(bool val) {
    _isRefreshingMetal = val;
    rebuildUi();
  }

  void setRefreshCryptoCurrency(bool val) {
    _isRefreshingCryptoCurrency = val;
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

  void fetchAllForexNews({bool getMore = false}) async {
    setBusy(true);
    if (_isRefreshingCryptoCurrency == false) {
      if (getMore == true) {
        setRefreshCryptoCurrency(true);
      }
      final AllForexNews? allForexNewsResponse =
          await forexNewsService.getAllForexNews(
        'general',
        10,
        getMore == false ? _cryptoCurrencyPage : _cryptoCurrencyPage + 1,
      );
      if (_allForexNews == null) {
        _allForexNews = allForexNewsResponse;
        setRefreshCryptoCurrency(false);
      } else {
        _allForexNews!.data!.addAll(allForexNewsResponse!.data!);
        _cryptoCurrencyPage = _cryptoCurrencyPage + 1;
        setRefreshCryptoCurrency(false);
      }
      setRefreshCryptoCurrency(false);
      setBusy(false);
      rebuildUi();
    }
  }

  void fetchAllCurrencyPairNews({bool getMore = false}) async {
    setBusy(true);
    if (_isRefreshingCurrencyPair == false) {
      if (getMore == true) {
        setRefreshCurrencyPair(true);
      }
      final AllForexNews? allForexNewsResponse =
          await forexNewsService.getAllForexNews(
        'allcurrencypairs',
        10,
        getMore == false ? _currencyPairPage : _currencyPairPage + 1,
      );
      if (_allCurrencyPairNews == null) {
        _allCurrencyPairNews = allForexNewsResponse;
        setRefreshCurrencyPair(false);
      } else {
        _allCurrencyPairNews!.data!.addAll(allForexNewsResponse!.data!);
        _currencyPairPage = _currencyPairPage + 1;
        setRefreshCurrencyPair(false);
      }
      setRefreshCurrencyPair(false);
      setBusy(false);
      rebuildUi();
    }
  }

  void fetchAllMetalNews({bool getMore = false}) async {
    setBusy(true);
    if (_isRefreshingMetal == false) {
      if (getMore == true) {
        setRefreshMetal(true);
      }
      final AllForexNews? allForexNewsResponse =
          await forexNewsService.getAllForexNews(
        'general',
        10,
        getMore == false ? _metalNewsPage : _metalNewsPage + 1,
        search: 'Federal+Reserve',
      );
      if (_allMetalNews == null) {
        _allMetalNews = allForexNewsResponse;
        setRefreshMetal(false);
      } else {
        _allMetalNews!.data!.addAll(allForexNewsResponse!.data!);
        _metalNewsPage = _metalNewsPage + 1;
        setRefreshMetal(false);
      }
      setRefreshMetal(false);
      setBusy(false);
      rebuildUi();
    }
  }

  void fetchAllTrendingHeadlines() async {
    setBusy(true);
    final TrendingHeadline? allForexNewsResponse =
        await forexNewsService.getAllTrendingHeadline(3, 1);
    _trendingHeadline = allForexNewsResponse;
    setBusy(false);
    rebuildUi();
  }

  void fetchAllSearchNews(String search) async {
    setBusy(true);
    final AllForexNews? allForexNewsResponse =
        await forexNewsService.getAllForexNews(
      'general',
      20,
      1,
      search: search,
    );
    _searchForexNews = allForexNewsResponse;
    setBusy(false);
    rebuildUi();
  }
}
