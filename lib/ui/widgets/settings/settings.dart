import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
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
              LocaleKeys.general,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.7),
                color: isDarkMode ? Colors.white54 : const Color(0xff667085),
                fontWeight: FontWeight.w900,
              ),
            ).tr(),
            SizedBox(
              height: 28.pHeight(context),
            ),
            BasicSettingsTile(
              title: LocaleKeys.settings_settingsPage_pushNotification.tr(),
              onTap: () {
                model.setSettingsPageEnum =
                    SettingsPageEnum.notificationSettings;
              },
            ),
            verticalSpaceSmall(context),
            BasicSettingsTile(
              title: LocaleKeys.language.tr(),
              onTap: () {
                model.setSettingsPageEnum = SettingsPageEnum.languageSettings;
              },
            ),
            SizedBox(
              height: 40.pHeight(context),
            ),
            Text(
              LocaleKeys.appearance,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.7),
                color: isDarkMode ? Colors.white54 : const Color(0xff667085),
                fontWeight: FontWeight.w900,
              ),
            ).tr(),
            SizedBox(
              height: 28.pHeight(context),
            ),
            NotificationSettingsTile(
              title: LocaleKeys.settings_settingsPage_useDeviceTheme.tr(),
              value: model.isSystemMode(context),
              onChanged: (value) {
                model.toggleThemeModeSystem(context);
              },
            ),
            NotificationSettingsTile(
              title: LocaleKeys.settings_settingsPage_darkMode.tr(),
              value: CustomThemeData.isDarkMode(context),
              onChanged: (value) {
                model.toggleThemeMode(context);
              },
            ),
            verticalSpaceXSmall(context),
            BasicSettingsTile(
              title: LocaleKeys.chartColor.tr(),
              onTap: () {
                model.setSettingsPageEnum = SettingsPageEnum.chartColor;
              },
            ),
            verticalSpaceSmall(context),
            BasicSettingsTile(
              title: LocaleKeys.colorPreference.tr(),
              onTap: () {
                model.setSettingsPageEnum = SettingsPageEnum.colorPreference;
              },
            ),
            // SizedBox(
            //   height: 48.pHeight(context),
            // ),
            // Text(
            //   LocaleKeys.market,
            //   style: CustomThemeData.generateStyle(
            //     fontSize: McGyver.textSize(context, 1.7),
            //     color: isDarkMode ? Colors.white54 : const Color(0xff667085),
            //     fontWeight: FontWeight.w900,
            //   ),
            // ).tr(),
            // verticalSpaceSmall(context),
            // BasicSettingsTile(
            //   title: LocaleKeys.views_settings_changeBasis.tr(),
            //   onTap: () {
            //     model.setSettingsPageEnum = SettingsPageEnum.changeBasis;
            //   },
            // ),
            SizedBox(
              height: 52.pHeight(context),
            ),
            Text(
              LocaleKeys.others,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.7),
                color: isDarkMode ? Colors.white54 : const Color(0xff667085),
                fontWeight: FontWeight.w900,
              ),
            ).tr(),
            verticalSpaceSmall(context),
            BasicSettingsTile(
              title: LocaleKeys.privacyPolicyText.tr(),
              isArrowTrailing: false,
              secondaryTrailing: const SizedBox(),
              onTap: () {
                // model.setSettingsPageEnum = SettingsPageEnum.;
              },
            ),
            verticalSpaceSmall(context),
            BasicSettingsTile(
              title: LocaleKeys.aboutUs.tr(),
              onTap: () {
                model.setSettingsPageEnum = SettingsPageEnum.aboutUs;
              },
            ),
            verticalSpaceSmall(context),
            BasicSettingsTile(
              title: LocaleKeys.settings_settingsPage_currentVersion.tr(),
              isArrowTrailing: false,
              secondaryTrailing: const SizedBox(),
              onTap: () {
                // model.setSettingsPageEnum = SettingsPageEnum.;
              },
            ),
          ],
        ),
      ),
    );
  }
}
