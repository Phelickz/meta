// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';

class CurrencyConverterViewModel extends CustomBaseViewModel {
  CurrencyConverterViewModel() {
    setSelectedCurrency = currency[0];
    setSelectedCurrency2 = currency2[1];
  }
  bool _isTyping = false;
  bool get isTyping => _isTyping;

  TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;

  List<String> currency = ['USD', 'AUD', 'CAD', 'GBP', 'RUB', "NGN", 'JPY'];
  String? _selectedCurrency;
  String? get selectedCurrency => _selectedCurrency;

  List<String> currency2 = ['USD', 'AUD', 'CAD', 'GBP', 'RUB', "NGN", 'JPY'];
  String? _selectedCurrency2;
  String? get selectedCurrency2 => _selectedCurrency2;

  double _openingPrice = 0.02;
  double get openingPrice => _openingPrice;

  double _closingPrice = 0.0;
  double get closingPrice => _closingPrice;

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

  TextEditingController _openingPriceController = TextEditingController();
  TextEditingController get openingPriceController => _openingPriceController;

  TextEditingController _closingPriceController = TextEditingController();
  TextEditingController get closingPriceController => _closingPriceController;

  set setTyping(bool val) {
    _isTyping = val;
    rebuildUi();
  }

  set setSelectedCurrency(String val) {
    _selectedCurrency = val;
    rebuildUi();
  }

  set setSelectedCurrency2(String val) {
    _selectedCurrency2 = val;
    rebuildUi();
  }

  set setSelectedCurrencyPair(String val) {
    _selectedCurrencyPair = val;
    rebuildUi();
  }

  set setOpeningPrice(double val) {
    _openingPrice = val;
    _openingPriceController.text = _openingPrice.toString();
    rebuildUi();
  }

  set setClosingPrice(double val) {
    _closingPrice = val;
    _closingPriceController.text = _closingPrice.toString();
    rebuildUi();
  }
}
