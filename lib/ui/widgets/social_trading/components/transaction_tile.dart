import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';

import '../../../../app/utils/theme.dart';

class TransactionTile extends StatelessWidget {
  final SocialTradingViewModel viewModel;
  final TransactionModel transaction;
  const TransactionTile({
    super.key,
    required this.transaction,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return InkWell(
      onTap: () {
        viewModel.setTransaction = transaction;
        viewModel.setSocialTradingPageEnum =
            SocialTradingPageEnum.transactionDetails;
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: McGyver.rsDoubleH(context, 2),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: McGyver.rsDoubleW(context, 6),
        ),
        child: Row(
          children: [
            Container(
              width: McGyver.rsDoubleW(context, 11),
              height: McGyver.rsDoubleW(context, 11),
              padding: EdgeInsets.symmetric(
                horizontal: McGyver.rsDoubleW(context, 2.5),
              ),
              decoration: BoxDecoration(
                color: viewModel.bgColorForTransactionType(
                  transaction.type,
                  isDarkMode,
                ),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                viewModel.assetNameForTransactionType(
                  transaction.type,
                ),
                colorFilter: ColorFilter.mode(
                    viewModel.iconColorForTransactionType(
                      transaction.type,
                      isDarkMode,
                    ),
                    BlendMode.srcIn),
              ),
            ),
            horizontalSpaceSmall(context),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.title.tr(),
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.9),
                      fontWeight: FontWeight.bold,
                      color: isDarkMode
                          ? const Color(0xFFD0D5DD)
                          : const Color(0xFF667085),
                    ),
                  ),
                  SizedBox(
                    height: McGyver.rsDoubleH(context, 0.3),
                  ),
                  Text(
                    "\$${transaction.amount}",
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.4),
                      fontWeight: FontWeight.w500,
                      color: isDarkMode
                          ? const Color(0xFFD0D5DD)
                          : const Color(0xFF667085),
                    ),
                  ),
                  Text(
                    transaction.status == TransactionStatusEnum.successful
                        ? LocaleKeys.successful.tr()
                        : transaction.status == TransactionStatusEnum.pending
                            ? LocaleKeys.pending.tr()
                            : LocaleKeys.failed.tr(),
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.3),
                      color: viewModel.statusColorForTransactionType(
                          transaction.status, isDarkMode),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  transaction.date,
                  style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.3),
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF98A2B3)),
                ),
                SizedBox(
                  height: McGyver.rsDoubleH(context, 0.2),
                ),
                Text(
                  transaction.time,
                  style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.3),
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF98A2B3)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
