import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/auth/radio_button.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';
import '../../views/settings/settings_view_model.dart';

class ColorPreferencesPage extends StatelessWidget {
  final SettingsViewModel model;

  const ColorPreferencesPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: McGyver.rsDoubleW(context, 6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceXSmall(context),
          Text(
            LocaleKeys.changePreference,
            style: CustomThemeData.generateColoredStyle(
                fontSize: McGyver.textSize(context, 2),
                fontWeight: FontWeight.bold,
                context: context),
          ).tr(),
          verticalSpaceSmall(context),
          CustomPreferenceRatioButton(
              value:
                  LocaleKeys.settings_colorPreferenceWidget_blueBuyRedSell.tr(),
              groupValue: model.chartColor,
              onChanged: (chartColor) {
                model.changeChartColor(chartColor);
              },
              label:
                  LocaleKeys.settings_colorPreferenceWidget_blueBuyRedSell.tr(),
              colorA: Colors.red,
              colorB: Colors.blue),
          verticalSpaceSmall(context),
          CustomPreferenceRatioButton(
              value:
                  LocaleKeys.settings_colorPreferenceWidget_blueSellRedBuy.tr(),
              groupValue: model.chartColor,
              onChanged: (chartColor) {
                model.changeChartColor(chartColor);
              },
              label:
                  LocaleKeys.settings_colorPreferenceWidget_blueSellRedBuy.tr(),
              colorA: Colors.blue,
              colorB: Colors.red),
          verticalSpaceSmall(context),
        ],
      ),
    );
  }
}

class CustomPreferenceRatioButton extends StatelessWidget {
  final String value;
  final String groupValue;
  final Function(String) onChanged;
  final String label;
  final Color colorA, colorB;

  const CustomPreferenceRatioButton(
      {super.key,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      required this.label,
      required this.colorA,
      required this.colorB});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return InkWell(
      onTap: () {
        onChanged(value);
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: isDarkMode ? Colors.white12 : Colors.black12,
          ),
        ),
        child: Container(
          // height: 120.pHeight(context),
          // width: double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal: 16.pWidth(context), vertical: 23.pHeight(context)),
          decoration: BoxDecoration(
            color: isDarkMode
                ? const Color(0xff052844)
                : Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(8),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.3),
            //     spreadRadius: 3,
            //     blurRadius: 4,
            //     offset: const Offset(0, 3), // Adjust the offset as needed
            //   ),
            // ],
          ),
          child: Row(
            children: <Widget>[
              const SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.9),
                      fontWeight: FontWeight.bold,
                      color: isDarkMode
                          ? ColorManager.darkText
                          : ColorManager.lightText,
                    ),
                  ),
                  verticalSpaceXSmall(context),
                  Row(
                    children: [
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: colorA,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14.0,
                                vertical: 10,
                              ),
                              child: Text(
                                "Sell at 1.23456",
                                style: CustomThemeData.generateStyle(
                                    fontSize: McGyver.textSize(context, 1),
                                    fontWeight: FontWeight.bold,
                                    color: isDarkMode
                                        ? Colors.white60
                                        : Colors.white60),
                              ),
                            ),
                          ),
                          verticalSpaceXXSmall(context),
                          Row(
                            children: [
                              Container(
                                width: 42,
                                height: 2,
                                decoration: BoxDecoration(
                                  color: colorA,
                                ),
                              ),
                              Container(
                                width: 42,
                                height: 2,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          verticalSpaceXXSmall(context),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "23%",
                              textAlign: TextAlign.center,
                              style: CustomThemeData.generateStyle(
                                fontSize: McGyver.textSize(context, 1),
                                color: colorA,
                              ),
                            ),
                          ),
                        ],
                      ),
                      horizontalSpaceXSmall(context),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: colorB,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14.0,
                                vertical: 10,
                              ),
                              child: Text(
                                "Buy at 1.23456",
                                style: CustomThemeData.generateStyle(
                                    fontSize: McGyver.textSize(context, 1),
                                    fontWeight: FontWeight.bold,
                                    color: isDarkMode
                                        ? Colors.white60
                                        : Colors.white60),
                              ),
                            ),
                          ),
                          verticalSpaceXXSmall(context),
                          Row(
                            children: [
                              Container(
                                width: 42,
                                height: 2,
                                decoration: BoxDecoration(
                                  color: colorB,
                                ),
                              ),
                              Container(
                                width: 42,
                                height: 2,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          verticalSpaceXXSmall(context),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "23%",
                              textAlign: TextAlign.center,
                              style: CustomThemeData.generateStyle(
                                fontSize: McGyver.textSize(context, 1),
                                color: colorA,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const Spacer(),
              // SvgPicture.asset(AssetManager.downTrendChart),
              // SvgPicture.asset(AssetManager.downTrendChart),
              SvgPicture.asset(AssetManager.downTrendChart),
              const Spacer(),
              Transform.scale(
                scale: 2.0,
                child: CustomRadioWidget(
                  value: value,
                  groupValue: groupValue,
                  onChanged: onChanged,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
