import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/ui/widgets/provider/components/provider_appbar.dart';
import 'package:meta_trader/ui/widgets/provider/provider_confirmation.dart';
import 'package:meta_trader/ui/widgets/provider/provider_dashboard.dart';
import 'package:meta_trader/ui/widgets/provider/provider_login.dart';
import 'package:meta_trader/ui/widgets/provider/provider_signup.dart';
import 'package:meta_trader/ui/widgets/provider/welcome.dart';

enum ProviderPageEnum {
  welcome,
  signUp,
  confirmation,
  login,
  dashboard,
  options,
  profileSettings
}

class ProviderViewModel extends CustomBaseViewModel {
  ProviderViewModel();

  ProviderPageEnum _providerPageEnum = ProviderPageEnum.dashboard;
  ProviderPageEnum get providerPageEnum => _providerPageEnum;
  bool checkbox = false;

  final summaryOneTabSelectorNotifier = ValueNotifier(0);
  final summaryTwoTabSelectorNotifier = ValueNotifier(0);
  final performanceTabSelectorNotifier = ValueNotifier(0);
  final followersTabSelectorNotifier = ValueNotifier(0);
  final overviewTabSelectedNotifier = ValueNotifier(0);

  bool showExpandedPositionView = false;

  List<CandleData> getCandleData() {
    return [
      CandleData('3 Sept 20:14', 50000, 70000, 60000, 55000),
      CandleData('3 Sept 20:24', 60000, 80000, 70000, 65000),
      CandleData('3 Sept 21:37', 60000, 80000, 70000, 65000),
      CandleData('3 Sept 21:50', 70000, 90000, 85000, 70000),
      CandleData('3 Sept 21:58', 70000, 80000, 65000, 40000),
      CandleData('3 Sept 00:34', 70000, 90000, 75000, 60000),
      CandleData('3 Sept 00:38', 80000, 90000, 80000, 60000),
      CandleData('3 Sept 00:39', 40000, 60000, 50000, 45000),
      CandleData('3 Sept 01:00', 40000, 60000, 50000, 45000),
      // Add more data points as needed
    ];
  }

  String _accountName = "Susan";
  String get accountName => _accountName;
  Map<String, dynamic> tradeHistoryDetail = {
    "profit": "509 082.18",
    "deposit": "592 380.17",
    "balance": "100 000.00",
    "equity": "113 436.65",
    "totalTrades": "300"
  };

  List<Map<String, dynamic>> tradeDetailList = [
    {
      "trade": "AUDJPY",
      "from": "4.51234",
      "to": "4.51234",
      "amount": "284.57",
      "sell": true,
      "quantity": "3",
      "available": "open",
      "date": "2023.7.13 20:40:08",
      "orderID": "23162111",
      "commission": "\$400.00"
    },
    {
      "trade": "AUDJPY",
      "from": "4.51234",
      "to": "4.51234",
      "amount": "284.57",
      "sell": false,
      "quantity": "10",
      "available": "open",
      "date": "2023.7.13 20:40:08",
      "orderID": "23162111",
      "commission": "\$400.00"
    },
    {
      "trade": "AUDJPY",
      "from": "4.51234",
      "to": "4.51234",
      "amount": "284.57",
      "sell": true,
      "quantity": "5",
      "available": "open",
      "date": "2023.7.13 20:40:08",
      "orderID": "23162111",
      "commission": "\$400.00"
    },
    {
      "trade": "AUDJPY",
      "from": "4.51234",
      "to": "4.51234",
      "amount": "284.57",
      "sell": true,
      "quantity": "7",
      "available": "open",
      "date": "2023.7.13 20:40:08",
      "orderID": "23162111",
      "commission": "\$400.00"
    },
    {
      "trade": "AUDJPY",
      "from": "4.51234",
      "to": "4.51234",
      "amount": "284.57",
      "sell": false,
      "quantity": "3",
      "available": "open",
      "date": "2023.7.13 20:40:08",
      "orderID": "23162111",
      "commission": "\$400.00"
    },
  ];

  String _nickname = "Silver";
  String get nickname => _nickname;

  String _password = "Susan";
  String get password => _password;

  String _phoneNumber = "Silver";
  String get phoneNumber => _phoneNumber;

  int _desiredFee = 30;
  int get desiredFee => _desiredFee;

  String _strategyDescription =
      "Hello Everyone, 👉 this account is totally safe to copy for all investors, Newbies and Professionals. I will try my best to make 25-50% profits weekly 💪. Our first priority is to keep safety of your funds.Happy trading ✨";
  String get strategyDescription => _strategyDescription;

  bool _visibility = true;
  bool get visibility => _visibility;

  set userName(String name) {
    _accountName = accountName;
    rebuildUi();
  }

  set nickname(String nickname) {
    _nickname = nickname;
    rebuildUi();
  }

  set phoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    rebuildUi();
  }

  set strategyDescription(String strategyDescription) {
    _strategyDescription = strategyDescription;
    rebuildUi();
  }

  set password(String password) {
    _password = password;
    rebuildUi();
  }

  set visibility(bool visibility) {
    _visibility = visibility;
    rebuildUi();
  }

  set desiredFee(int desiredFee) {
    _desiredFee = desiredFee;
    rebuildUi();
  }

  set setProviderPageEnum(ProviderPageEnum e) {
    _providerPageEnum = e;
    rebuildUi();
  }

  void setTabNotifiier(int value) {
    overviewTabSelectedNotifier.value = value;
    rebuildUi();
  }

  void toggleCheckbox() {
    checkbox = !checkbox;
    rebuildUi();
  }

  Widget returnPage() {
    switch (_providerPageEnum) {
      case ProviderPageEnum.welcome:
        return WelcomePage(viewModel: this);
      case ProviderPageEnum.signUp:
        return SingleChildScrollView(
            child: ProviderSignUpPage(viewModel: this));
      case ProviderPageEnum.confirmation:
        return ProviderConfirmationPage(viewModel: this);
      case ProviderPageEnum.login:
        return ProviderLoginPage(viewModel: this);
      case ProviderPageEnum.dashboard:
        return SingleChildScrollView(
            child: ProviderDashboardPage(viewModel: this));
      default:
        return SizedBox();
    }
  }

  AppBar? returnAppBar(BuildContext context) {
    switch (_providerPageEnum) {
      case ProviderPageEnum.welcome:
        return null;
      case ProviderPageEnum.signUp:
        return ProviderAppbar.simpleAppBar(
            this,
            context,
            "Sign up as a Provider",
            "Enter your information",
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.info_outline,
                  color: isDarkMode() ? Colors.white : Colors.black,
                )));
      case ProviderPageEnum.confirmation:
        return null;
      case ProviderPageEnum.login:
        return ProviderAppbar.simpleAppBar(this, context, "Provider Login",
            "Approved provider registration", null);
      case ProviderPageEnum.dashboard:
        return ProviderAppbar.appBarTwo(this, context);
      default:
        return AppBar();
    }
  }
}

class CandleData {
  final String date;
  final double low;
  final double high;
  final double open;
  final double close;

  CandleData(this.date, this.low, this.high, this.open, this.close);
}
