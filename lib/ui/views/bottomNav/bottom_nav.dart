// ignore_for_file: deprecated_member_use

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/home/home_view.dart';

@RoutePage(name: "BottomNavBarView")
class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  @override
  _BottomNavBarViewState createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const HomeView(),
    const TabScreen(title: 'Tab 2'),
    const TabScreen(title: 'Tab 3'),
    const TabScreen(title: 'Tab 4'),
    const TabScreen(title: 'Tab 5'),
  ];

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        unselectedItemColor: isDarkMode ? Colors.white54 : Colors.black54,
        selectedItemColor: Theme.of(context).primaryColor,
        backgroundColor:
            isDarkMode ? const Color(0xff052844) : const Color(0xffD3ECFD),
        unselectedLabelStyle: CustomThemeData.generateStyle(
          fontSize: 15,
          // color: isDarkMode ? Colors.white : Colors.black,
          // color: Colors.red,
        ),
        selectedLabelStyle: CustomThemeData.generateStyle(
          fontSize: 15,
          color: isDarkMode ? Colors.white : Theme.of(context).primaryColor,
        ),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/home.svg',
              color: _currentIndex != 0
                  ? const Color(0xff667085)
                  : Theme.of(context).primaryColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/chart-success.svg',
              color: _currentIndex != 1
                  ? const Color(0xff667085)
                  : Theme.of(context).primaryColor,
            ),
            label: 'Quotes',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/chart.svg',
              color: _currentIndex != 2
                  ? const Color(0xff667085)
                  : Theme.of(context).primaryColor,
            ),
            label: 'Chart',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/status-up.svg',
              color: _currentIndex != 3
                  ? const Color(0xff667085)
                  : Theme.of(context).primaryColor,
            ),
            label: 'Trade',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/user.svg',
              color: _currentIndex != 4
                  ? const Color(0xff667085)
                  : Theme.of(context).primaryColor,
            ),
            label: 'Profile',
          ),
        ],
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
