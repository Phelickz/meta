import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/provider/provider_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/provider/components/provider_form_fields.dart';

class ProviderModalBottomsheet {
  static Widget tradeBottomSheet(ProviderViewModel viewModel) {
    return Builder(builder: (context) {
      var isDarkMode = CustomThemeData.isDarkMode(context);
      return Container(
        height: 500.pWidth(context),
        width: double.infinity,
        padding: EdgeInsets.symmetric(
            vertical: 20.pHeight(context), horizontal: 24.pWidth(context)),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.filter,
              style: CustomThemeData.generateColoredStyle(
                  fontSize: 12, context: context),
            ).tr(),
            SizedBox(
              height: 10.pHeight(context),
            ),
            ProviderFormFields.simpleFieldWithIcon(
                LocaleKeys
                    .providerWidget_providerComponent_pModelBottomSheet_startDate
                    .tr(),
                "DD.MM.YYYY",
                Icon(
                  Icons.calendar_month_outlined,
                  size: 20,
                  color: isDarkMode
                      ? const Color(0xFF98A2B3)
                      : const Color(0xFF667085),
                )),
            SizedBox(
              height: 20.pHeight(context),
            ),
            ProviderFormFields.simpleFieldWithIcon(
                LocaleKeys
                    .providerWidget_providerComponent_pModelBottomSheet_endDate
                    .tr(),
                "DD.MM.YYYY",
                Icon(
                  Icons.calendar_month_outlined,
                  size: 20,
                  color: isDarkMode
                      ? const Color(0xFF98A2B3)
                      : const Color(0xFF667085),
                )),
            SizedBox(
              height: 20.pHeight(context),
            ),
            ProviderFormFields.simpleFieldWithIcon(
                LocaleKeys.positions.tr(),
                LocaleKeys
                    .providerWidget_providerComponent_pModelBottomSheet_openPosition
                    .tr(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: isDarkMode
                      ? const Color(0xFF98A2B3)
                      : const Color(0xFF667085),
                )),
            Row(
              children: [
                Checkbox(
                    value: viewModel.checkbox,
                    onChanged: (_) => viewModel.toggleCheckbox()),
                Text(
                  LocaleKeys.profit.tr(),
                  style: CustomThemeData.generateColoredStyle(
                      fontSize: 16,
                      context: context,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(width: 28.pWidth(context)),
                Checkbox(
                    value: !viewModel.checkbox,
                    onChanged: (_) => viewModel.toggleCheckbox()),
                Text(
                  LocaleKeys.loss.tr(),
                  style: CustomThemeData.generateColoredStyle(
                      fontSize: 16,
                      context: context,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const Spacer(),
            CustomButtons.generalButton(
                context: context,
                onTap: () => Navigator.of(context).pop(),
                text: LocaleKeys.filter.tr(),
                width: double.infinity,
                textSize: 1.8)
          ],
        ),
      );
    });
  }

  static Widget followerBottomSheet(ProviderViewModel viewModel) {
    return Builder(builder: (context) {
      var isDarkMode = CustomThemeData.isDarkMode(context);
      return Container(
        height: 500.pWidth(context),
        width: double.infinity,
        padding: EdgeInsets.symmetric(
            vertical: 20.pHeight(context), horizontal: 24.pWidth(context)),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Theme.of(context).scaffoldBackgroundColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.filter,
              style: CustomThemeData.generateColoredStyle(
                  fontSize: 14, context: context),
            ).tr(),
            SizedBox(
              height: 20.pHeight(context),
            ),
            ProviderFormFields.simpleFieldWithIcon(
                LocaleKeys
                    .providerWidget_providerComponent_pModelBottomSheet_startDate
                    .tr(),
                "DD.MM.YYYY",
                Icon(
                  Icons.calendar_month_outlined,
                  size: 20,
                  color: isDarkMode
                      ? const Color(0xFF98A2B3)
                      : const Color(0xFF667085),
                )),
            SizedBox(
              height: 20.pHeight(context),
            ),
            ProviderFormFields.simpleFieldWithIcon(
                LocaleKeys
                    .providerWidget_providerComponent_pModelBottomSheet_endDate
                    .tr(),
                "DD.MM.YYYY",
                Icon(
                  Icons.calendar_month_outlined,
                  size: 20,
                  color: isDarkMode
                      ? const Color(0xFF98A2B3)
                      : const Color(0xFF667085),
                )),
            SizedBox(
              height: 20.pHeight(context),
            ),
            ProviderFormFields.simpleFieldWithIcon(
                LocaleKeys
                    .providerWidget_providerComponent_pModelBottomSheet_selectCountry
                    .tr(),
                "USA",
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: isDarkMode
                      ? const Color(0xFF98A2B3)
                      : const Color(0xFF667085),
                )),
            Row(
              children: [
                Checkbox(
                    value: viewModel.checkbox,
                    onChanged: (_) => viewModel.toggleCheckbox()),
                Text(
                  LocaleKeys.ascending.tr(),
                  style: CustomThemeData.generateColoredStyle(
                      fontSize: 16,
                      context: context,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(width: 28.pWidth(context)),
                Checkbox(
                    value: !viewModel.checkbox,
                    onChanged: (_) => viewModel.toggleCheckbox()),
                Text(
                  LocaleKeys.descending.tr(),
                  style: CustomThemeData.generateColoredStyle(
                      fontSize: 16,
                      context: context,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const Spacer(),
            CustomButtons.generalButton(
                context: context,
                onTap: () => Navigator.of(context).pop(),
                text: LocaleKeys.filter.tr(),
                width: double.infinity,
                textSize: 1.8)
          ],
        ),
      );
    });
  }
}
