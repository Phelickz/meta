import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/textfields/textfield.dart';

import '../../../../app/utils/theme.dart';

class TradeAppbarExtension extends StatelessWidget {
  const TradeAppbarExtension({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      children: [
        Container(
          height: 80.pHeight(context),
          width: double.infinity,
          color: isDarkMode
              ? ColorManager.darkHeaderColor
              : Theme.of(context).scaffoldBackgroundColor,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: McGyver.rsDoubleW(context, 5),
              vertical: 12,
            ),
            child: CustomTextFields(
              hintText: LocaleKeys
                  .quotesWidget_components_tradeAppBar_marketExec
                  .tr(),
            ),
          ),
        ),
      ],
    );
  }
}
