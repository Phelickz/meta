import 'package:flutter/material.dart';
import 'package:meta_trader/ui/views/transactions/transactions_view_model.dart';
import 'package:meta_trader/ui/widgets/transactions/components/transaction_tile.dart';

import '../../../app/responsiveness/res.dart';

class WithdrawalTransactionsPage extends StatelessWidget {
  final TransactionsViewModel model;
  const WithdrawalTransactionsPage({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: McGyver.rsDoubleW(context, 6)),
      child: ListView.builder(
          itemCount: model.withdrawals.length,
          itemBuilder: (context, index) {
            final withdrawals = model.withdrawals[index];

            return WithdrawalTile(
              title: withdrawals["title"],
              amount: withdrawals["amount"],
              date: withdrawals["date"],
              time: withdrawals["time"],
              onPressed: () {
                model.setListIndex = index;
                model.setTransactionsViewEnum =
                    TransactionsPageEnum.transactionDetails;
              },
              status: withdrawals["status"],
              model: model,
            );
          }),
    );
  }
}
