import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/provider/provider_view_model.dart';

import '../../../app/responsiveness/size.dart';
import 'components/transaction_tile.dart';

class WalletPage extends StatelessWidget {
  final ProviderViewModel viewModel;
  const WalletPage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpaceSmall(context),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.actions,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.9),
                fontWeight: FontWeight.bold,
                color: isDarkMode
                    ? const Color(0xff98A2B3)
                    : const Color(0xFF475467),
              ),
            ),
            verticalSpaceXSmall(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                bottomIcons(
                  context,
                  'assets/icons/money_receive_outline.svg',
                  LocaleKeys.depositFunds,
                  () {
                    viewModel.push(const FundAccountRoute());
                  },
                ),
                bottomIcons(
                  context,
                  'assets/icons/money_send_outline.svg',
                  LocaleKeys.withdrawFunds,
                  () {
                    viewModel.push(const WithdrawFundRoute());
                  },
                ),
                bottomIcons(
                  context,
                  'assets/icons/recovery_convert.svg',
                  LocaleKeys.internalTransfer,
                  () {
                    viewModel.push(const InternalTransferRoute());
                  },
                ),
                bottomIcons(
                  context,
                  'assets/images/message_question.svg',
                  LocaleKeys.providerWidget_providerWallet_reportAnIssue,
                  () {
                    viewModel.push(const HelpAndSupportRoute());
                  },
                )
              ],
            ),
          ],
        ),
        verticalSpaceXXSmall(context),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.recentTransaction,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.9),
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? const Color(0xff98A2B3)
                        : const Color(0xFF475467),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    viewModel.push(const TransactionsRoute());
                  },
                  child: Text(
                    LocaleKeys.viewMore,
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.4),
                      fontWeight: FontWeight.w500,
                      color: isDarkMode
                          ? const Color(0xff77C5F8)
                          : const Color(0xFF20A0F3),
                    ),
                  ),
                ),
              ],
            ),
            verticalSpaceXSmall(context),
            TransactionTile(
              viewModel: viewModel,
              transaction: TransactionModel(
                id: "1",
                type: TransactionsTypeEnum.deposit,
                title: LocaleKeys
                    .providerWidget_providerWallet_depositFromNeteller,
                amount: "55,000",
                status: TransactionStatusEnum.successful,
                date: "2.1.2023",
                time: "16:23:41",
              ),
            ),
            TransactionTile(
              viewModel: viewModel,
              transaction: TransactionModel(
                id: "1",
                type: TransactionsTypeEnum.internalTransfer,
                title:
                    LocaleKeys.providerWidget_providerWallet_metaWalletToWallet,
                amount: "55,000",
                status: TransactionStatusEnum.pending,
                date: "2.1.2023",
                time: "16:23:41",
              ),
            ),
            TransactionTile(
              viewModel: viewModel,
              transaction: TransactionModel(
                id: "1",
                type: TransactionsTypeEnum.withdrawal,
                title:
                    LocaleKeys.providerWidget_providerWallet_transferToSticPay,
                amount: "55,000",
                status: TransactionStatusEnum.successful,
                date: "2.1.2023",
                time: "16:23:41",
              ),
            ),
            TransactionTile(
              viewModel: viewModel,
              transaction: TransactionModel(
                id: "1",
                type: TransactionsTypeEnum.deposit,
                title: LocaleKeys.providerWidget_providerWallet_depositToDeriv,
                amount: "55,000",
                status: TransactionStatusEnum.failed,
                date: "2.1.2023",
                time: "16:23:41",
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget bottomIcons(
      BuildContext context, String image, String text, void Function()? onTap) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDarkMode
                  ? const Color(0xFF052844)
                  : const Color(0xFF47B0F5),
            ),
            child: Padding(
              padding: EdgeInsets.all(
                McGyver.rsDoubleH(context, 2.2),
              ),
              child: Center(
                child: SvgPicture.asset(
                  image,
                  colorFilter: ColorFilter.mode(
                    isDarkMode ? const Color(0xff47B0F5) : Colors.white,
                    BlendMode.srcIn,
                  ),
                  height: McGyver.rsDoubleH(context, 3),
                  width: McGyver.rsDoubleH(context, 3),
                ),
              ),
            ),
          ),
          verticalSpaceXSmall(context),
          SizedBox(
            width: McGyver.rsDoubleW(context, 18),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(
                  context,
                  1.4,
                ),
                fontWeight: FontWeight.w500,
                color: isDarkMode
                    ? const Color(0xffD0D5DD)
                    : const Color(0xFF475467),
              ),
            ),
          ),
          verticalSpaceSmall(context)
        ],
      ),
    );
  }
}
