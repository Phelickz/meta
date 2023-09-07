import 'package:flutter/material.dart';
import 'package:meta_trader/ui/widgets/auth/radio_button.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';
import '../../views/settings/settings_view_model.dart';

class ChangeBasisPage extends StatelessWidget {
  final SettingsViewModel model;

  const ChangeBasisPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return Column(
      children: [
        Container(
          color: isDarkMode
              ? const Color(0xff052844)
              : Theme.of(context).scaffoldBackgroundColor,
          width: double.infinity,
          height: 80,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: McGyver.textSize(context, 2),
              ),
              child: Text(
                "When you switch to a new UTC time zone, the change (%) for markets and trades will be calculated based on the new time zone ",
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.6),
                  color: isDarkMode ? Colors.white : const Color(0xff667085),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        verticalSpaceSmall(context),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: McGyver.textSize(context, 2),
            ),
            child: SizedBox(
              width: double.infinity,
              child: ListView.builder(
                  itemCount: model.timezones.length,
                  itemBuilder: (context, index) {
                    // final isSelected =
                    //     model.selectedLanguage == model.timezones[index];

                    return ListTile(
                      title: Row(
                        children: [
                          Text(
                            model.timezones[index],
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.6),
                              color: isDarkMode
                                  ? Colors.white
                                  : const Color(0xff667085),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                          // Space to push radio button to the right
                          Transform.scale(
                            scale: 2.0,
                            child: CustomRadioWidget(
                              value: model.timezones[index],
                              groupValue: model.selectedLanguage,
                              onChanged: (value) {
                                model.changeLanguage(value.toString());
                              },
                            ),
                          ),
                          // Theme(
                          //   data: ThemeData(
                          //       unselectedWidgetColor:
                          //           isDarkMode ? Colors.white : Colors.black),
                          //   child: Radio<String>(
                          //     value: model.timezones[index],
                          //     groupValue: model.selectedLanguage,
                          //     onChanged: (value) {
                          //       model.changeLanguage(value!);
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                      onTap: () {
                        model.changeLanguage(model.timezones[index]);
                      },
                    );
                  }),
            ),
          ),
        ),
      ],
    );
  }
}
