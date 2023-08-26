import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';

class SuggestionBar extends StatelessWidget {
  final List suggestionsList;
  const SuggestionBar({Key? key, required this.suggestionsList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 8.pHeight(context), horizontal: 24.pWidth(context)),
      height: 69.pHeight(context),
      width: MediaQuery.of(context).size.width,
      color: isDarkMode ? const Color(0xff052844) : Color(0xffD3ECFD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Suggestions",
            style: CustomThemeData.generateColoredStyle(
              fontSize: 10,
              context: context,
            ),
          ),
          SizedBox(
            height: 5.pHeight(context),
          ),
          SizedBox(
            height: 24.pHeight(context),
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 12.pWidth(context),
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: suggestionsList.length,
                // padding: EdgeInsets.only(right: 20.pWidth(context)),
                itemBuilder: (context, index) {
                  return SuggestionContainer(
                    suggestion: suggestionsList[index],
                  );
                }),
          )
        ],
      ),
    );
  }
}

class SuggestionContainer extends StatelessWidget {
  final String suggestion;
  const SuggestionContainer({Key? key, required this.suggestion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 8.pWidth(context), vertical: 4.pHeight(context)),
      decoration: BoxDecoration(
        color: isDarkMode ? Color(0xff0C2031) : Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        suggestion,
        style: CustomThemeData.generateColoredStyle(
            fontSize: 12, context: context, fontWeight: FontWeight.normal),
      ),
    );
  }
}
