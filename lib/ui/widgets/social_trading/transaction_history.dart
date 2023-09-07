import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';
import 'package:meta_trader/ui/widgets/social_trading/components/all_transactions.dart';
import 'package:meta_trader/ui/widgets/social_trading/components/deposit_transactions.dart';
import 'package:meta_trader/ui/widgets/social_trading/components/internal_transfer_transactions.dart';
import 'package:meta_trader/ui/widgets/social_trading/components/withdraw_transactions.dart';

class TransactionHistory extends StatelessWidget {
  final SocialTradingViewModel viewModel;
  const TransactionHistory({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            color: isDarkMode
                ? const Color(0xff073961)
                : const Color(0xffD3ECFD), // Container color
            child: TabBar(
              // isScrollable: true,
              tabs: const [
                Tab(text: "All"),
                Tab(text: "Withdrawal"),
                Tab(
                  text: "Deposits",
                ),
                Tab(
                  text: "Internal Transfer",
                ),
              ],
              isScrollable: true,
              unselectedLabelColor: isDarkMode
                  ? const Color(0xff98A2B3)
                  : const Color(0xff344054),
              labelColor: isDarkMode
                  ? const Color(0xff77C5F8)
                  : const Color(0xff0C95EF),

              indicatorColor: isDarkMode
                  ? const Color(0xff77C5F8)
                  : const Color(0xff0C95EF),
              unselectedLabelStyle: CustomThemeData.generateColoredStyle(
                  fontSize: 14,
                  context: context,
                  fontWeight: FontWeight.w400,
                  darkTextColor: const Color(0xff98A2B3),
                  lightTextColor: const Color(0xff344054)),

              labelStyle: CustomThemeData.generateColoredStyle(
                  fontSize: 14,
                  context: context,
                  fontWeight: FontWeight.w600,
                  darkTextColor: const Color(0xff77C5F8),
                  lightTextColor: const Color(0xff0C95EF)),
              indicatorWeight: 3,

              // Tab indicator color
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                AllTransactionsComponent(viewModel: viewModel),
                WithdrawTransactionsComponent(viewModel: viewModel),
                DepositTransactionsComponent(viewModel: viewModel),
                InternalTransferTransactionsComponent(viewModel: viewModel)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
