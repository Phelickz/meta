import 'package:flutter/material.dart';
import 'package:meta_trader/ui/views/transactions/transactions_view_model.dart';
import 'package:meta_trader/ui/widgets/transactions/deposits.dart';
import 'package:meta_trader/ui/widgets/transactions/internal_transfer.dart';
import 'package:meta_trader/ui/widgets/transactions/withdrawal.dart';

import '../../../app/utils/theme.dart';
import 'all.dart';

class TransactionsPage extends StatelessWidget {
  final TransactionsViewModel model;
  const TransactionsPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: isDarkMode
                ? Color(0xff073961)
                : Color(0xffD3ECFD), // Container color
            child: TabBar(
              // isScrollable: true,
              tabs: [
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
              unselectedLabelColor:
                  isDarkMode ? Color(0xff98A2B3) : Color(0xff344054),
              labelColor: isDarkMode ? Color(0xff77C5F8) : Color(0xff0C95EF),

              indicatorColor:
                  isDarkMode ? Color(0xff77C5F8) : Color(0xff0C95EF),
              unselectedLabelStyle: CustomThemeData.generateColoredStyle(
                  fontSize: 14,
                  context: context,
                  fontWeight: FontWeight.w400,
                  darkTextColor: Color(0xff98A2B3),
                  lightTextColor: Color(0xff344054)),

              labelStyle: CustomThemeData.generateColoredStyle(
                  fontSize: 14,
                  context: context,
                  fontWeight: FontWeight.w600,
                  darkTextColor: Color(0xff77C5F8),
                  lightTextColor: Color(0xff0C95EF)),
              indicatorWeight: 3,

              // Tab indicator color
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                AllTransactionsPage(model: model), // First tab content
                WithdrawalTransactionsPage(model: model), // Second tab content
                DepositsTransactionsPage(model: model), // Third tab content
                InternalTransferTransactionsPage(
                  model: model,
                ), // Fourth tab content
              ],
            ),
          ),
        ],
      ),
    );
  }
}
