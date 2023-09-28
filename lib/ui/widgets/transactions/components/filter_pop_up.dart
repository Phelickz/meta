import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/responsiveness/size.dart';
import '../../../../app/utils/theme.dart';
import '../../textfields/textfield.dart';

class FilterPopUp extends StatelessWidget {
  const FilterPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      children: [
        Text(
          LocaleKeys.filterBy,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.6),
            fontWeight: FontWeight.w400,
            color: isDarkMode ? Colors.white70 : const Color(0xff667085),
          ),
        ),
        SizedBox(
          height: 24.pHeight(context),
        ),
        Text(
          LocaleKeys
              .providerWidget_providerComponent_pModelBottomSheet_startDate,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.8),
            color: isDarkMode ? Colors.white70 : const Color(0xff667085),
          ),
        ),
        verticalSpaceXSmall(context),
        const CustomTextFields(
          hintText: 'DD.MM.YYYY',
        ),
        verticalSpaceSmall(context),
        Text(
          LocaleKeys.providerWidget_providerComponent_pModelBottomSheet_endDate,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.8),
            color: isDarkMode ? Colors.white70 : const Color(0xff667085),
          ),
        ),
        verticalSpaceXSmall(context),
        CustomTextFields(
          hintText: 'DD.MM.YYYY',
          suffixIcon: Icon(
            Icons.calendar_today,
            size: 20,
            color: Theme.of(context).secondaryHeaderColor,
          ),
        ),
        verticalSpaceSmall(context),
        Text(
          LocaleKeys
              .transactionWidget_TransactionComponents_filledPop_searchTerm,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.8),
            color: isDarkMode ? Colors.white70 : const Color(0xff667085),
          ),
        ),
        verticalSpaceXSmall(context),
        CustomTextFields(
          hintText: LocaleKeys
              .transactionWidget_TransactionComponents_filledPop_enterYourSearchTerm,
          password: false,
          suffixIcon: Icon(
            Icons.search,
            size: 20,
            color: Theme.of(context).secondaryHeaderColor,
          ),
        ),
        SizedBox(
          height: 50.pHeight(context),
        ),
        CustomButtons.generalButton(
          context: context,
          onTap: () {},
          text: LocaleKeys.confirm,
        )
      ],
    );
  }
}
