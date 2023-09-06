import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/ui/widgets/textfields/textfield.dart';

import '../../../../app/utils/theme.dart';

class TradeAppbarExtension extends StatelessWidget {
  const TradeAppbarExtension({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      children: [
        SizedBox(
          height: 12.pHeight(context),
        ),
        Container(
          height: 68.pHeight(context),
          width: double.infinity,
          color: isDarkMode
              ? ColorManager.darkHeaderColor
              : Theme.of(context).scaffoldBackgroundColor,
          child: const CustomTextFields(
            hintText: "Market Execution",
          ),
        ),
      ],
    );
  }
}