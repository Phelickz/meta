import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/ui/views/transactions/transactions_view_model.dart';
import 'package:meta_trader/ui/widgets/transactions/deposits.dart';
import 'package:meta_trader/ui/widgets/transactions/internal_transfer.dart';
import 'package:meta_trader/ui/widgets/transactions/withdrawal.dart';

import '../../../app/utils/theme.dart';

class TransactionsPage extends StatelessWidget {
  final TransactionsViewModel model;
  const TransactionsPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return ContainedTabBarView(
      tabs: [
        Text(
          'Withdrawal',
          style: CustomThemeData.generateStyle(
            fontSize: 12,
            color: isDarkMode ? Colors.white54 : Colors.black,
          ),
        ),
        Text(
          'Deposits',
          style: CustomThemeData.generateStyle(
            fontSize: 12,
            color: isDarkMode ? Colors.white54 : Colors.black,
          ),
        ),
        Text(
          'Between Accounts',
          style: CustomThemeData.generateStyle(
            fontSize: 12,
            color: isDarkMode ? Colors.white54 : Colors.black,
          ),
        ),
      ],
      views: [
        WithdrawalTransactionsPage(model: model), // Second tab content
        DepositsTransactionsPage(model: model), // Third tab content
        InternalTransferTransactionsPage(
          model: model,
        ),
      ],
      tabBarProperties: TabBarProperties(
        background: Container(
          color: isDarkMode ? const Color(0xff073961) : const Color(0xffD3ECFD),
        ),
        height: 41.0,
        indicatorColor: Theme.of(context).primaryColor,
        // indicator: BoxDecoration(),
        indicatorWeight: 6.0,
        indicator: UnderlineTabIndicator(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            width: 5.0,
            color: isDarkMode
                ? const Color(0xff0C95EF)
                : Theme.of(context).primaryColor,
          ),
          insets: const EdgeInsets.symmetric(horizontal: 40.0),
        ),
        labelStyle: CustomThemeData.generateStyle(
          fontSize: 13,
          color: isDarkMode ? Colors.black38 : Colors.black,
        ),
        labelColor: isDarkMode
            ? const Color(0xff0C95EF)
            : Theme.of(context).primaryColor,
        unselectedLabelColor: isDarkMode ? Colors.white70 : Colors.black,
      ),
      onChange: (index) {},
    );
  }
}



// DefaultTabController(
//       length: 3,
//       child: Column(
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width,
//             color: isDarkMode
//                 ? const Color(0xff073961)
//                 : const Color(0xffD3ECFD), // Container color
//             child: TabBar(
//               // isScrollable: true,
//               tabs: const [
//                 Tab(text: "Withdrawal"),
//                 Tab(
//                   text: "Deposits",
//                 ),
//                 Tab(
//                   text: "Internal Transfer",
//                 ),
//               ],
//               isScrollable: true,
//               unselectedLabelColor: isDarkMode
//                   ? const Color(0xff98A2B3)
//                   : const Color(0xff344054),
//               labelColor: isDarkMode
//                   ? const Color(0xff77C5F8)
//                   : const Color(0xff0C95EF),

//               indicatorColor: isDarkMode
//                   ? const Color(0xff77C5F8)
//                   : const Color(0xff0C95EF),
//               unselectedLabelStyle: CustomThemeData.generateColoredStyle(
//                   fontSize: 14,
//                   context: context,
//                   fontWeight: FontWeight.w400,
//                   darkTextColor: const Color(0xff98A2B3),
//                   lightTextColor: const Color(0xff344054)),

//               labelStyle: CustomThemeData.generateColoredStyle(
//                   fontSize: 14,
//                   context: context,
//                   fontWeight: FontWeight.w600,
//                   darkTextColor: const Color(0xff77C5F8),
//                   lightTextColor: const Color(0xff0C95EF)),
//               indicatorWeight: 3,

//               // Tab indicator color
//             ),
//           ),
//           Expanded(
//             child: TabBarView(
//               children: [
//                 WithdrawalTransactionsPage(model: model), // Second tab content
//                 DepositsTransactionsPage(model: model), // Third tab content
//                 InternalTransferTransactionsPage(
//                   model: model,
//                 ), // Fourth tab content
//               ],
//             ),
//           ),
//         ],
//       ),
//     );