// ignore_for_file: prefer_final_fields

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/app/utils/strings_manager.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/settings/change_basis.dart';
import 'package:meta_trader/ui/widgets/settings/chart_color.dart';
import 'package:meta_trader/ui/widgets/settings/color_preference.dart';
import 'package:meta_trader/ui/widgets/settings/language_settings.dart';
import 'package:meta_trader/ui/widgets/settings/notification_settings.dart';
import 'package:meta_trader/ui/widgets/settings/privacy_policy.dart';
import 'package:meta_trader/ui/widgets/settings/settings.dart';
import 'package:meta_trader/ui/widgets/settings/terms_of_use.dart';
import 'package:meta_trader/ui/widgets/settings/update_releases.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../../widgets/settings/about_us.dart';
import '../../widgets/settings/components/app_bar.dart';
import 'package:easy_localization/easy_localization.dart';

enum SettingsPageEnum {
  settings,
  notificationSettings,
  languageSettings,
  chartColor,
  colorPreference,
  changeBasis,
  aboutUs,
  updateReleases,
  privacyPolicy,
  termsOfUSe
}

class SettingsViewModel extends CustomBaseViewModel {
  bool _isDarkMode = false;

  List switchValues = [
    {"title": SettingsStringsManager.tradeNotification, "value": false},
    {"title": SettingsStringsManager.forexNews, "value": false},
    {"title": SettingsStringsManager.socialTradingPrompts, "value": false},
    {"title": SettingsStringsManager.systemMessages, "value": false},
    {"title": SettingsStringsManager.risksPrompt, "value": false},
  ];

  List _languages = [
    "English",
    "Arabic",
    "Persian",
  ];

  List get languages => _languages;

  List _timeZones = [
    "Last 24 Hrs",
    "UTC+1, 00:00 (Device time zone)",
    "UTC+12, 00:00",
    "UTC+11, 00:00",
    "UTC+10, 00:00",
    "UTC+9, 00:00",
    "UTC+8, 00:00"
  ];

  List get timezones => _timeZones;
  List _updateFeatures = [
    LocaleKeys.views_settings_whatsappAddition,
    LocaleKeys.views_settings_addNoticeOfUpcoming,
    LocaleKeys.views_settings_addingDifferentViews
  ];

  List get updateFeatures => _updateFeatures;

  String _selectedTimezone = LocaleKeys.last2Hrs;
  String get selectedTimeZone => _selectedTimezone;

  String _chartColor = LocaleKeys.defaultText;
  String get chartColor => _chartColor;

  String _colorPreference = LocaleKeys.views_settings_blueBuy;
  String get colorPreference => _colorPreference;

  String _selectedLanguage = "English";
  String get selectedLanguage => _selectedLanguage;

  String _appVersion = "1.12.2";
  String get appVersion => _appVersion;

  SettingsPageEnum _settingsPageEnum = SettingsPageEnum.settings;
  SettingsPageEnum get settingsPageEnum => _settingsPageEnum;

  Map privacyPolicy = {
    "introduction": LocaleKeys.views_settings_privacyPolicy_privacyPolicyIntro,
    "data": [
      {
        "heading": LocaleKeys.views_settings_privacyPolicy_privacyPolicyHead1,
        "description": LocaleKeys.views_settings_privacyPolicy_privacyPolicyD2,
        "data": [
          {
            "subheading":
                LocaleKeys.views_settings_privacyPolicy_privacyPolicySubH,
            "description":
                LocaleKeys.views_settings_privacyPolicy_privacyPolicyD3
          },
          {
            "subheading":
                LocaleKeys.views_settings_privacyPolicy_privacyPolicySubH1,
            "description":
                LocaleKeys.views_settings_privacyPolicy_privacyPolicyD4
          },
          {
            "subheading":
                LocaleKeys.views_settings_privacyPolicy_privacyPolicySubH2,
            "description":
                LocaleKeys.views_settings_privacyPolicy_privacyPolicyD5
          },
          {
            "subheading":
                LocaleKeys.views_settings_privacyPolicy_privacyPolicySubH3,
            "description":
                LocaleKeys.views_settings_privacyPolicy_privacyPolicyD6
          },
        ]
      },
      {
        "heading": LocaleKeys.views_settings_privacyPolicy_privacyPolicyHead2,
        "description": LocaleKeys.views_settings_privacyPolicy_privacyPolicyD7,
        "data": [
          {
            "subheading":
                LocaleKeys.views_settings_privacyPolicy_privacyPolicySubH4,
            "description":
                LocaleKeys.views_settings_privacyPolicy_privacyPolicyD8
          },
          {
            "subheading":
                LocaleKeys.views_settings_privacyPolicy_privacyPolicySubH5,
            "description":
                LocaleKeys.views_settings_privacyPolicy_privacyPolicyD9
          },
        ]
      },
    ],
  };
  set setSettingsPageEnum(SettingsPageEnum e) {
    _settingsPageEnum = e;
    rebuildUi();
  }

  set appVersion(String version) {
    _appVersion = version;
    rebuildUi();
  }

  void toggleThemeMode(BuildContext context) {
    _isDarkMode = !_isDarkMode;
    if (CustomThemeData.isDarkMode(context)) {
      getThemeManager(context).setThemeMode(ThemeMode.light);
    } else {
      getThemeManager(context).setThemeMode(ThemeMode.dark);
    }
    rebuildUi();
  }

  void toggleThemeModeSystem(BuildContext context) {
    if (isSystemMode(context) == true) {
      getThemeManager(context).setThemeMode(ThemeMode.light);
    } else {
      getThemeManager(context).setThemeMode(ThemeMode.system);
    }

    rebuildUi();
  }

  void changeLanguage(String language, BuildContext context) {
    _selectedLanguage = language;
    if (kDebugMode) {
      print(language);
    }
    if (language == 'English') {
      context.setLocale(const Locale('en'));
    }

    if (language == 'Arabic') {
      context.setLocale(const Locale('ar'));
    }

    if (language == 'Persian') {
      context.setLocale(const Locale('fa'));
    }
    rebuildUi();
  }

  void changeTimezone(String timezone) {
    _selectedTimezone = timezone;
    rebuildUi();
  }

  void changeChartColor(String chartColor) {
    _chartColor = chartColor;
    rebuildUi();
  }

  void changeColorPreference(String colorPreference) {
    _colorPreference = colorPreference;
    rebuildUi();
  }

  void toggleSwitch(int index, bool value) {
    switchValues[index]["value"] = value;
    rebuildUi();
  }

  Widget returnPage() {
    switch (_settingsPageEnum) {
      case SettingsPageEnum.settings:
        return SettingsPage(model: this);
      case SettingsPageEnum.notificationSettings:
        return NotificationSettingsPage(model: this);
      case SettingsPageEnum.languageSettings:
        return LanguageSettingsPage(model: this);
      case SettingsPageEnum.colorPreference:
        return ColorPreferencesPage(model: this);
      case SettingsPageEnum.chartColor:
        return ChartColorPage(model: this);
      case SettingsPageEnum.changeBasis:
        return ChangeBasisPage(model: this);
      case SettingsPageEnum.aboutUs:
        return AboutUsPage(model: this);
      case SettingsPageEnum.updateReleases:
        return UpdateReleasePage(model: this);
      case SettingsPageEnum.termsOfUSe:
        return TermsOfUsePage(model: this);
      case SettingsPageEnum.privacyPolicy:
        return PrivacyPolicyPage(model: this);
      default:
        return Container();
    }
  }

  AppBar? returnAppBar(BuildContext context) {
    switch (_settingsPageEnum) {
      case SettingsPageEnum.settings:
        return settingsAppBar(
            context, LocaleKeys.settings, '', this, SettingsPageEnum.settings);
      case SettingsPageEnum.notificationSettings:
        return settingsAppBar(
            context,
            LocaleKeys.views_settings_notificationSettings,
            '',
            this,
            SettingsPageEnum.notificationSettings);
      case SettingsPageEnum.languageSettings:
        return settingsAppBar(
            context,
            LocaleKeys.views_settings_languageSettings,
            LocaleKeys.views_settings_changeAppLanguage,
            this,
            SettingsPageEnum.languageSettings);
      case SettingsPageEnum.chartColor:
        return settingsAppBar(context, LocaleKeys.chartColor, '', this,
            SettingsPageEnum.chartColor);
      case SettingsPageEnum.colorPreference:
        return settingsAppBar(context, LocaleKeys.colorPreference, "", this,
            SettingsPageEnum.colorPreference);
      case SettingsPageEnum.changeBasis:
        return settingsAppBar(context, LocaleKeys.settings_changeBasis, '',
            this, SettingsPageEnum.changeBasis);
      case SettingsPageEnum.aboutUs:
        return settingsAppBar(
            context, LocaleKeys.aboutUs, '', this, SettingsPageEnum.aboutUs);

      case SettingsPageEnum.privacyPolicy:
        return settingsAppBar(context, LocaleKeys.privacyPolicyText, '', this,
            SettingsPageEnum.privacyPolicy);

      case SettingsPageEnum.termsOfUSe:
        return settingsAppBar(context, LocaleKeys.views_settings_TermsOfUse, '',
            this, SettingsPageEnum.termsOfUSe);
      case SettingsPageEnum.updateReleases:
        return null;
      default:
        return null;
    }
  }
}
