import 'package:flutter/material.dart';
import 'package:meta_trader/ui/views/transactions/transactions_view_model.dart';

import '../../../app/responsiveness/res.dart';
import 'components/transaction_tile.dart';

class InternalTransferTransactionsPage extends StatelessWidget {
  final TransactionsViewModel model;
  const InternalTransferTransactionsPage({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: McGyver.rsDoubleW(context, 6)),
      child: ListView.builder(
          itemCount: model.internalTransfers.length,
          itemBuilder: (context, index) {
            final internalTransfers = model.internalTransfers[index];

            return InternalTransferTile(
              title: internalTransfers["title"],
              amount: internalTransfers["amount"],
              date: internalTransfers["date"],
              time: internalTransfers["time"],
              onPressed: () {
                model.setListIndex = index;
                model.setTransactionsTypeEnum =
                    TransactionsTypeEnum.internalTransfer;
                model.setTransactionsViewEnum =
                    TransactionsPageEnum.transactionDetails;
              },
              status: internalTransfers["status"],
              model: model,
            );
          }),
    );
  }
}
