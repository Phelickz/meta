import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/auth/radio_button.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/asset_manager.dart';
import '../../../app/utils/theme.dart';
import '../../views/settings/settings_view_model.dart';

class ChartColorPage extends StatelessWidget {
  final SettingsViewModel model;

  const ChartColorPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: McGyver.rsDoubleW(context, 6)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceSmall(context),
            Text(
              LocaleKeys.presets,
              style: CustomThemeData.generateColoredStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, context: context),
            ),
            verticalSpaceSmall(context),
            CustomRadioButton(
                value: LocaleKeys.defaultText,
                groupValue: model.chartColor,
                onChanged: (chartColor) {
                  model.changeChartColor(chartColor);
                },
                label: LocaleKeys.defaultText,
                colorA: Colors.green,
                colorB: Colors.red),
            verticalSpaceSmall(context),
            CustomRadioButton(
                value: LocaleKeys.warm,
                groupValue: model.chartColor,
                onChanged: (chartColor) {
                  model.changeChartColor(chartColor);
                },
                label: LocaleKeys.warm,
                colorA: Colors.blue,
                colorB: Colors.red),
            verticalSpaceSmall(context),
            CustomRadioButton(
                value: LocaleKeys.marble,
                groupValue: model.chartColor,
                onChanged: (chartColor) {
                  model.changeChartColor(chartColor);
                },
                label: LocaleKeys.marble,
                colorA: Colors.white,
                colorB: Colors.grey)
          ],
        ),
      ),
    );
  }
}

class CustomRadioButton extends StatelessWidget {
  final String value;
  final String groupValue;
  final Function(String) onChanged;
  final String label;
  final Color colorA, colorB;

  const CustomRadioButton(
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
                      fontSize: McGyver.textSize(context, 1.8),
                      fontWeight: FontWeight.bold,
                      color: isDarkMode
                          ? ColorManager.darkText
                          : ColorManager.lightText,
                    ),
                  ),
                  verticalSpaceXXSmall(context),
                  Row(
                    children: [
                      Container(
                        width: 14.pWidth(context),
                        height: 14.pHeight(context),
                        color: colorA,
                      ),
                      horizontalSpaceXXSmall(context),
                      Container(
                        width: 14.pWidth(context),
                        height: 14.pHeight(context),
                        color: colorB,
                      )
                    ],
                  )
                ],
              ),
              const Spacer(),
              SvgPicture.asset(AssetManager.downTrendChart),
              SvgPicture.asset(AssetManager.downTrendChart),
              SvgPicture.asset(AssetManager.downTrendChart),
              // SvgPicture.asset(AssetManager.downTrendChart),
              // SvgPicture.asset(AssetManager.downTrendChart),
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
