// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
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
      "title": "Transfer to Bank",
      "sender": "Binance Pay",
      "receiver": "FcPro",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Successful",
      "type": "Withdrawal",
      "transactionId": "232443564642"
    },
    {
      "title": "Transfer to Bank",
      "sender": "Binance Pay",
      "receiver": "FcPro",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Successful",
      "type": "Withdrawal",
      "transactionId": "232443564642"
    },
    {
      "title": "Transfer to Bank",
      "sender": "Binance Pay",
      "receiver": "FcPro",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Pending",
      "type": "Withdrawal",
      "transactionId": "232443564642"
    },
    {
      "title": "Transfer to Bank",
      "sender": "Binance Pay",
      "receiver": "FcPro",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Successful",
      "type": "Withdrawal",
      "transactionId": "232443564642"
    },
    {
      "title": "Transfer to Bank",
      "sender": "Binance Pay",
      "receiver": "FcPro",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Failed",
      "transactionId": "232443564642"
    },
    {
      "title": "Transfer to Bank",
      "sender": "Binance Pay",
      "receiver": "FcPro",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Successful",
      "type": "Withdrawal",
      "transactionId": "232443564642"
    },
  ];

  List deposits = [
    {
      "title": "Transfer to Bank",
      "sender": "Binance Pay",
      "receiver": "FcPro",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Successful",
      "type": "withdrawal",
      "transactionId": "232443564642"
    },
    {
      "title": "Transfer to Bank",
      "sender": "Binance Pay",
      "receiver": "FcPro",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Successful",
      "type": "Deposits",
      "transactionId": "232443564642"
    },
    {
      "title": "Transfer to Bank",
      "sender": "Binance Pay",
      "receiver": "FcPro",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Pending",
      "type": "Deposits",
      "transactionId": "232443564642"
    },
    {
      "title": "Transfer to Bank",
      "sender": "Binance Pay",
      "receiver": "FcPro",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Successful",
      "type": "Deposits",
      "transactionId": "232443564642"
    },
    {
      "title": "Transfer to Bank",
      "sender": "Binance Pay",
      "receiver": "FcPro",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Failed",
      "transactionId": "232443564642"
    },
    {
      "title": "Transfer to Bank",
      "sender": "Binance Pay",
      "receiver": "FcPro",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Successful",
      "type": "Deposits",
      "transactionId": "232443564642"
    },
  ];

  List internalTransfers = [
    {
      "title": "Transfer to Bank",
      "sender": "Binance Pay",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Successful",
      "type": "Internal Transfer",
      "transactionId": "232443564642"
    },
    {
      "title": "Transfer to Bank",
      "sender": "Binance Pay",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Successful",
      "type": "Internal Transfer",
      "transactionId": "232443564642"
    },
    {
      "title": "Transfer to Bank",
      "sender": "Binance Pay",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Pending",
      "type": "Internal Transfer",
      "transactionId": "232443564642"
    },
    {
      "title": "Transfer to Bank",
      "sender": "Binance Pay",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Successful",
      "type": "Internal Transfer",
      "transactionId": "232443564642"
    },
    {
      "title": "Transfer to Bank",
      "sender": "Binance Pay",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Failed",
      "transactionId": "232443564642"
    },
    {
      "title": "Transfer to Bank",
      "sender": "Binance Pay",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Successful",
      "type": "Internal Transfer",
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
        return transactionsAppBar(context, 'Transactions', this);
      case TransactionsPageEnum.transactionDetails:
        return transactionsAppBar(context, 'Transactions', this);
      default:
        return null;
    }
  }
}
