import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/ui/views/settings/settings_view_model.dart';
import 'package:meta_trader/ui/widgets/settings/components/settings_tile.dart';

import '../../../app/responsiveness/res.dart';
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
          children: [
            SizedBox(
              height: 15.pHeight(context),
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
              height: 15.pHeight(context),
            ),
            BasicSettingsTile(title: "Push Notifications"),
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
              height: 200.pHeight(context),
            ),
            Text("Market",
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.5),
                  color: isDarkMode ? Colors.white54 : const Color(0xff667085),
                  fontWeight: FontWeight.normal,
                )),
            BasicSettingsTile(title: "Change Basis"),
            SizedBox(
              height: 40.pHeight(context),
            ),
            Text("Others",
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.5),
                  color: isDarkMode ? Colors.white54 : const Color(0xff667085),
                  fontWeight: FontWeight.normal,
                )),
            BasicSettingsTile(
              title: "Privacy Policy",
              isArrowTrailing: false,
              secondaryTrailing: SizedBox(),
            ),
            BasicSettingsTile(
              title: "About Us",
            ),
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
