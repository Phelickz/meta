import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/settings/components/about_us_tile.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/utils/theme.dart';
import '../../views/settings/settings_view_model.dart';

class AboutUsPage extends StatelessWidget {
  final SettingsViewModel model;

  const AboutUsPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 6),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 60.pHeight(context),
          ),
          Image.asset(
            'assets/images/launcher.png',
            height: 80,
          ),
          verticalSpaceXXSmall(context),
          Center(
            child: Text(
              model.appVersion,
              style: CustomThemeData.generateStyle(
                fontSize: 16,
                color: isDarkMode ? Colors.white54 : const Color(0xff667085),
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          SizedBox(
            height: 30.pHeight(context),
          ),
          AboutUsTile(
              title: LocaleKeys.settings_aboutUs_serviceAgreement.tr(),
              leading: AssetManager.agreement),
          SizedBox(
            height: 20.pHeight(context),
          ),
          AboutUsTile(
              title: LocaleKeys.settings_aboutUs_likeUsOnFacebook.tr(),
              leading: AssetManager.facebook),
          SizedBox(
            height: 20.pHeight(context),
          ),
          AboutUsTile(
              title: LocaleKeys.settings_aboutUs_followUsOnTwitter.tr(),
              leading: AssetManager.facebook),
          SizedBox(
            height: 20.pHeight(context),
          ),
          AboutUsTile(
              title: LocaleKeys.settings_aboutUs_joinUsOnTelegram.tr(),
              leading: AssetManager.facebook),
          SizedBox(
            height: 20.pHeight(context),
          ),
          AboutUsTile(
            title: LocaleKeys.settings_aboutUs_checkForUpdate.tr(),
            leading: AssetManager.refresh,
            isArrowTrailing: false,
            secondaryTrailing: Text(
              model.appVersion,
              style: CustomThemeData.generateStyle(
                fontSize: 16,
                color: isDarkMode ? Colors.white54 : const Color(0xff667085),
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
