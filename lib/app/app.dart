import 'package:flutter/material.dart';
import 'package:meta_trader/app/locator/locator.dart';
import 'package:meta_trader/app/services/router_service.dart';
import 'package:meta_trader/app/utils/extension.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/app/utils/utils.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:easy_localization/easy_localization.dart' as el;

class MetaTraderApp extends StatelessWidget {
  const MetaTraderApp({super.key});

  @override
  Widget build(BuildContext context) {
    final RouterService _routerService = locator<RouterService>();
    textDirection.value = Utils.getTextDirection(context);

    return Directionality(
      // Determine the text direction based on the current locale.
      textDirection: Utils.getTextDirection(context),
      child: ThemeBuilder(
        defaultThemeMode: ThemeMode.system,
        darkTheme: CustomThemeData.darkTheme,
        lightTheme: CustomThemeData.lightTheme,
        builder: (context, regularTheme, darkTheme, themeMode) {
          return MaterialApp.router(
            title: "Aio Trader",
            debugShowCheckedModeBanner: false,
            routeInformationParser: _routerService.router.defaultRouteParser(),
            routerDelegate: _routerService.router.delegate(),
            theme: regularTheme,
            themeMode: themeMode,
            darkTheme: darkTheme,
            builder: (context, child) {
              final mediaQueryData = MediaQuery.of(context);
              final scale = mediaQueryData.textScaleFactor.clamp(0.8, 0.9);
              return MediaQuery(
                child: child ?? Container(),
                data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
              );
            },
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          );
        },
      ),
    );
  }
}


// getThemeManager(context)
// .toggleDarkLightTheme();

// getThemeManager(context)
//   .setThemeMode(ThemeMode.light);
