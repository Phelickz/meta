// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/ui/widgets/auth/demo.dart';
import 'package:meta_trader/ui/widgets/auth/real.dart';

import '../../widgets/auth/app_bar.dart';
import '../../widgets/auth/broker.dart';
import '../../widgets/auth/choose_account.dart';
import '../../widgets/auth/login.dart';

enum AuthPageEnum { broker, chooseAccount, demoAccount, realAccount, login }

class AuthViewModel extends CustomBaseViewModel {
  Future<void> init() async {}

  int _counter = 0;
  int get counter => _counter;

  bool _isTyping = false;
  bool get isTyping => _isTyping;

  TextEditingController _brokerSearchController = TextEditingController();
  TextEditingController get brokerSearchController => _brokerSearchController;

  AuthPageEnum _authPageEnum = AuthPageEnum.broker;
  AuthPageEnum get authPageEnum => _authPageEnum;

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

  set setAuthPageEnum(AuthPageEnum e) {
    _authPageEnum = e;
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
      default:
        return Container();
    }
  }

  AppBar? returnAppBar(BuildContext context) {
    switch (_authPageEnum) {
      case AuthPageEnum.broker:
        return authAppBar(context, 'Brokers', 'Find a broker', this);
      case AuthPageEnum.chooseAccount:
        return authAppBar(
            context, _selectedBrokerName ?? "", 'Choose an account', this);
      case AuthPageEnum.login:
        return authAppBar(
            context, _selectedBrokerName ?? "", 'Enter login details', this);
      case AuthPageEnum.demoAccount:
        return authAppBar(
            context, 'Open A Demo Account', 'Enter your information', this);
      case AuthPageEnum.realAccount:
        return authAppBar(
            context, 'Open A Real Account', 'Enter your information', this);
      default:
        return null;
    }
  }
}
