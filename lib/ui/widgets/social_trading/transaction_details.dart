import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';

import '../../views/social_trading/social_trading_view_model.dart';

class TransactionDetailsPage extends StatelessWidget {
  final TransactionModel transaction;
  final SocialTradingViewModel viewModel;
  const TransactionDetailsPage({
    super.key,
    required this.transaction,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceXSmall(context),
          Text(
            transaction.type == TransactionsTypeEnum.withdrawal
                ? LocaleKeys.withdrawal
                : transaction.type == TransactionsTypeEnum.deposit
                    ? LocaleKeys.deposit.tr()
                    : LocaleKeys.internalTransfer.tr(),
            textAlign: TextAlign.left,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.9),
              fontWeight: FontWeight.bold,
              color: isDarkMode
                  ? const Color(0xff98A2B3)
                  : const Color(0xFF475467),
            ),
          ),
          verticalSpaceSmall(context),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(
                  width: McGyver.rsDoubleW(context, 4),
                ),
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction.title,
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 2.1),
                            fontWeight: FontWeight.bold,
                            color: isDarkMode
                                ? const Color(0xFFD0D5DD)
                                : const Color(0xFF667085),
                          ),
                        ),
                        SizedBox(
                          height: McGyver.rsDoubleH(
                            context,
                            1,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LocaleKeys.date,
                              style: CustomThemeData.generateStyle(
                                  fontSize: McGyver.textSize(context, 1.4),
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF98A2B3)),
                            ).tr(),
                            Text(
                              "${transaction.date} ${transaction.time}",
                              style: CustomThemeData.generateStyle(
                                fontSize: McGyver.textSize(context, 1.4),
                                fontWeight: FontWeight.w500,
                                color: isDarkMode
                                    ? const Color(0xFFD0D5DD)
                                    : const Color(0xFF98A2B3),
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: McGyver.rsDoubleH(context, 0.7),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LocaleKeys.sender,
                              style: CustomThemeData.generateStyle(
                                  fontSize: McGyver.textSize(context, 1.4),
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF98A2B3)),
                            ).tr(),
                            Text(
                              "CT_Wallet",
                              style: CustomThemeData.generateStyle(
                                fontSize: McGyver.textSize(context, 1.4),
                                fontWeight: FontWeight.w500,
                                color: isDarkMode
                                    ? const Color(0xFFD0D5DD)
                                    : const Color(0xFF98A2B3),
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: McGyver.rsDoubleH(context, 0.7),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LocaleKeys.receiver,
                              style: CustomThemeData.generateStyle(
                                fontSize: McGyver.textSize(context, 1.4),
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF98A2B3),
                              ),
                            ).tr(),
                            Text(
                              "BinancePay",
                              style: CustomThemeData.generateStyle(
                                fontSize: McGyver.textSize(context, 1.4),
                                fontWeight: FontWeight.w500,
                                color: isDarkMode
                                    ? const Color(0xFFD0D5DD)
                                    : const Color(0xFF98A2B3),
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: McGyver.rsDoubleH(context, 0.7),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LocaleKeys.status,
                              style: CustomThemeData.generateStyle(
                                  fontSize: McGyver.textSize(context, 1.4),
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF98A2B3)),
                            ).tr(),
                            Text(
                              transaction.status.name,
                              style: CustomThemeData.generateStyle(
                                fontSize: McGyver.textSize(context, 1.4),
                                color: viewModel.statusColorForTransactionType(
                                    transaction.status, isDarkMode),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: McGyver.rsDoubleH(context, 0.7),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LocaleKeys.transactionId,
                              style: CustomThemeData.generateStyle(
                                  fontSize: McGyver.textSize(context, 1.4),
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF98A2B3)),
                            ).tr(),
                            Text(
                              "232443564642",
                              style: CustomThemeData.generateStyle(
                                fontSize: McGyver.textSize(context, 1.4),
                                fontWeight: FontWeight.w500,
                                color: isDarkMode
                                    ? const Color(0xFFD0D5DD)
                                    : const Color(0xFF98A2B3),
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                      ]),
                ),
              ],
            ),
          ),
          CustomButtons.generalButton(
            context: context,
            onTap: () {},
            text: LocaleKeys.reportTransaction.tr(),
          ),
          verticalSpaceSmall(context),
          verticalSpaceSmall(context),
        ],
      ),
    );
  }
}
