import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/transactions/transactions_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';

import '../../../app/responsiveness/res.dart';

class TransactionDetailsPage extends StatelessWidget {
  final TransactionsViewModel model;
  const TransactionDetailsPage({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: McGyver.rsDoubleW(context, 5),
          vertical: 16.pHeight(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.transactionsTypeEnum == TransactionsTypeEnum.withdrawals
                ? LocaleKeys.withdrawal.tr()
                : model.transactionsTypeEnum == TransactionsTypeEnum.deposits
                    ? LocaleKeys.deposit.tr()
                    : LocaleKeys.internalTransfer.tr(),
            textAlign: TextAlign.left,
            style: CustomThemeData.generateColoredStyle(
                fontSize: 16, context: context, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 28.pHeight(context),
          ),
          Expanded(child: model.returnTransactionDetails()),
          CustomButtons.generalButton(
              context: context,
              onTap: () {},
              text: LocaleKeys.reportTransaction.tr()),
          verticalSpaceMedium(context),
        ],
      ),
    );
  }
}
