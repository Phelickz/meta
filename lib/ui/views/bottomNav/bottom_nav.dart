// ignore_for_file: deprecated_member_use

import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/chart/chart_view.dart';
import 'package:meta_trader/ui/views/home/home_view.dart';
import 'package:meta_trader/ui/views/quotes/quotes_view.dart';
import 'package:meta_trader/ui/views/trade/trade_view.dart';

import '../profile/profile_view.dart';

ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

@RoutePage()
class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  @override
  _BottomNavBarViewState createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  // int currentIndex.value = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _tabs = [
      const HomeView(),
      const QuotesView(),
      ChartView(
        onPressed: () {
          currentIndex.value = 0;
          setState(() {});
        },
      ),
      const TradeView(),
      // const TabScreen(title: 'Tab 5'),
      const ProfileView(),
    ];
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: _tabs[currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          unselectedItemColor: isDarkMode ? Colors.white54 : Colors.black54,
          selectedItemColor: Theme.of(context).primaryColor,
          backgroundColor:
              isDarkMode ? const Color(0xff052844) : const Color(0xffD3ECFD),
          unselectedLabelStyle: CustomThemeData.generateStyle(
            fontSize: 13,
            // color: isDarkMode ? Colors.white : Colors.black,
            // color: Colors.red,
          ),
          selectedLabelStyle: CustomThemeData.generateStyle(
            fontSize: 13,
            color: isDarkMode ? Colors.white : Theme.of(context).primaryColor,
          ),
          currentIndex: currentIndex.value,
          onTap: (index) {
            // setState(() {
            //   currentIndex.value = index;
            // });
            currentIndex.value = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                currentIndex.value != 0
                    ? 'assets/images/home_inactive.svg'
                    : 'assets/images/home.svg',
                color: currentIndex.value != 0
                    ? const Color(0xff667085)
                    : Theme.of(context).primaryColor,
                height: 20,
              ),
              label: LocaleKeys.views_bottomNav_home.tr(),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                height: 20,
                currentIndex.value == 1
                    ? 'assets/images/quotes_selected.svg'
                    : 'assets/images/chart-success.svg',
                color: currentIndex.value != 1
                    ? const Color(0xff667085)
                    : Theme.of(context).primaryColor,
              ),
              label: LocaleKeys.views_bottomNav_quotes.tr(),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                height: 20,
                currentIndex.value == 2
                    ? 'assets/images/chart_selected.svg'
                    : 'assets/images/chart.svg',
                color: currentIndex.value != 2
                    ? const Color(0xff667085)
                    : Theme.of(context).primaryColor,
              ),
              label: LocaleKeys.views_bottomNav_chart.tr(),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                height: 20,
                currentIndex.value == 3
                    ? 'assets/images/trade_selected.svg'
                    : 'assets/images/status-up.svg',
                color: currentIndex.value != 3
                    ? const Color(0xff667085)
                    : Theme.of(context).primaryColor,
              ),
              label: LocaleKeys.views_bottomNav_trade.tr(),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                height: 20,
                currentIndex.value == 4
                    ? 'assets/images/user_selected.svg'
                    : 'assets/images/user.svg',
                color: currentIndex.value != 4
                    ? const Color(0xff667085)
                    : Theme.of(context).primaryColor,
              ),
              label: LocaleKeys.views_bottomNav_profile.tr(),
            ),
          ],
        ),
      ),
    );
  }
}

class TabScreen extends StatelessWidget {
  final String title;

  const TabScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title),
    );
  }
}
