import 'package:flutter/material.dart';
import '../../../../app/responsiveness/res.dart';
import '../../../../app/utils/theme.dart';

class CustomChartTab extends StatefulWidget {
  final String firstTabName;
  final String secondTabName;
  final String thirdTabName;
  final String fourthTabName;
  final String fifthTabName;
  final int tabIndex;
  final Function(int) onSelectTab;
  const CustomChartTab({
    Key? key,
    required this.firstTabName,
    required this.secondTabName,
    required this.thirdTabName,
    required this.fourthTabName,
    required this.fifthTabName,
    required this.onSelectTab,
    required this.tabIndex,
  }) : super(key: key);

  @override
  State<CustomChartTab> createState() => _CustomChartTabState();
}

class _CustomChartTabState extends State<CustomChartTab> {
  late int _selectedTab;
  @override
  void initState() {
    super.initState();
    _selectedTab = widget.tabIndex;
  }

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: McGyver.rsDoubleW(context, 3),
          vertical: McGyver.rsDoubleH(context, 0.7)),
      width: MediaQuery.sizeOf(context).width * 0.45,
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xff073961) : const Color(0xffD3ECFD),
        borderRadius: BorderRadius.all(
          Radius.circular(
            McGyver.rsDoubleW(context, 3),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _tabItem(widget.firstTabName, 0, widget.onSelectTab),
          _tabItem(widget.secondTabName, 1, widget.onSelectTab),
          _tabItem(widget.thirdTabName, 2, widget.onSelectTab),
          _tabItem(widget.fourthTabName, 3, widget.onSelectTab),
          _tabItem(widget.fifthTabName, 4, widget.onSelectTab),
        ],
      ),
    );
  }

  Widget _tabItem(String label, index, Function(int) onSelectTab) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onSelectTab(index);
          _selectedTab = index;
        });
      },
      child: Container(
        height: McGyver.rsDoubleH(context, 3),
        padding: EdgeInsets.only(
          top: McGyver.rsDoubleH(context, 0.5),
          bottom: McGyver.rsDoubleH(context, 0.5),
        ),
        decoration: index != 4
            ? BoxDecoration(
                border: _selectedTab == index
                    ? Border(
                        bottom: BorderSide(
                          color: isDarkMode
                              ? const Color(0xFF77C5F8)
                              : const Color(0xFF0C95EF),
                          width: 3.0,
                          style: BorderStyle.solid,
                        ),
                      )
                    : null,
              )
            : null,
        child: Row(
          children: [
            Text(
              label,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.5),
                fontWeight: FontWeight.w500,
                color: _selectedTab == index
                    ? isDarkMode
                        ? const Color(0xFF77C5F8)
                        : const Color(0xFF0C95EF)
                    : isDarkMode
                        ? const Color(0xFF98A2B3)
                        : const Color(0xFF344054),
              ),
            ),
            if (index == 4)
              Icon(
                Icons.keyboard_arrow_down,
                size: 14,
                color: _selectedTab == index
                    ? isDarkMode
                        ? const Color(0xFF77C5F8)
                        : const Color(0xFF0C95EF)
                    : isDarkMode
                        ? const Color(0xFF98A2B3)
                        : const Color(0xFF344054),
              )
          ],
        ),
      ),
    );
  }
}
