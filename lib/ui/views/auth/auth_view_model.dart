// ignore_for_file: prefer_final_fields

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/ui/widgets/auth/created.dart';
import 'package:meta_trader/ui/widgets/auth/demo.dart';
import 'package:meta_trader/ui/widgets/auth/real.dart';

import '../../../generated/locale_keys.g.dart';
import '../../widgets/auth/app_bar.dart';
import '../../widgets/auth/broker.dart';
import '../../widgets/auth/choose_account.dart';
import '../../widgets/auth/login.dart';

enum AuthPageEnum {
  broker,
  chooseAccount,
  demoAccount,
  realAccount,
  login,
  created;

  String get auth {
    switch (this) {
      case AuthPageEnum.broker:
        return LocaleKeys.views_auth_auth_view_auth_page_enum_broker.tr();
      case AuthPageEnum.chooseAccount:
        return LocaleKeys.views_auth_auth_view_auth_page_enum_chooseAccount
            .tr();
      case AuthPageEnum.demoAccount:
        return LocaleKeys.views_auth_auth_view_auth_page_enum_demoAccount.tr();
      case AuthPageEnum.realAccount:
        return LocaleKeys.views_auth_auth_view_auth_page_enum_realAccount.tr();
      case AuthPageEnum.login:
        return LocaleKeys.views_auth_auth_view_auth_page_enum_login.tr();
      case AuthPageEnum.created:
        return LocaleKeys.views_auth_auth_view_auth_page_enum_created.tr();
    }
  }
}

enum CreatedAccountPageEnum {
  demo,
  real;

  String get account {
    switch (this) {
      case CreatedAccountPageEnum.demo:
        return LocaleKeys.views_auth_auth_view_created_account_page_enum_demo
            .tr();
      case CreatedAccountPageEnum.real:
        return LocaleKeys.views_auth_auth_view_created_account_page_enum_real
            .tr();
    }
  }
}

class AuthViewModel extends CustomBaseViewModel {
  Future<void> init() async {}

  int _counter = 0;
  int get counter => _counter;

  bool _isTyping = false;
  bool get isTyping => _isTyping;

  bool _savePassword = false;
  bool get savePassword => _savePassword;

  bool _termsAndConditions = false;
  bool get termsAndConditions => _termsAndConditions;

  TextEditingController _brokerSearchController = TextEditingController();
  TextEditingController get brokerSearchController => _brokerSearchController;

  AuthPageEnum _authPageEnum = AuthPageEnum.chooseAccount;
  AuthPageEnum get authPageEnum => _authPageEnum;

  CreatedAccountPageEnum _createdAccountPageEnum = CreatedAccountPageEnum.demo;
  CreatedAccountPageEnum get createdAccountPageEnum => _createdAccountPageEnum;

  String? _radioItem;
  String? get radioItem => _radioItem;

  String? _selectedBrokerName;
  String? get selectedBrokerName => _selectedBrokerName;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  set setRadio(String val) {
    _radioItem = val;
    rebuildUi();
  }

  set setSelectedBrokerName(String val) {
    _selectedBrokerName = val;
    rebuildUi();
  }

  set setTyping(bool val) {
    _isTyping = val;
    rebuildUi();
  }

  set setSavePassword(bool val) {
    _savePassword = !_savePassword;
    rebuildUi();
  }

  set setTermsAndConditions(bool val) {
    _termsAndConditions = !_termsAndConditions;
    rebuildUi();
  }

  set setAuthPageEnum(AuthPageEnum e) {
    _authPageEnum = e;
    rebuildUi();
  }

  set setCreatedAccountPageEnum(CreatedAccountPageEnum e) {
    _createdAccountPageEnum = e;
    rebuildUi();
  }

  Widget returnPage() {
    switch (_authPageEnum) {
      case AuthPageEnum.broker:
        return BrokerPage(model: this);
      case AuthPageEnum.chooseAccount:
        return ChooseAccount(model: this);
      case AuthPageEnum.login:
        return LoginPage(model: this);
      case AuthPageEnum.demoAccount:
        return DemoPage(model: this);
      case AuthPageEnum.realAccount:
        return RealPage(model: this);
      case AuthPageEnum.created:
        return CreatedPage(model: this);
      default:
        return Container();
    }
  }

  AppBar? returnAppBar(BuildContext context) {
    switch (_authPageEnum) {
      case AuthPageEnum.broker:
        return authAppBar(
            context,
            LocaleKeys.brokers.tr(),
            LocaleKeys.views_auth_auth_view_return_app_bar_find_broker.tr(),
            this);
      case AuthPageEnum.chooseAccount:
        return authAppBar(context, _selectedBrokerName ?? "", '', this);
      case AuthPageEnum.login:
        return authAppBar(
            context,
            LocaleKeys
                .views_auth_auth_view_return_app_bar_login_existing_account
                .tr(),
            LocaleKeys.views_auth_auth_view_return_app_bar_enter_login.tr(),
            this);
      case AuthPageEnum.demoAccount:
        return authAppBar(
            context,
            LocaleKeys.views_auth_auth_view_return_app_bar_open_demo_account
                .tr(),
            LocaleKeys.views_auth_auth_view_return_app_bar_enter_information
                .tr(),
            this);
      case AuthPageEnum.realAccount:
        return authAppBar(
            context,
            LocaleKeys.views_auth_auth_view_return_app_bar_open_real_account
                .tr(),
            LocaleKeys.views_auth_auth_view_return_app_bar_enter_information
                .tr(),
            this);
      case AuthPageEnum.created:
        return authAppBar(
            context,
            _createdAccountPageEnum == CreatedAccountPageEnum.demo
                ? LocaleKeys
                    .views_auth_auth_view_return_app_bar_open_demo_account
                    .tr()
                : LocaleKeys
                    .views_auth_auth_view_return_app_bar_open_real_account
                    .tr(),
            LocaleKeys.views_auth_auth_view_return_app_bar_created_account_info
                .tr(),
            this);
      default:
        return null;
    }
  }
}
