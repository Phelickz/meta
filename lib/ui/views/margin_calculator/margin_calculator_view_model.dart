// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';

class MarginCalculatorViewModel extends CustomBaseViewModel {
  bool _isTyping = false;
  bool get isTyping => _isTyping;

  TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;

  List<String> currency = ['USD', 'AUD', 'CAD', 'GBP', 'RUB', "NGN", 'JPY'];
  String? _selectedCurrency;
  String? get selectedCurrency => _selectedCurrency;

  List<String> currencyPair = [
    'USDJPY',
    'AUDJPY',
    'CADJPY',
    'GBPJPY',
    'RUBJPY',
    "NGNJPY"
  ];
  String? _selectedCurrencyPair;
  String? get selectedCurrencyPair => _selectedCurrencyPair;

  set setTyping(bool val) {
    _isTyping = val;
    rebuildUi();
  }

  set setSelectedCurrency(String val) {
    _selectedCurrency = val;
    rebuildUi();
  }

  set setSelectedCurrencyPair(String val) {
    _selectedCurrencyPair = val;
    rebuildUi();
  }
}
