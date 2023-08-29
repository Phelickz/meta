import 'package:flutter/material.dart';
import '../../../../app/responsiveness/res.dart';
import '../../../../app/utils/theme.dart';

class CustomHeadTab extends StatefulWidget {
  final String firstTabName;
  final String secondTabName;
  final String thirdTabName;
  final Function(int) onSelectTab;
  const CustomHeadTab({
    Key? key,
    required this.firstTabName,
    required this.secondTabName,
    required this.thirdTabName,
    required this.onSelectTab,
  }) : super(key: key);

  @override
  State<CustomHeadTab> createState() => _CustomHeadTabState();
}

class _CustomHeadTabState extends State<CustomHeadTab> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: McGyver.rsDoubleW(context, 12)),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xff073961) : const Color(0xffECF7FE),
        borderRadius: const BorderRadius.all(
          Radius.circular(3),
        ),
      ),
      child: Row(
        children: [
          _tabItem(widget.firstTabName, 0, widget.onSelectTab),
          const Spacer(),
          _tabItem(widget.secondTabName, 1, widget.onSelectTab),
          const Spacer(),
          _tabItem(widget.thirdTabName, 2, widget.onSelectTab),
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
        height: McGyver.rsDoubleH(context, 6),
        padding: EdgeInsets.only(
          top: McGyver.rsDoubleH(context, 2),
          bottom: McGyver.rsDoubleH(context, 1),
        ),
        decoration: BoxDecoration(
          border: _selectedTab == index
              ? Border(
                  bottom: BorderSide(
                    color: isDarkMode
                        ? const Color(0xFF77C5F8)
                        : const Color(0xFF0C95EF),
                    width: 4.0,
                    style: BorderStyle.solid,
                  ),
                )
              : null,
        ),
        child: Text(
          label,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.9),
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
      ),
    );
  }
}
