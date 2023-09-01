import 'package:flutter/material.dart';
import 'package:meta_trader/ui/views/transactions/transactions_view_model.dart';
import 'package:meta_trader/ui/widgets/transactions/components/transaction_tile.dart';

import '../../../app/responsiveness/res.dart';

class DepositsTransactionsPage extends StatelessWidget {
  final TransactionsViewModel model;
  const DepositsTransactionsPage({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: McGyver.rsDoubleW(context, 6)),
      child: ListView.builder(
          itemCount: model.deposits.length,
          itemBuilder: (context, index) {
            final deposits = model.deposits[index];

            return DepositTile(
              title: deposits["title"],
              amount: deposits["amount"],
              date: deposits["date"],
              time: deposits["time"],
              onPressed: () {
                model.setListIndex = index;
                model.setTransactionsTypeEnum = TransactionsTypeEnum.deposits;
                model.setTransactionsViewEnum =
                    TransactionsPageEnum.transactionDetails;
              },
              status: deposits["status"],
              model: model,
            );
          }),
    );
  }
}
