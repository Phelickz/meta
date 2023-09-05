import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';

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
          Text(
            "Change Preference",
            style: CustomThemeData.generateColoredStyle(
                fontSize: 16, fontWeight: FontWeight.bold, context: context),
          ),
          verticalSpaceSmall(context),
          CustomPreferenceRatioButton(
              value: "Blue-Buy/Red-Sell",
              groupValue: model.chartColor,
              onChanged: (chartColor) {
                model.changeChartColor(chartColor);
              },
              label: "Blue-Buy/Red-Sell",
              colorA: Colors.red,
              colorB: Colors.blue),
          verticalSpaceSmall(context),
          CustomPreferenceRatioButton(
              value: "Blue-Sell/Red-Buy",
              groupValue: model.chartColor,
              onChanged: (chartColor) {
                model.changeChartColor(chartColor);
              },
              label: "Blue-Sell/Red-Buy",
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
      child: Container(
        height: 100.pHeight(context),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.pWidth(context)),
        decoration: BoxDecoration(
          color: isDarkMode
              ? const Color(0xff052844)
              : Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 4,
              offset: Offset(0, 3), // Adjust the offset as needed
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            SizedBox(width: 8.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(label),
                Row(
                  children: [
                    Container(
                      child: Text("Sell at 1.23456"),
                      color: colorA,
                    ),
                    Container(
                      child: Text("Buy at 1.23456"),
                      color: colorB,
                    ),
                  ],
                )
              ],
            ),
            Spacer(),
            Container(
              width: 24.0,
              height: 24.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2.0,
                  color: Colors.blue,
                ),
              ),
              child: Center(
                child: value == groupValue
                    ? Container(
                        width: 12.0,
                        height: 12.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
