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
      defaultThemeMode: ThemeMode.system,
      // statusBarColorBuilder: (theme) => theme.accentColor
      darkTheme: CustomThemeData.darkTheme,
      lightTheme: CustomThemeData.lightTheme,
      builder: (context, regularTheme, darkTheme, themeMode) {
        return MaterialApp.router(
          title: "AioTrader",
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          routeInformationParser: _routerService.router.defaultRouteParser(),
          routerDelegate: _routerService.router.delegate(),
          theme: regularTheme,
          themeMode: themeMode,
          // theme: ThemeData(brightness: Brightness.light, fontFamily: 'Gilroy'),
          darkTheme: darkTheme,
          // home: const ProviderView(),
          builder: (context, child) {
            final mediaQueryData = MediaQuery.of(context);
            final scale = mediaQueryData.textScaleFactor.clamp(0.8, 0.9);
            return MediaQuery(
              child: child ?? Container(),
              // data: MediaQuery.of(context).copyWith(textScaleFactor: 0.8),
              data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
            );
          },
        );

        // return MaterialApp(
        //   debugShowCheckedModeBanner: false,
        //   theme: regularTheme,
        //   themeMode: themeMode,
        //   darkTheme: darkTheme,
        //   home: const TradeExecutionScreen(),
        // );
      },
    );
  }
}

// getThemeManager(context)
// .toggleDarkLightTheme();

// getThemeManager(context)
//   .setThemeMode(ThemeMode.light);
