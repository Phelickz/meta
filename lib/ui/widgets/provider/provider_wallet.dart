import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/theme.dart';
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
              "Actions",
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
                  'Deposit Funds',
                  () {},
                ),
                bottomIcons(
                  context,
                  'assets/icons/money_send_outline.svg',
                  'Withdraw Funds',
                  () {},
                ),
                bottomIcons(
                  context,
                  'assets/icons/recovery_convert.svg',
                  'Internal Transfer',
                  () {},
                ),
                bottomIcons(
                  context,
                  'assets/images/message_question.svg',
                  'Report an Issue',
                  () {},
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
                  "Recent Transactions",
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.9),
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? const Color(0xff98A2B3)
                        : const Color(0xFF475467),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "View All",
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
                title: "Deposit from Neteller",
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
                title: "Metawallet to Wallet",
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
                title: "Transfer to SticPay",
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
                title: "Deposit to deriv",
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

