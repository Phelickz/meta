import 'package:meta_trader/app/locator/locator.dart';
import 'package:meta_trader/app/services/router_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../services/theme_service.dart';

abstract class CustomBaseViewModel extends BaseViewModel {
  final RouterService _routerService = locator<RouterService>();
  final _themeService = locator<ThemeServices>();

  void goBack() {
    _routerService.router.pop();
  }

  void push(route) {
    _routerService.router.push(route);
  }

  void removeFocus() {
    FocusManager.instance.primaryFocus!.unfocus();
  }

  bool isDarkMode() {
    return _themeService.themeService.isDarkMode;
  }
}
