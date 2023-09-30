import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/responsiveness/size.dart';
import '../../../../app/utils/theme.dart';
import '../../buttons/buttons.dart';
import '../../date_picker/label_date_picker.dart';

class CustomPeriodModal extends StatelessWidget {
  const CustomPeriodModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: McGyver.rsDoubleH(context, 55),
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleH(context, 2),
        vertical: McGyver.rsDoubleH(context, 4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.customPeriod,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.9),
              fontWeight: FontWeight.w500,
              color: const Color(0xFF98A2B3),
            ),
          ).tr(),
          verticalSpaceSmall(context),
          verticalSpaceXSmall(context),
          LabelDatePicker(
            label: LocaleKeys
                .providerWidget_providerComponent_pModelBottomSheet_startDate
                .tr(),
            context: context,
            onDateSelected: (date) {},
          ),
          LabelDatePicker(
            label: LocaleKeys
                .providerWidget_providerComponent_pModelBottomSheet_endDate
                .tr()
                .tr(),
            context: context,
            selectedDate: null,
            lastDate: null,
            onDateSelected: (date) {},
          ),
          verticalSpaceMedium(context),
          CustomButtons.generalButton(
            context: context,
            onTap: () {
              Navigator.pop(context);
            },
            text: LocaleKeys.confirm.tr(),
          ),
        ],
      ),
    );
  }
}
