// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/ui/widgets/transactions/components/app_bar.dart';
import 'package:meta_trader/ui/widgets/transactions/transactions.dart';

enum TransactionsTypeEnum {
  all,
  withdrawals,
  deposits,
  internalTransfer,
}

enum TransactionsPageEnum { transactions, filter, transactionDetails }

enum TransactionStatusEnum { successful, pending, failed }

class TransactionsViewModel extends CustomBaseViewModel {
  TransactionsTypeEnum _transactionsTypeEnum = TransactionsTypeEnum.all;
  TransactionsTypeEnum get transactionsTypeEnum => _transactionsTypeEnum;

  TransactionsPageEnum _transactionsPageEnum =
      TransactionsPageEnum.transactions;
  TransactionsPageEnum get transactionsPageEnum => _transactionsPageEnum;
  bool _isFiltered = false;
  bool get isFiltered => _isFiltered;

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
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Successful",
      "type": "withdrawal",
    },
    {
      "title": "Transfer to Bank",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Successful",
      "type": "withdrawal",
    },
    {
      "title": "Transfer to Bank",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Pending",
      "type": "withdrawal",
    },
    {
      "title": "Transfer to Bank",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Successful",
      "type": "withdrawal",
    },
    {
      "title": "Transfer to Bank",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Failed",
    },
    {
      "title": "Transfer to Bank",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Successful",
      "type": "withdrawal",
    },
  ];

  List deposits = [
    {
      "title": "Transfer to Bank",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Successful",
      "type": "withdrawal",
    },
    {
      "title": "Transfer to Bank",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Successful",
      "type": "withdrawal",
    },
    {
      "title": "Transfer to Bank",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Pending",
      "type": "withdrawal",
    },
    {
      "title": "Transfer to Bank",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Successful",
      "type": "withdrawal",
    },
    {
      "title": "Transfer to Bank",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Failed",
    },
    {
      "title": "Transfer to Bank",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Successful",
      "type": "withdrawal",
    },
  ];

  List internalTransfers = [
    {
      "title": "Transfer to Bank",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Successful",
      "type": "withdrawal",
    },
    {
      "title": "Transfer to Bank",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Successful",
      "type": "withdrawal",
    },
    {
      "title": "Transfer to Bank",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Pending",
      "type": "withdrawal",
    },
    {
      "title": "Transfer to Bank",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Successful",
      "type": "withdrawal",
    },
    {
      "title": "Transfer to Bank",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Failed",
    },
    {
      "title": "Transfer to Bank",
      "amount": "55,000",
      "date": "2.1.2023",
      "time": "16:23:41",
      "status": "Successful",
      "type": "withdrawal",
    },
  ];

  Widget returnPage() {
    switch (_transactionsPageEnum) {
      case TransactionsPageEnum.transactions:
        return TransactionsPage(model: this);

      default:
        return Container();
    }
  }

  AppBar? returnAppBar(BuildContext context) {
    switch (_transactionsTypeEnum) {
      case TransactionsTypeEnum.all:
        return transactionsAppBar(context, 'Transactions', this);
      default:
        return null;
    }
  }
}
