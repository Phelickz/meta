// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';

class HomeViewModel extends CustomBaseViewModel {
  bool _showBalance = true;
  bool get showBalance => _showBalance;

  Future<void> init() async {}

  int _counter = 0;
  int get counter => _counter;

  ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  ScrollController _scrollController2 = ScrollController();
  ScrollController get scrollController2 => _scrollController2;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void setShowBalance() {
    _showBalance = !_showBalance;
    rebuildUi();
  }
}
