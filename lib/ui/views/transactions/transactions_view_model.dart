// ignore_for_file: prefer_final_fields

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/transactions/components/app_bar.dart';
import 'package:meta_trader/ui/widgets/transactions/components/transaction_details_card.dart';
import 'package:meta_trader/ui/widgets/transactions/transaction_details.dart';
import 'package:meta_trader/ui/widgets/transactions/transactions.dart';

enum TransactionsTypeEnum {
  withdrawals,
  deposits,
  internalTransfer,
}

enum TransactionsPageEnum { transactions, filter, transactionDetails }

enum TransactionStatusEnum { successful, pending, failed }

class TransactionsViewModel extends CustomBaseViewModel {
  TransactionsTypeEnum _transactionsTypeEnum = TransactionsTypeEnum.withdrawals;
  TransactionsTypeEnum get transactionsTypeEnum => _transactionsTypeEnum;

  TransactionsPageEnum _transactionsPageEnum =
      TransactionsPageEnum.transactions;
  TransactionsPageEnum get transactionsPageEnum => _transactionsPageEnum;
  bool _isFiltered = false;
  bool get isFiltered => _isFiltered;

  int _listIndex = 0;
  int get listIndex => _listIndex;

  set setListIndex(int index) {
    _listIndex = index;
    rebuildUi();
  }

  set filteredState(bool value) {
    _isFiltered = !_isFiltered;
    rebuildUi();
  }

  set setTransactionsViewEnum(TransactionsPageEnum e) {
    _transactionsPageEnum = e;
    rebuildUi();
  }

  set setTransactionsTypeEnum(TransactionsTypeEnum e) {
    _transactionsTypeEnum = e;
    rebuildUi();
  }

  List withdrawals = [
    {
      "title": LocaleKeys.transferToBank.tr(),
      "sender": "Binance Pay",
      "receiver": "FcPro",
      "amount": "55,000",
      "date": LocaleKeys
          .views_providerView_notificationList_notificationListDate
          .tr(),
      "time": LocaleKeys
          .views_providerView_notificationList_notificationListTime
          .tr(),
      "status": LocaleKeys.successful.tr(),
      "type": LocaleKeys.withdrawal.tr(),
      "transactionId": "232443564642"
    },
    {
      "title": LocaleKeys.transferToBank.tr(),
      "sender": "Binance Pay",
      "receiver": "FcPro",
      "amount": "55,000",
      "date": LocaleKeys
          .views_providerView_notificationList_notificationListDate
          .tr(),
      "time": LocaleKeys
          .views_providerView_notificationList_notificationListTime
          .tr(),
      "status": LocaleKeys.successful.tr(),
      "type": LocaleKeys.withdrawal.tr(),
      "transactionId": "232443564642"
    },
    {
      "title": LocaleKeys.transferToBank.tr(),
      "sender": "Binance Pay",
      "receiver": "FcPro",
      "amount": "55,000",
      "date": LocaleKeys
          .views_providerView_notificationList_notificationListDate
          .tr(),
      "time": LocaleKeys
          .views_providerView_notificationList_notificationListTime
          .tr(),
      "status": LocaleKeys.pending.tr(),
      "type": LocaleKeys.withdrawal.tr(),
      "transactionId": "232443564642"
    },
    {
      "title": LocaleKeys.transferToBank.tr(),
      "sender": "Binance Pay",
      "receiver": "FcPro",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": LocaleKeys.successful.tr(),
      "type": LocaleKeys.withdrawal.tr(),
      "transactionId": "232443564642"
    },
    {
      "title": LocaleKeys.transferToBank.tr(),
      "sender": "Binance Pay",
      "receiver": "FcPro",
      "amount": "55,000",
      "date": LocaleKeys
          .views_providerView_notificationList_notificationListDate
          .tr(),
      "time": LocaleKeys
          .views_providerView_notificationList_notificationListTime
          .tr(),
      "status": LocaleKeys.failed.tr(),
      "transactionId": "232443564642"
    },
    {
      "title": LocaleKeys.transferToBank.tr(),
      "sender": "Binance Pay",
      "receiver": "FcPro",
      "amount": "55,000",
      "date": LocaleKeys
          .views_providerView_notificationList_notificationListDate
          .tr(),
      "time": LocaleKeys
          .views_providerView_notificationList_notificationListTime
          .tr(),
      "status": LocaleKeys.successful.tr(),
      "type": LocaleKeys.withdrawal.tr(),
      "transactionId": "232443564642"
    },
  ];

  List deposits = [
    {
      "title": LocaleKeys.transferToBank.tr(),
      "sender": "Binance Pay",
      "receiver": "FcPro",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": LocaleKeys.successful.tr(),
      "type": LocaleKeys.withdrawal.tr(),
      "transactionId": "232443564642"
    },
    {
      "title": LocaleKeys.transferToBank.tr(),
      "sender": "Binance Pay",
      "receiver": "FcPro",
      "amount": "55,000",
      "date": LocaleKeys
          .views_providerView_notificationList_notificationListDate
          .tr(),
      "time": LocaleKeys
          .views_providerView_notificationList_notificationListTime
          .tr(),
      "status": LocaleKeys.successful.tr(),
      "type": LocaleKeys.deposit.tr(),
      "transactionId": "232443564642"
    },
    {
      "title": LocaleKeys.transferToBank,
      "sender": "Binance Pay",
      "receiver": "FcPro",
      "amount": "55,000",
      "date": LocaleKeys
          .views_providerView_notificationList_notificationListDate
          .tr(),
      "time": LocaleKeys
          .views_providerView_notificationList_notificationListTime
          .tr(),
      "status": LocaleKeys.pending.tr(),
      "type": LocaleKeys.deposit.tr(),
      "transactionId": "232443564642"
    },
    {
      "title": LocaleKeys.transferToBank.tr(),
      "sender": "Binance Pay",
      "receiver": "FcPro",
      "amount": "55,000",
      "date": LocaleKeys
          .views_providerView_notificationList_notificationListDate
          .tr(),
      "time": LocaleKeys
          .views_providerView_notificationList_notificationListTime
          .tr(),
      "status": LocaleKeys.successful.tr(),
      "type": LocaleKeys.deposit.tr(),
      "transactionId": "232443564642"
    },
    {
      "title": LocaleKeys.transferToBank.tr(),
      "sender": "Binance Pay",
      "receiver": "FcPro",
      "amount": "55,000",
      "date": LocaleKeys
          .views_providerView_notificationList_notificationListDate
          .tr(),
      "time": LocaleKeys
          .views_providerView_notificationList_notificationListTime
          .tr(),
      "status": LocaleKeys.failed,
      "transactionId": "232443564642"
    },
    {
      "title": LocaleKeys.transferToBank.tr(),
      "sender": "Binance Pay",
      "receiver": "FcPro",
      "amount": "55,000",
      "date": LocaleKeys
          .views_providerView_notificationList_notificationListDate
          .tr(),
      "time": LocaleKeys
          .views_providerView_notificationList_notificationListTime
          .tr(),
      "status": LocaleKeys.successful.tr(),
      "type": LocaleKeys.deposit.tr(),
      "transactionId": "232443564642"
    },
  ];

  List internalTransfers = [
    {
      "title": LocaleKeys.transferToBank.tr(),
      "sender": "Binance Pay",
      "amount": "55,000",
      "date": LocaleKeys
          .views_providerView_notificationList_notificationListDate
          .tr(),
      "time": LocaleKeys
          .views_providerView_notificationList_notificationListTime
          .tr(),
      "status": LocaleKeys.successful.tr(),
      "type": LocaleKeys.internalTransfer.tr(),
      "transactionId": "232443564642"
    },
    {
      "title": LocaleKeys.transferToBank.tr(),
      "sender": "Binance Pay",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": LocaleKeys.successful.tr(),
      "type": LocaleKeys.internalTransfer.tr(),
      "transactionId": "232443564642"
    },
    {
      "title": LocaleKeys.transferToBank.tr(),
      "sender": "Binance Pay",
      "amount": "55,000",
      "date": LocaleKeys
          .views_providerView_notificationList_notificationListDate
          .tr(),
      "time": LocaleKeys
          .views_providerView_notificationList_notificationListTime
          .tr(),
      "status": LocaleKeys.pending.tr(),
      "type": LocaleKeys.internalTransfer.tr(),
      "transactionId": "232443564642"
    },
    {
      "title": LocaleKeys.transferToBank.tr(),
      "sender": "Binance Pay",
      "amount": "55,000",
      "date": LocaleKeys
          .views_providerView_notificationList_notificationListDate
          .tr(),
      "time": LocaleKeys
          .views_providerView_notificationList_notificationListTime
          .tr(),
      "status": LocaleKeys.successful.tr(),
      "type": LocaleKeys.internalTransfer.tr(),
      "transactionId": "232443564642"
    },
    {
      "title": LocaleKeys.transferToBank.tr(),
      "sender": "Binance Pay",
      "amount": "55,000",
      "date": LocaleKeys
          .views_providerView_notificationList_notificationListDate
          .tr(),
      "time": LocaleKeys
          .views_providerView_notificationList_notificationListTime
          .tr(),
      "status": LocaleKeys.failed.tr(),
      "transactionId": "232443564642"
    },
    {
      "title": LocaleKeys.transferToBank.tr(),
      "sender": "Binance Pay",
      "amount": "55,000",
      "date": LocaleKeys
          .views_providerView_notificationList_notificationListDate
          .tr(),
      "time": LocaleKeys
          .views_providerView_notificationList_notificationListTime
          .tr(),
      "status": LocaleKeys.successful.tr(),
      "type": LocaleKeys.internalTransfer.tr(),
      "transactionId": "232443564642"
    },
  ];

  Widget returnTransactionDetails() {
    switch (_transactionsTypeEnum) {
      case TransactionsTypeEnum.withdrawals:
        return WithdrawalDetailsCard(
            title: withdrawals[listIndex]["title"],
            amount: withdrawals[listIndex]["amount"],
            date: withdrawals[listIndex]["date"],
            time: withdrawals[listIndex]["time"],
            status: withdrawals[listIndex]["status"],
            receiver: withdrawals[listIndex]["receiver"],
            sender: withdrawals[listIndex]["sender"],
            transactionId: withdrawals[listIndex]["transactionId"],
            model: this);

      case TransactionsTypeEnum.deposits:
        return DepositDetailsCard(
            title: deposits[listIndex]["title"],
            amount: deposits[listIndex]["amount"],
            date: deposits[listIndex]["date"],
            time: deposits[listIndex]["time"],
            status: deposits[listIndex]["status"],
            receiver: deposits[listIndex]["receiver"],
            sender: deposits[listIndex]["sender"],
            transactionId: deposits[listIndex]["transactionId"],
            model: this);
      case TransactionsTypeEnum.internalTransfer:
        return InternalTransferDetailsCard(
            title: internalTransfers[listIndex]["title"],
            amount: internalTransfers[listIndex]["amount"],
            date: internalTransfers[listIndex]["date"],
            time: internalTransfers[listIndex]["time"],
            status: internalTransfers[listIndex]["status"],
            sender: internalTransfers[listIndex]["sender"],
            transactionId: internalTransfers[listIndex]["transactionId"],
            model: this);
      default:
        return Container();
    }
  }

  Widget returnPage() {
    switch (_transactionsPageEnum) {
      case TransactionsPageEnum.transactions:
        return TransactionsPage(model: this);

      case TransactionsPageEnum.transactionDetails:
        return TransactionDetailsPage(model: this);

      default:
        return Container();
    }
  }

  AppBar? returnAppBar(BuildContext context) {
    switch (_transactionsPageEnum) {
      case TransactionsPageEnum.transactions:
        return transactionsAppBar(context, LocaleKeys.transactions.tr(), this);
      case TransactionsPageEnum.transactionDetails:
        return transactionsAppBar(context, LocaleKeys.transactions.tr(), this);
      default:
        return null;
    }
  }
}
