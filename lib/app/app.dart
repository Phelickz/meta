import 'package:flutter/material.dart';
import 'package:meta_trader/app/locator/locator.dart';
import 'package:meta_trader/app/services/router_service.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:stacked_themes/stacked_themes.dart';

class MetaTraderApp extends StatelessWidget {
  const MetaTraderApp({super.key});

  @override
  Widget build(BuildContext context) {
    final RouterService _routerService = locator<RouterService>();

    return ThemeBuilder(
      defaultThemeMode: ThemeMode.light,
      // statusBarColorBuilder: (theme) => theme.accentColor
      darkTheme: CustomThemeData.darkTheme,
      lightTheme: CustomThemeData.lightTheme,
      builder: (context, regularTheme, darkTheme, themeMode) {
        return MaterialApp.router(
          title: "Meta Trader",
          debugShowCheckedModeBanner: false,
          routeInformationParser: _routerService.router.defaultRouteParser(),
          routerDelegate: _routerService.router.delegate(),
          theme: regularTheme,
          themeMode: themeMode,
          // theme: ThemeData(brightness: Brightness.light, fontFamily: 'Gilroy'),
          darkTheme: darkTheme,
        );
        // return MaterialApp(
        //   debugShowCheckedModeBanner: false,
        //   theme: regularTheme,
        //   themeMode: themeMode,
        //   darkTheme: darkTheme,
        //   home: const TransactionsView(),
        // );
      },
    );
  }
}

// getThemeManager(context)
// .toggleDarkLightTheme();

// getThemeManager(context)
//   .setThemeMode(ThemeMode.light);
