// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/ui/widgets/transactions/components/app_bar.dart';
import 'package:meta_trader/ui/widgets/transactions/transactions.dart';

enum TransactionsPageEnum {
  all,
  withdrawals,
  deposits,
  internalTransfer,
}

enum TransactionStatusEnum { successful, pending, failed }

class TransactionsViewModel extends CustomBaseViewModel {
  TransactionsPageEnum _transactionsPageEnum = TransactionsPageEnum.all;
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
      case TransactionsPageEnum.all:
        return TransactionsPage(model: this);

      default:
        return Container();
    }
  }

  AppBar? returnAppBar(BuildContext context) {
    switch (_transactionsPageEnum) {
      case TransactionsPageEnum.all:
        return transactionsAppBar(context, 'Transactions', this);
      default:
        return null;
    }
  }
}
