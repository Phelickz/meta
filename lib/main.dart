import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:meta_trader/app/app.dart';
import 'package:meta_trader/app/locator/locator.dart';
import 'package:meta_trader/generated/codegen_loader.g.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'generated/codegen_loader.g.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  /// Sets logging level
  Logger.level = Level.debug;

  /// Register all the models and services before the app starts
  setupLocator();

  await ThemeManager.initialise();

  if (Platform.isAndroid) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  /// Runs the app :)
  // runApp(const MetaTraderApp());

  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
          Locale('fa'),
        ],
        path: 'assets/translations',
        assetLoader: const CodegenLoader(),
        fallbackLocale: const Locale('en'),
        child: const MetaTraderApp()),
  );

  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => const MetaTraderApp(), // Wrap your app
  //   ),
  // );
}



// flutter pub run easy_localization:generate --source-dir ./assets/translations
// flutter pub run easy_localization:generate --source-dir ./assets/translations -f keys -o locale_keys.g.dart