import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/utils/theme.dart';


class TypeTag extends StatelessWidget {
  final String tag;
  const TypeTag({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      height: 20.pHeight(context),
      width: 39.pWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.pWidth(context)),
        color: tag == "Real" ? Colors.red : Colors.green,
      ),
      child: Center(
        child: Text(tag,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.2),
            color: isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.w300
            ),
        ),
      ),
    );
  }
}