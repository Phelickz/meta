import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';
import 'package:meta_trader/ui/widgets/social_trading/components/transaction_tile.dart';

class WithdrawTransactionsComponent extends StatelessWidget {
  final SocialTradingViewModel viewModel;
  const WithdrawTransactionsComponent({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: McGyver.rsDoubleH(context, 2)),
      child: ListView.builder(
          itemCount: viewModel.withdrawals.length,
          itemBuilder: (context, index) {
            final withdrawal = viewModel.withdrawals[index];
            return TransactionTile(
              transaction: withdrawal,
              viewModel: viewModel,
            );
          }),
    );
  }
}
