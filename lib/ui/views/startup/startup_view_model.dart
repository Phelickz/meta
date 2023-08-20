import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/app/locator/locator.dart';
import 'package:meta_trader/app/router/router.dart';
import 'package:meta_trader/app/services/router_service.dart';

class StartupViewModel extends CustomBaseViewModel {
  final RouterService _routerService = locator<RouterService>();

  StartupViewModel() {
    init();
  }

  Future<void> init() async {
    WidgetsBinding.instance.addPostFrameCallback((Duration duration) async {
      await navigateToOnboardingView();
    });
  }

  Future navigateToOnboardingView() async {
    await _routerService.router.push(
      const OnboardingRoute(),
    );
  }
}
