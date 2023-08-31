import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
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
    return Container(
      child: Column(
        children: [
          Text(
            'Filter by',
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
            'Start Date',
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
            'End Date',
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
            'Search Term',
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.8),
              color: isDarkMode ? Colors.white70 : const Color(0xff667085),
            ),
          ),
          verticalSpaceXSmall(context),
          CustomTextFields(
            hintText: 'Enter your search term',
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
              context: context, onTap: () {}, text: "Confirm")
        ],
      ),
    );
  }
}
