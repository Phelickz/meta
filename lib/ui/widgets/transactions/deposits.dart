import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/transactions/transactions_view_model.dart';
import 'package:meta_trader/ui/widgets/transactions/components/transaction_tile.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/utils/theme.dart';

class DepositsTransactionsPage extends StatelessWidget {
  final TransactionsViewModel model;
  const DepositsTransactionsPage({Key? key, required this.model})
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
            LocaleKeys.august,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.8),
              color:
                  isDarkMode ? ColorManager.darkText : ColorManager.lightText,
              fontWeight: FontWeight.bold,
            ),
          ).tr(),
          verticalSpaceXXSmall(context),
          Expanded(
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
                    model.setTransactionsTypeEnum =
                        TransactionsTypeEnum.deposits;
                    model.setTransactionsViewEnum =
                        TransactionsPageEnum.transactionDetails;
                  },
                  status: deposits["status"],
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
