// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/app/utils/strings_manager.dart';
import 'package:meta_trader/ui/widgets/settings/change_basis.dart';
import 'package:meta_trader/ui/widgets/settings/chart_color.dart';
import 'package:meta_trader/ui/widgets/settings/color_preference.dart';
import 'package:meta_trader/ui/widgets/settings/language_settings.dart';
import 'package:meta_trader/ui/widgets/settings/notification_settings.dart';
import 'package:meta_trader/ui/widgets/settings/settings.dart';
import 'package:meta_trader/ui/widgets/settings/update_releases.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../../../app/locator/locator.dart';
import '../../../app/services/theme_service.dart';
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
  updateReleases
}

class SettingsViewModel extends CustomBaseViewModel {
  bool _isDarkMode = false;
  final _themeService = locator<ThemeServices>();

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

  String _selectedLanguage = "English";
  String get selectedLanguage => _selectedLanguage;

  String _appVersion = "1.12.2";
  String get appVersion => _appVersion;

  SettingsPageEnum _settingsPageEnum = SettingsPageEnum.settings;
  SettingsPageEnum get settingsPageEnum => _settingsPageEnum;

  set setSettingsPageEnum(SettingsPageEnum e) {
    _settingsPageEnum = e;
    rebuildUi();
  }

  set appVersion(String version) {
    _appVersion = version;
    rebuildUi();
  }

  void toggleThemeMode(bool value) {
    _isDarkMode = !_isDarkMode;
    _themeService.themeService.setThemeMode(
        _isDarkMode ? ThemeManagerMode.dark : ThemeManagerMode.light);
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
      case SettingsPageEnum.updateReleases:
        return null;
      default:
        return null;
    }
  }
}
