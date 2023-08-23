import 'package:flutter/material.dart';

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

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: McGyver.rsDoubleW(context, 6)),
      child: Column(
        children: [
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: CustomTextFields(
              hintText: SettingsStringsManager.search,
              suffixIcon: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: ListView.builder(
                  itemCount: model.languages.length,
                  itemBuilder: (context, index) {
                    final isSelected =
                        model.selectedLanguage == model.languages[index];

                    return ListTile(
                      title: Row(
                        children: [
                          Text(model.languages[index],
                              style: CustomThemeData.generateStyle(
                                fontSize: McGyver.textSize(context, 1.5),
                                color: isDarkMode
                                    ? Colors.white54
                                    : const Color(0xff667085),
                                fontWeight: FontWeight.normal,
                              )),
                          Spacer(), // Space to push radio button to the right
                          Radio<String>(
                            value: model.languages[index],
                            groupValue: model.selectedLanguage,
                            onChanged: (value) {
                              model.changeLanguage(value!);
                            },
                          ),
                        ],
                      ),
                      onTap: () {
                        model.changeLanguage(model.languages[index]);
                      },
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
