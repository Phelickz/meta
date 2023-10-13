// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';

import '../../../app/locator/locator.dart';
import '../../../app/models/all_forex_news.dart';
import '../../../app/services/forex_news_client_service.dart';

class HomeViewModel extends CustomBaseViewModel {
  HomeViewModel() {
    fetchAllForexNews();
  }

  bool _showBalance = true;
  bool get showBalance => _showBalance;

  Future<void> init() async {}

  int _counter = 0;
  int get counter => _counter;

  ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  ScrollController _scrollController2 = ScrollController();
  ScrollController get scrollController2 => _scrollController2;

  AllForexNews? _allForexNews;
  AllForexNews? get allForexNews => _allForexNews;

  bool _isRefreshingCryptoCurrency = false;
  bool get isRefreshingCryptoCurrency => _isRefreshingCryptoCurrency;

  final forexNewsService = locator<ForexNewsService>();

  void setRefreshCryptoCurrency(bool val) {
    _isRefreshingCryptoCurrency = val;
    rebuildUi();
  }

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void setShowBalance() {
    _showBalance = !_showBalance;
    rebuildUi();
  }

  void fetchAllForexNews() async {
    setRefreshCryptoCurrency(true);
    final AllForexNews? allForexNewsResponse =
        await forexNewsService.getAllForexNews('general', 3, 1);
    _allForexNews = allForexNewsResponse;
    setRefreshCryptoCurrency(false);
    rebuildUi();
  }
}
