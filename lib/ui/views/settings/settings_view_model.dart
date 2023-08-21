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

import '../../widgets/settings/components/app_bar.dart';

enum SettingsPageEnum {
  settings,
  notificationSettings,
  languageSettings,
  chartColor,
  colorPreference,
  changeBasis
}

class SettingsViewModel extends CustomBaseViewModel {
  List switchValues = [
    {"title": SettingsStringsManager.tradeNotification, "value": false},
    {"title": SettingsStringsManager.tradeNotification, "value": false},
    {"title": SettingsStringsManager.tradeNotification, "value": false},
    {"title": SettingsStringsManager.tradeNotification, "value": false},
    {"title": SettingsStringsManager.tradeNotification, "value": false},
  ];

  SettingsPageEnum _settingsPageEnum = SettingsPageEnum.settings;
  SettingsPageEnum get settingsPageEnum => _settingsPageEnum;
  set setSettingsPageEnum(SettingsPageEnum e) {
    _settingsPageEnum = e;
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
      default:
        return Container();
    }
  }

  AppBar? returnAppBar(BuildContext context) {
    switch (_settingsPageEnum) {
      case SettingsPageEnum.settings:
        return settingsAppBar(context, "Settings", '', this);
      case SettingsPageEnum.notificationSettings:
        return settingsAppBar(context, 'Notification Settings', '', this);
      case SettingsPageEnum.languageSettings:
        return settingsAppBar(
            context, 'Language Settings', 'choose app language', this);
      case SettingsPageEnum.chartColor:
        return settingsAppBar(context, 'Chart Color', '', this);
      case SettingsPageEnum.colorPreference:
        return settingsAppBar(context, 'Color Preference', "", this);
      case SettingsPageEnum.changeBasis:
        return settingsAppBar(context, 'Change Basis', '', this);
      default:
        return null;
    }
  }
}