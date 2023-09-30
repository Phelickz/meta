import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';
import 'package:meta_trader/ui/widgets/social_trading/components/transaction_tile.dart';

import '../../../app/responsiveness/size.dart';

class WalletPage extends StatelessWidget {
  final SocialTradingViewModel viewModel;
  const WalletPage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: McGyver.rsDoubleW(context, 6),
            vertical: McGyver.rsDoubleH(context, 2),
          ),
          color: isDarkMode ? const Color(0xff052844) : const Color(0xff20A0F3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceXSmall(context),
              Text(
                LocaleKeys.walletBalance,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.3),
                  fontWeight: FontWeight.w500,
                  color: isDarkMode ? const Color(0xffD0D5DD) : Colors.white,
                ),
              ).tr(),
              SizedBox(
                height: McGyver.rsDoubleH(context, 0.2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        viewModel.showBalance == true
                            ? "\$283,500"
                            : "*********",
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 3),
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? const Color(0xffD0D5DD)
                              : Colors.white,
                        ),
                      ),
                      horizontalSpaceXXSmall(context),
                      IconButton(
                        onPressed: () {
                          viewModel.setShowBalance();
                        },
                        icon: viewModel.showBalance == false
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.remove_red_eye_outlined),
                        color: isDarkMode
                            ? const Color(0xff98A2B3)
                            : const Color(0xFFD3ECFD),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "30%",
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 1.5),
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? const Color(0xff94D1F9)
                              : Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: McGyver.rsDoubleH(context, 0.2),
                      ),
                      Text(
                        LocaleKeys.over24hours,
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 1.3),
                          fontWeight: FontWeight.w500,
                          color: isDarkMode
                              ? const Color(0xffD0D5DD)
                              : Colors.white,
                        ),
                      ).tr(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        verticalSpaceSmall(context),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: McGyver.rsDoubleW(context, 6),
          ),
          child: Column(
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
              ).tr(),
              verticalSpaceXSmall(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  bottomIcons(
                    context,
                    'assets/icons/money_receive_outline.svg',
                    LocaleKeys.depositFunds.tr(),
                    () {
                      viewModel.push(const FundAccountRoute());
                    },
                  ),
                  bottomIcons(
                    context,
                    'assets/icons/money_send_outline.svg',
                    LocaleKeys.withdrawFunds.tr(),
                    () {
                      viewModel.push(const WithdrawFundRoute());
                    },
                  ),
                  bottomIcons(
                    context,
                    'assets/icons/recovery_convert.svg',
                    LocaleKeys.internalTransfer.tr(),
                    () {
                      viewModel.push(const InternalTransferRoute());
                    },
                  ),
                  bottomIcons(
                    context,
                    'assets/images/message_question.svg',
                    LocaleKeys.providerWidget_providerWallet_reportAnIssue.tr(),
                    () {
                      viewModel.push(const HelpAndSupportRoute());
                    },
                  )
                ],
              ),
            ],
          ),
        ),
        verticalSpaceXXSmall(context),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: McGyver.rsDoubleW(context, 6),
              ),
              child: Row(
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
                  ).tr(),
                  TextButton(
                    onPressed: () {
                      viewModel.setSocialTradingPageEnum =
                          SocialTradingPageEnum.transactionHistory;
                    },
                    child: Text(
                      LocaleKeys.viewAll,
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.4),
                        fontWeight: FontWeight.w500,
                        color: isDarkMode
                            ? const Color(0xff77C5F8)
                            : const Color(0xFF20A0F3),
                      ),
                    ).tr(),
                  ),
                ],
              ),
            ),
            verticalSpaceXSmall(context),
            TransactionTile(
              viewModel: viewModel,
              transaction: TransactionModel(
                id: "1",
                type: TransactionsTypeEnum.deposit,
                title: LocaleKeys
                    .providerWidget_providerWallet_depositFromNeteller
                    .tr(),
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
                title: LocaleKeys
                    .providerWidget_providerWallet_metaWalletToWallet
                    .tr(),
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
                title: LocaleKeys
                    .providerWidget_providerWallet_transferToSticPay
                    .tr(),
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
                title: LocaleKeys.providerWidget_providerWallet_depositToDeriv
                    .tr(),
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
