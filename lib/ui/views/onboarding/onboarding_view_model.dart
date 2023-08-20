// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';

class OnboardingViewModel extends CustomBaseViewModel {
  Future<void> init() async {}

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<int> get counter => _counter;

  final PageController pageController = PageController();

  final ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);

  void incrementCounter(int value, bool fromButton) {
    _counter.value = value;
    currentPageNotifier.value = value; // Update the currentPageNotifier value

    if (fromButton == true) {
      pageController.jumpToPage(currentPageNotifier.value);
    }
    rebuildUi();
  }

  void decrementCounter() {
    _counter.value--;
    rebuildUi();
  }
}
