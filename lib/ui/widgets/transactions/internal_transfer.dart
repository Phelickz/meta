import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/transactions/transactions_view_model.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import 'components/transaction_tile.dart';

class InternalTransferTransactionsPage extends StatelessWidget {
  final TransactionsViewModel model;
  const InternalTransferTransactionsPage({Key? key, required this.model})
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
              color:
                  isDarkMode ? ColorManager.darkText : ColorManager.lightText,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpaceXXSmall(context),
          Expanded(
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
          )
        ],
      ),
    );
  }
}
