import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/transactions/transactions_view_model.dart';
import 'package:meta_trader/ui/widgets/transactions/components/transaction_tile.dart';

import '../../../app/responsiveness/res.dart';

class WithdrawalTransactionsPage extends StatelessWidget {
  final TransactionsViewModel model;
  const WithdrawalTransactionsPage({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: McGyver.rsDoubleW(context, 6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceSmall(context),
          Text(
            'August',
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.8),
              color: isDarkMode ? ColorManager.darkText : ColorManager.darkText,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpaceXXSmall(context),
          Expanded(
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
              },
            ),
          )
        ],
      ),
    );
  }
}
