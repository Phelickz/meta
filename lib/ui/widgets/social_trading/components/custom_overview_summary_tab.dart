import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/theme.dart';

class CustomOverviewSummaryTab extends StatefulWidget {
  final String firstTabName;
  final String secondTabName;
  final String thirdTabName;
  final String fourthTabName;

  final int tabIndex;
  final Function(int) onSelectTab;
  const CustomOverviewSummaryTab({
    Key? key,
    required this.firstTabName,
    required this.secondTabName,
    required this.thirdTabName,
    required this.fourthTabName,
    required this.onSelectTab,
    required this.tabIndex,
  }) : super(key: key);

  @override
  State<CustomOverviewSummaryTab> createState() =>
      _CustomOverviewSummaryTabState();
}

class _CustomOverviewSummaryTabState extends State<CustomOverviewSummaryTab> {
  late int _selectedTab;
  @override
  void initState() {
    super.initState();
    _selectedTab = widget.tabIndex;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: McGyver.rsDoubleW(context, 42),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _tabItem(widget.firstTabName, 0, widget.onSelectTab),
          _tabItem(widget.secondTabName, 1, widget.onSelectTab),
          _tabItem(widget.thirdTabName, 2, widget.onSelectTab),
          _tabItem(widget.thirdTabName, 3, widget.onSelectTab),
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
        height: McGyver.rsDoubleH(context, 4.1),
        width: McGyver.rsDoubleH(context, 4.1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              McGyver.rsDoubleW(context, 2),
            ),
            color: isDarkMode
                ? _selectedTab == index
                    ? const Color(0xff153856)
                    : const Color(0xff0C2031)
                : _selectedTab == index
                    ? const Color(0xff0C95EF)
                    : Colors.transparent,
            border: isDarkMode
                ? _selectedTab == index
                    ? Border.all(color: const Color(0xff667085))
                    : null
                : _selectedTab != index
                    ? Border.all(color: const Color(0xffE4E7EC))
                    : null),
        child: Center(
          child: Text(
            label,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.3),
              fontWeight: FontWeight.w500,
              color: _selectedTab == index
                  ? isDarkMode
                      ? const Color(0xFFD0D5DD)
                      : const Color(0xFFFCFCFD)
                  : isDarkMode
                      ? const Color(0xFF98A2B3)
                      : const Color(0xFF667085),
            ),
          ),
        ),
      ),
    );
  }
}
