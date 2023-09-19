import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:meta_trader/app/app.dart';
import 'package:meta_trader/app/locator/locator.dart';
import 'package:stacked_themes/stacked_themes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Sets logging level
  Logger.level = Level.debug;

  /// Register all the models and services before the app starts
  setupLocator();

  await ThemeManager.initialise();

  if (Platform.isAndroid) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  /// Runs the app :)
  runApp(const MetaTraderApp());

  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => const MetaTraderApp(), // Wrap your app
  //   ),
  // );
}
