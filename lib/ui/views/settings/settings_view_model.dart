// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/app/utils/strings_manager.dart';
import 'package:meta_trader/app/utils/theme.dart';
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
    "French",
    "Spanish",
    "Deutsch",
    "Bahasa",
    "Italiano",
    "vlaams"
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
    "WhatsApp addition",
    "add notice of upcoming signals",
    "adding different views on the market ection"
  ];

  List get updateFeatures => _updateFeatures;

  String _selectedTimezone = "Last 24 Hrs";
  String get selectedTimeZone => _selectedTimezone;

  String _chartColor = "Default";
  String get chartColor => _chartColor;

  String _colorPreference = "Blue-Buy/Red-Sell";
  String get colorPreference => _colorPreference;

  String _selectedLanguage = "English";
  String get selectedLanguage => _selectedLanguage;

  String _appVersion = "1.12.2";
  String get appVersion => _appVersion;

  SettingsPageEnum _settingsPageEnum = SettingsPageEnum.settings;
  SettingsPageEnum get settingsPageEnum => _settingsPageEnum;

  Map privacyPolicy = {
    "introduction":
        "Thank you for choosing Meta trader  as your trusted forex trading platform. We are committed to safeguarding your privacy and protecting your personal information. This Privacy Policy outlines how we collect, use, disclose, and safeguard your data. By accessing or using our services, you agree to the practices described in this policy.",
    "data": [
      {
        "heading": "Information Collection",
        "description":
            "We may collect various types of information from you when you use our platform or services, including:",
        "data": [
          {
            "subheading": "Personal Information",
            "description":
                "This may include your name, email address, phone number, residential address, date of birth, government-issued identification, and other necessary details required for account registration and compliance with financial regulations."
          },
          {
            "subheading": "Financial Information",
            "description":
                "To facilitate transactions, we may collect details related to your bank account, credit/debit card information, and transaction history."
          },
          {
            "subheading": "Device and Usag e Information",
            "description":
                "We may automatically collect information about your device, operating system, browser type, IP address, and interactions with our platform to improve our services and user experience."
          },
          {
            "subheading": "Cookies and Tracking Technologies",
            "description":
                "We may use cookies and similar technologies to gather information about your usage patterns and preferences while using our platform. This helps us to optimize our website, improve navigation, and personalize your experience"
          },
        ]
      },
      {
        "heading": "Data Sharing And Disclosure",
        "description":
            "We use the collected information for the following purposes",
        "data": [
          {
            "subheading": "Account Creation",
            "description":
                "To create and maintain your account, verify your identity, and provide customer support."
          },
          {
            "subheading": "Forex Trading Services",
            "description":
                "To process your trades, transactions, and withdrawals in accordance with your instructions."
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

  void changeLanguage(String language) {
    _selectedLanguage = language;
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
            context, "Settings", '', this, SettingsPageEnum.settings);
      case SettingsPageEnum.notificationSettings:
        return settingsAppBar(context, 'Notification Settings', '', this,
            SettingsPageEnum.notificationSettings);
      case SettingsPageEnum.languageSettings:
        return settingsAppBar(context, 'Language Settings',
            'Change app language', this, SettingsPageEnum.languageSettings);
      case SettingsPageEnum.chartColor:
        return settingsAppBar(
            context, 'Chart Color', '', this, SettingsPageEnum.chartColor);
      case SettingsPageEnum.colorPreference:
        return settingsAppBar(context, 'Color Preference', "", this,
            SettingsPageEnum.colorPreference);
      case SettingsPageEnum.changeBasis:
        return settingsAppBar(
            context, 'Change Basis', '', this, SettingsPageEnum.changeBasis);
      case SettingsPageEnum.aboutUs:
        return settingsAppBar(
            context, 'About Us', '', this, SettingsPageEnum.aboutUs);

      case SettingsPageEnum.privacyPolicy:
        return settingsAppBar(context, 'Privacy policy', '', this,
            SettingsPageEnum.privacyPolicy);

      case SettingsPageEnum.termsOfUSe:
        return settingsAppBar(
            context, 'Terms of use', '', this, SettingsPageEnum.termsOfUSe);
      case SettingsPageEnum.updateReleases:
        return null;
      default:
        return null;
    }
  }
}
