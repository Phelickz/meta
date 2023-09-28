import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/textfields/label_search_field.dart';

import '../../buttons/buttons.dart';
import '../../date_picker/label_date_picker.dart';

class FilterTransactionModal extends StatelessWidget {
  const FilterTransactionModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: McGyver.rsDoubleH(context, 64),
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleH(context, 2),
        vertical: McGyver.rsDoubleH(context, 4),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.filterBy,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.5),
                fontWeight: FontWeight.w500,
                color: const Color(0xFF98A2B3),
              ),
            ),
            verticalSpaceSmall(context),
            LabelDatePicker(
              label: LocaleKeys
                  .providerWidget_providerComponent_pModelBottomSheet_startDate,
              context: context,
              onDateSelected: (date) {},
            ),
            LabelDatePicker(
              label: LocaleKeys
                  .providerWidget_providerComponent_pModelBottomSheet_endDate,
              context: context,
              selectedDate: null,
              lastDate: null,
              onDateSelected: (date) {},
            ),
            const LabelSearchField(
              label: LocaleKeys
                  .socialTradingWidget_socialTradingComponent_filterModel_searchTransaction,
              controller: null,
              hintText: LocaleKeys
                  .socialTradingWidget_socialTradingComponent_filterModel_enterYourSearch,
            ),
            verticalSpaceSmall(context),
            CustomButtons.generalButton(
              context: context,
              onTap: () {
                Navigator.pop(context);
              },
              text: LocaleKeys.confirm,
            ),
          ],
        ),
      ),
    );
  }
}
