import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/ui/widgets/social_trading/app_bar.dart';
import 'package:meta_trader/ui/widgets/social_trading/copied_trader_position.dart';
import 'package:meta_trader/ui/widgets/social_trading/master_traders.dart';
import 'package:meta_trader/ui/widgets/social_trading/menu_main.dart';
import 'package:meta_trader/ui/widgets/social_trading/my_trades.dart';
import 'package:meta_trader/ui/widgets/social_trading/transaction_history.dart';
import 'package:meta_trader/ui/widgets/social_trading/wallet.dart';
import 'package:meta_trader/ui/widgets/social_trading/transaction_details.dart';

enum SocialTradingPageEnum {
  masterTraders,
  myTrades,
  copiedTraderPosition,
  menuMain,
  wallet,
  transactionHistory,
  transactionDetails,
  notification,
  support,
  about,
}

enum MasterTraderOverviewEnum { overview, tradingHistory }

enum TransactionsTypeEnum { withdrawal, deposit, internalTransfer }

enum TransactionStatusEnum { successful, pending, failed }

class SocialTradingViewModel extends CustomBaseViewModel {
  late TransactionModel _transaction;
  set setTransaction(TransactionModel t) {
    _transaction = t;
    rebuildUi();
  }

  SocialTradingPageEnum _socialTradingPageEnum =
      SocialTradingPageEnum.masterTraders;

  SocialTradingPageEnum get socialTradingPageEnum => _socialTradingPageEnum;

  MasterTraderOverviewEnum _masterTraderOverviewEnum =
      MasterTraderOverviewEnum.overview;

  MasterTraderOverviewEnum get masterTraderOverviewEnum =>
      _masterTraderOverviewEnum;

  set setSocialTradingPageEnum(SocialTradingPageEnum e) {
    _socialTradingPageEnum = e;
    rebuildUi();
  }

  set setMasterTraderOverviewEnum(MasterTraderOverviewEnum e) {
    _masterTraderOverviewEnum = e;
    rebuildUi();
  }

  Widget returnPage(BuildContext context) {
    switch (_socialTradingPageEnum) {
      case SocialTradingPageEnum.masterTraders:
        return MasterTraders(
          model: this,
        );
      case SocialTradingPageEnum.myTrades:
        return MyTrades(
          model: this,
        );
      case SocialTradingPageEnum.copiedTraderPosition:
        return CopiedTraderPositionPage(
          viewModel: this,
        );
      case SocialTradingPageEnum.menuMain:
        return MenuMainPage(
          viewModel: this,
        );
      case SocialTradingPageEnum.wallet:
        return WalletPage(
          viewModel: this,
        );
      case SocialTradingPageEnum.transactionHistory:
        return TransactionHistory(
          viewModel: this,
        );
      case SocialTradingPageEnum.transactionDetails:
        return TransactionDetailsPage(
          transaction: _transaction,
          viewModel: this,
        );
      default:
        return Container();
    }
  }

  AppBar? returnAppBar(BuildContext context) {
    switch (socialTradingPageEnum) {
      case SocialTradingPageEnum.masterTraders:
      case SocialTradingPageEnum.myTrades:
        return socialTradingDashboardAppBar(
          context,
          this,
        );
      case SocialTradingPageEnum.copiedTraderPosition:
        return socialTradingMenuAppBar(context, 'Satoshi Nakamoto', '', this);
      case SocialTradingPageEnum.menuMain:
        return socialTradingMenuAppBar(context, 'Option', '', this);
      case SocialTradingPageEnum.wallet:
        return socialTradingMenuAppBar(context, 'Wallet', '', this);
      case SocialTradingPageEnum.transactionHistory:
        return socialTradingMenuAppBar(context, 'Transaction History', '', this,
            "assets/icons/filter.svg");
      case SocialTradingPageEnum.transactionDetails:
        return socialTradingMenuAppBar(
            context, 'Transaction Details', '', this);
      case SocialTradingPageEnum.notification:
        return socialTradingMenuAppBar(context, 'Notifications', '', this);
      default:
        return null;
    }
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

  // demo data
  List<TransactionModel> withdrawals = [
    TransactionModel(
      id: "1",
      type: TransactionsTypeEnum.withdrawal,
      title: "Transfer to Bank",
      amount: "55,000",
      status: TransactionStatusEnum.successful,
      date: "2.1.2023",
      time: "16:23:41",
    ),
    TransactionModel(
      id: "2",
      type: TransactionsTypeEnum.withdrawal,
      title: "Transfer to BinancePay",
      amount: "55,000",
      status: TransactionStatusEnum.successful,
      date: "2.1.2023",
      time: "16:23:41",
    ),
    TransactionModel(
      id: "3",
      type: TransactionsTypeEnum.withdrawal,
      title: "Transfer to Bank",
      amount: "55,000",
      status: TransactionStatusEnum.successful,
      date: "2.1.2023",
      time: "16:23:41",
    ),
    TransactionModel(
      id: "4",
      type: TransactionsTypeEnum.withdrawal,
      title: "Transfer to Perfect Money",
      amount: "55,000",
      status: TransactionStatusEnum.failed,
      date: "2.1.2023",
      time: "16:23:41",
    ),
  ];

  // demo data
  List<TransactionModel> deposits = [
    TransactionModel(
      id: "1",
      type: TransactionsTypeEnum.deposit,
      title: "Online Bank Transfer",
      amount: "55,000",
      status: TransactionStatusEnum.successful,
      date: "2.1.2023",
      time: "16:23:41",
    ),
    TransactionModel(
      id: "2",
      type: TransactionsTypeEnum.deposit,
      title: "Deposit from BinancePay",
      amount: "55,000",
      status: TransactionStatusEnum.successful,
      date: "2.1.2023",
      time: "16:23:41",
    ),
    TransactionModel(
      id: "3",
      type: TransactionsTypeEnum.deposit,
      title: "Deposit from Neteller",
      amount: "55,000",
      status: TransactionStatusEnum.successful,
      date: "2.1.2023",
      time: "16:23:41",
    ),
    TransactionModel(
      id: "4",
      type: TransactionsTypeEnum.deposit,
      title: "Deposit from Perfect Money",
      amount: "55,000",
      status: TransactionStatusEnum.failed,
      date: "2.1.2023",
      time: "16:23:41",
    ),
    TransactionModel(
      id: "5",
      type: TransactionsTypeEnum.deposit,
      title: "Deposit from BinancePay",
      amount: "55,000",
      status: TransactionStatusEnum.successful,
      date: "2.1.2023",
      time: "16:23:41",
    ),
    TransactionModel(
      id: "6",
      type: TransactionsTypeEnum.deposit,
      title: "Online Bank Transfer",
      amount: "55,000",
      status: TransactionStatusEnum.pending,
      date: "2.1.2023",
      time: "16:23:41",
    ),
  ];

  // demo data
  List<TransactionModel> internalTransfers = [
    TransactionModel(
      id: "1",
      type: TransactionsTypeEnum.internalTransfer,
      title: "FXTM  to Wallet",
      amount: "55,000",
      status: TransactionStatusEnum.successful,
      date: "2.1.2023",
      time: "16:23:41",
    ),
    TransactionModel(
      id: "2",
      type: TransactionsTypeEnum.internalTransfer,
      title: "Wallet to deriv",
      amount: "55,000",
      status: TransactionStatusEnum.failed,
      date: "2.1.2023",
      time: "16:23:41",
    ),
    TransactionModel(
      id: "3",
      type: TransactionsTypeEnum.internalTransfer,
      title: "Wallet to deriv",
      amount: "55,000",
      status: TransactionStatusEnum.successful,
      date: "2.1.2023",
      time: "16:23:41",
    ),
    TransactionModel(
      id: "4",
      type: TransactionsTypeEnum.internalTransfer,
      title: "Wallet to deriv",
      amount: "55,000",
      status: TransactionStatusEnum.failed,
      date: "2.1.2023",
      time: "16:23:41",
    ),
    TransactionModel(
      id: "5",
      type: TransactionsTypeEnum.internalTransfer,
      title: "FXTM  to Wallet",
      amount: "55,000",
      status: TransactionStatusEnum.successful,
      date: "2.1.2023",
      time: "16:23:41",
    ),
    TransactionModel(
      id: "6",
      type: TransactionsTypeEnum.internalTransfer,
      title: "Wallet to deriv",
      amount: "55,000",
      status: TransactionStatusEnum.pending,
      date: "2.1.2023",
      time: "16:23:41",
    ),
  ];

  List<TransactionModel> allTransactions = [
    TransactionModel(
      id: "1",
      type: TransactionsTypeEnum.deposit,
      title: "Deposit from BinancePay",
      amount: "55,000",
      status: TransactionStatusEnum.successful,
      date: "2.1.2023",
      time: "16:23:41",
    ),
    TransactionModel(
      id: "2",
      type: TransactionsTypeEnum.deposit,
      title: "Deposit from Neteller",
      amount: "55,000",
      status: TransactionStatusEnum.successful,
      date: "2.1.2023",
      time: "16:23:41",
    ),
    TransactionModel(
      id: "3",
      type: TransactionsTypeEnum.internalTransfer,
      title: "FXTM  to Wallet",
      amount: "55,000",
      status: TransactionStatusEnum.successful,
      date: "2.1.2023",
      time: "16:23:41",
    ),
    TransactionModel(
      id: "4",
      type: TransactionsTypeEnum.internalTransfer,
      title: "Wallet to deriv",
      amount: "55,000",
      status: TransactionStatusEnum.successful,
      date: "2.1.2023",
      time: "16:23:41",
    ),
    TransactionModel(
      id: "5",
      type: TransactionsTypeEnum.internalTransfer,
      title: "Wallet to deriv",
      amount: "55,000",
      status: TransactionStatusEnum.failed,
      date: "2.1.2023",
      time: "16:23:41",
    ),
    TransactionModel(
      id: "6",
      type: TransactionsTypeEnum.withdrawal,
      title: "Transfer to Bank",
      amount: "55,000",
      status: TransactionStatusEnum.successful,
      date: "2.1.2023",
      time: "16:23:41",
    ),
    TransactionModel(
      id: "7",
      type: TransactionsTypeEnum.withdrawal,
      title: "Transfer to BinancePay",
      amount: "55,000",
      status: TransactionStatusEnum.successful,
      date: "2.1.2023",
      time: "16:23:41",
    ),
    TransactionModel(
      id: "8",
      type: TransactionsTypeEnum.withdrawal,
      title: "Transfer to Bank",
      amount: "55,000",
      status: TransactionStatusEnum.successful,
      date: "2.1.2023",
      time: "16:23:41",
    ),
    TransactionModel(
      id: "9",
      type: TransactionsTypeEnum.internalTransfer,
      title: "FXTM  to Wallet",
      amount: "55,000",
      status: TransactionStatusEnum.successful,
      date: "2.1.2023",
      time: "16:23:41",
    ),
    TransactionModel(
      id: "10",
      type: TransactionsTypeEnum.internalTransfer,
      title: "Wallet to deriv",
      amount: "55,000",
      status: TransactionStatusEnum.pending,
      date: "2.1.2023",
      time: "16:23:41",
    ),
  ];
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