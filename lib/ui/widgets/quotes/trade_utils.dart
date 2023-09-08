import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';

Widget incrementContainer(
    Function() increment, Function() decrement, Widget widget,
    [double? height]) {
  return Builder(builder: (context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      height: height ?? 56.pHeight(context),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDarkMode ? ColorManager.darkText : const Color(0xFF98A2B3),
        ),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: 10.pWidth(context), vertical: 10.pHeight(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
            child: IconButton(
                onPressed: increment,
                icon: Icon(
                  Icons.remove,
                  color: isDarkMode ? Colors.white : const Color(0xFF98A2B3),
                  size: 20,
                )),
          ),
          widget,
          FittedBox(
            child: IconButton(
                onPressed: decrement,
                icon: Icon(
                  Icons.add,
                  color: isDarkMode ? Colors.white : const Color(0xFF98A2B3),
                  size: 20,
                )),
          ),
        ],
      ),
    );
  });
}
