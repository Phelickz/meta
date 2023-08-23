import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/ui/views/settings/settings_view_model.dart';
import 'package:meta_trader/ui/widgets/settings/components/notification_settings_tile.dart';
import 'package:meta_trader/ui/widgets/settings/components/settings_tile.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';

class SettingsPage extends StatelessWidget {
  final SettingsViewModel model;
  const SettingsPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: McGyver.rsDoubleW(context, 6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.pHeight(context),
            ),
            Text(
              "General",
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.5),
                color: isDarkMode ? Colors.white54 : const Color(0xff667085),
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 28.pHeight(context),
            ),
            BasicSettingsTile(title: "Push Notifications"),
            verticalSpaceSmall(context),
            BasicSettingsTile(title: "Language"),
            SizedBox(
              height: 40.pHeight(context),
            ),
            Text(
              "Appearance",
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.5),
                color: isDarkMode ? Colors.white54 : const Color(0xff667085),
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 28.pHeight(context),
            ),
            NotificationSettingsTile(
                title: "Dark Mode",
                value: model.isDarkMode(),
                onChanged: (value) {
                  model.toggleThemeMode(value);
                }),
            BasicSettingsTile(title: "Chart Color"),
            verticalSpaceSmall(context),
            BasicSettingsTile(title: "Color Preference"),
            SizedBox(
              height: 48.pHeight(context),
            ),
            Text("Market",
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.5),
                  color: isDarkMode ? Colors.white54 : const Color(0xff667085),
                  fontWeight: FontWeight.normal,
                )),
            verticalSpaceSmall(context),
            BasicSettingsTile(title: "Change Basis"),
            SizedBox(
              height: 52.pHeight(context),
            ),
            Text("Others",
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.5),
                  color: isDarkMode ? Colors.white54 : const Color(0xff667085),
                  fontWeight: FontWeight.normal,
                )),
            verticalSpaceSmall(context),
            BasicSettingsTile(
              title: "Privacy Policy",
              isArrowTrailing: false,
              secondaryTrailing: SizedBox(),
            ),
            verticalSpaceSmall(context),
            BasicSettingsTile(
              title: "About Us",
            ),
            verticalSpaceSmall(context),
            BasicSettingsTile(
              title: "Current version",
              isArrowTrailing: false,
              secondaryTrailing: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
