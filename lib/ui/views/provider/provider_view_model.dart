import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/provider/components/change_nickname.dart';
import 'package:meta_trader/ui/widgets/provider/components/change_password.dart';
import 'package:meta_trader/ui/widgets/provider/components/edit_strategy_description.dart';
import 'package:meta_trader/ui/widgets/provider/components/provider_appbar.dart';
import 'package:meta_trader/ui/widgets/provider/components/update_phone_number.dart';
import 'package:meta_trader/ui/widgets/provider/provider_confirmation.dart';
import 'package:meta_trader/ui/widgets/provider/provider_dashboard.dart';
import 'package:meta_trader/ui/widgets/provider/provider_followers.dart';
import 'package:meta_trader/ui/widgets/provider/provider_login.dart';
import 'package:meta_trader/ui/widgets/provider/provider_notification.dart';
import 'package:meta_trader/ui/widgets/provider/provider_options_page.dart';
import 'package:meta_trader/ui/widgets/provider/provider_settings.dart';
import 'package:meta_trader/ui/widgets/provider/provider_signup.dart';
import 'package:meta_trader/ui/widgets/provider/provider_wallet.dart';
import 'package:meta_trader/ui/widgets/provider/welcome.dart';

enum ProviderPageEnum {
  welcome,
  signUp,
  confirmation,
  login,
  dashboard,
  options,
  profileSettings,
  wallet,
  notifications,
  transactionHistory,
  followers
}

enum ProviderSettingsEnum {
  changeNickName,
  changePassword,
  editStrategyDescription,
  updatePhoneNumber
}

enum TransactionsTypeEnum { withdrawal, deposit, internalTransfer }

enum TransactionStatusEnum { successful, pending, failed }

class ProviderViewModel extends CustomBaseViewModel {
  ProviderViewModel();

  ProviderPageEnum _providerPageEnum = ProviderPageEnum.welcome;
  ProviderPageEnum get providerPageEnum => _providerPageEnum;
  ProviderSettingsEnum _providerSettingsEnum =
      ProviderSettingsEnum.changeNickName;
  ProviderSettingsEnum get providerSettingsEnum => _providerSettingsEnum;

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
      "available": LocaleKeys.open,
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
      "available": LocaleKeys.open,
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
      "available": LocaleKeys.open,
      "date": "2023.7.13 20:40:08",
      "orderID": "23162111",
      "commission": "\$400.00"
    },
  ];

  String _nickname = "Jonny";
  Map<String, dynamic> followersData = {
    "name": "Henry Walston",
    "date": "2023.7.13",
    "location": "USA"
  };

  // String _nickname = "Silver";
  String get nickname => _nickname;

  String _password = "XXXXXXXXXXX";
  String get password => _password;

  String _phoneNumber = "+23470179919";
  String get phoneNumber => _phoneNumber;

  int _desiredFee = 30;
  int get desiredFee => _desiredFee;

  String _strategyDescription =
      LocaleKeys.views_providerView_strategyDescription;
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

  set setProviderSettingsEnum(ProviderSettingsEnum e) {
    _providerSettingsEnum = e;
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

  List notifications = [
    {
      "title":
          LocaleKeys.views_providerView_notificationList_notificationListTitle,
      "description": LocaleKeys
          .views_providerView_notificationList_notificationListDescription,
      "date":
          LocaleKeys.views_providerView_notificationList_notificationListDate,
      "time":
          LocaleKeys.views_providerView_notificationList_notificationListTime,
      "isRead": false
    },
    {
      "title":
          LocaleKeys.views_providerView_notificationList_notificationListTitle1,
      "description": LocaleKeys
          .views_providerView_notificationList_notificationListDescription1,
      "date":
          LocaleKeys.views_providerView_notificationList_notificationListDate,
      "time":
          LocaleKeys.views_providerView_notificationList_notificationListTime,
      "isRead": false
    },
    {
      "title":
          LocaleKeys.views_providerView_notificationList_notificationListTitle1,
      "description": LocaleKeys
          .views_providerView_notificationList_notificationListDescription1,
      "date":
          LocaleKeys.views_providerView_notificationList_notificationListDate,
      "time":
          LocaleKeys.views_providerView_notificationList_notificationListTime,
      "isRead": false
    },
  ];

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

      case ProviderPageEnum.options:
        return ProviderOptionsPage(viewModel: this);

      case ProviderPageEnum.profileSettings:
        return ProviderSettingsPage(viewModel: this);
      case ProviderPageEnum.notifications:
        return ProviderNotificationPage(viewModel: this);
      case ProviderPageEnum.wallet:
        return WalletPage(viewModel: this);
      case ProviderPageEnum.dashboard:
        return ProviderDashboardPage(viewModel: this);
      case ProviderPageEnum.followers:
        return ProviderFollowerPage(viewModel: this);
      default:
        return const SizedBox();
    }
  }

  Widget returnDialog() {
    switch (_providerSettingsEnum) {
      case ProviderSettingsEnum.changeNickName:
        return ChangeNickName(
          viewModel: this,
        );
      case ProviderSettingsEnum.changePassword:
        return ChangePassword(viewModel: this);
      case ProviderSettingsEnum.editStrategyDescription:
        return EditStrategyDescription(viewModel: this);
      case ProviderSettingsEnum.updatePhoneNumber:
        return UpdatePhoneNumber(viewModel: this);

      default:
        return const SizedBox();
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
            LocaleKeys.views_providerView_signUpAsProvider,
            LocaleKeys.views_providerView_enterYourInformation,
            true,
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.info_outline,
                  color: isDarkMode() ? Colors.white : Colors.black,
                )));
      case ProviderPageEnum.confirmation:
        return null;
      case ProviderPageEnum.login:
        return ProviderAppbar.simpleAppBar(
            this,
            context,
            LocaleKeys.views_providerView_providerLogin,
            LocaleKeys.views_providerView_approvedRegistration,
            true,
            null);
      case ProviderPageEnum.options:
        return ProviderAppbar.simpleAppBar(
            this, context, LocaleKeys.options, "", false, null);
      case ProviderPageEnum.notifications:
        return ProviderAppbar.simpleAppBar(
            this, context, LocaleKeys.notification, "", false, null);
      case ProviderPageEnum.profileSettings:
        return ProviderAppbar.simpleAppBar(
            this,
            context,
            LocaleKeys.views_providerView_profileSettings,
            LocaleKeys.views_providerView_changeYourProfileInfo,
            true,
            null);
      case ProviderPageEnum.dashboard:
        return ProviderAppbar.appBarTwo(this, context);
      case ProviderPageEnum.wallet:
        return ProviderAppbar.walletAppBar(
            context, LocaleKeys.wallet, "", this);
      case ProviderPageEnum.followers:
        return ProviderAppbar.simpleAppBar(this, context, LocaleKeys.followers,
            LocaleKeys.views_providerView_viewYourFollowers, true, null);
      default:
        return AppBar();
    }
  }

  Future<void> showCustomDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(child: returnDialog());
      },
    );
  }

  String assetNameForTransactionType(TransactionsTypeEnum type) {
    switch (type) {
      case TransactionsTypeEnum.withdrawal:
        return 'assets/icons/money_send_outline.svg';
      case TransactionsTypeEnum.deposit:
        return 'assets/icons/money_receive_outline.svg';
      case TransactionsTypeEnum.internalTransfer:
        return 'assets/icons/recovery_convert.svg';
      default:
        return "";
    }
  }

  Color iconColorForTransactionType(
      TransactionsTypeEnum type, bool isDarkMode) {
    switch (type) {
      case TransactionsTypeEnum.withdrawal:
        return const Color(0xff7A271A);
      case TransactionsTypeEnum.deposit:
        return isDarkMode ? const Color(0xff47B0F5) : const Color(0xff20A0F3);
      case TransactionsTypeEnum.internalTransfer:
        return const Color(0xff3E1C96);
    }
  }

  Color bgColorForTransactionType(TransactionsTypeEnum type, bool isDarkMode) {
    switch (type) {
      case TransactionsTypeEnum.withdrawal:
        return isDarkMode ? const Color(0xffFECDCA) : const Color(0xFFFEE4E2);
      case TransactionsTypeEnum.deposit:
        return isDarkMode ? const Color(0xff073961) : const Color(0xffD3ECFD);
      case TransactionsTypeEnum.internalTransfer:
        return isDarkMode ? const Color(0xffBDB4FE) : const Color(0xFFD9D6FE);
    }
  }

  Color statusColorForTransactionType(
      TransactionStatusEnum type, bool isDarkMode) {
    switch (type) {
      case TransactionStatusEnum.successful:
        return isDarkMode ? const Color(0xff77C5F8) : const Color(0xFF20A0F3);
      case TransactionStatusEnum.pending:
        return isDarkMode ? const Color(0xFFFEC84B) : const Color(0xffF79009);
      case TransactionStatusEnum.failed:
        return isDarkMode ? const Color(0xffFDA29B) : const Color(0xFFF04438);
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

class TransactionModel {
  final String id;
  final TransactionsTypeEnum type;
  final String title;
  final String amount;
  final TransactionStatusEnum status;
  final String date;
  final String time;

  TransactionModel({
    required this.id,
    required this.type,
    required this.title,
    required this.amount,
    required this.status,
    required this.date,
    required this.time,
  });
}
