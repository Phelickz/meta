import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/size.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/utils/strings_manager.dart';
import '../../../app/utils/theme.dart';
import '../../views/settings/settings_view_model.dart';
import '../textfields/textfield.dart';

class LanguageSettingsPage extends StatelessWidget {
  final SettingsViewModel model;

  const LanguageSettingsPage({Key? key, required this.model}) : super(key: key);

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
          height: 100,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: McGyver.textSize(context, 2),
              ),
              child: CustomTextFields(
                hintText: SettingsStringsManager.search,
                suffixIcon: Icon(
                  Icons.search,
                  color: isDarkMode ? Colors.white38 : Colors.black,
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
                  itemCount: model.languages.length,
                  itemBuilder: (context, index) {
                    // final isSelected =
                    //     model.selectedLanguage == model.languages[index];

                    return ListTile(
                      title: Row(
                        children: [
                          Text(model.languages[index],
                              style: CustomThemeData.generateStyle(
                                fontSize: McGyver.textSize(context, 1.6),
                                color: isDarkMode
                                    ? Colors.white
                                    : const Color(0xff667085),
                                fontWeight: FontWeight.w700,
                              )),
                          const Spacer(), // Space to push radio button to the right
                          Theme(
                            data: ThemeData(
                                unselectedWidgetColor:
                                    isDarkMode ? Colors.white : Colors.black),
                            child: Radio<String>(
                              value: model.languages[index],
                              // groupValue: model.selectedLanguage,
                              groupValue: context.locale.toString() == 'en'
                                  ? 'English'
                                  : context.locale.toString() == 'ar'
                                      ? 'Arabic'
                                      : context.locale.toString() == 'fa'
                                          ? 'Persian'
                                          : context.locale.toString(),
                              onChanged: (value) {
                                model.changeLanguage(value!, context);
                              },
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        model.changeLanguage(model.languages[index], context);
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
