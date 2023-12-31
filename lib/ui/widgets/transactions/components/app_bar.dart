// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/constants.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/ui/widgets/social_trading/components/filter_modal.dart';

import '../../../../app/utils/asset_manager.dart';
import '../../../../app/utils/theme.dart';
import '../../../views/transactions/transactions_view_model.dart';

AppBar transactionsAppBar(
    BuildContext context, String title, TransactionsViewModel model) {
  var isDarkMode = CustomThemeData.isDarkMode(context);
  return AppBar(
    elevation: 0,
    backgroundColor: isDarkMode
        ? const Color(0xff052844)
        : Theme.of(context).scaffoldBackgroundColor,
    automaticallyImplyLeading: false,
    leading: IconButton(
        icon: Icon(
          Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        onPressed: () {
          if (model.transactionsPageEnum == TransactionsPageEnum.transactions) {
            Navigator.pop(context);
          }
          if (model.transactionsPageEnum ==
              TransactionsPageEnum.transactionDetails) {
            model.setTransactionsViewEnum = TransactionsPageEnum.transactions;
          }
        }),
    centerTitle: false,
    title: Text(
      title,
      style: CustomThemeData.generateStyle(
        fontSize: McGyver.textSize(context, 2),
        color: isDarkMode ? Colors.white : Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: [
      model.transactionsPageEnum == TransactionsPageEnum.transactions
          ? Padding(
              padding: Constants.getPadding(context, 24.pWidth(context)),
              child: InkWell(
                onTap: () {
                  showFilterModal(context);
                },
                child: SvgPicture.asset(
                  AssetManager.filter,
                  color: const Color(0xff98A2B3),
                ),
              ),
            )
          : const SizedBox()
    ],
  );
}

void showFilterModal(BuildContext context) {
  var isDarkMode = CustomThemeData.isDarkMode(context);
  showModalBottomSheet(
      backgroundColor:
          isDarkMode ? const Color(0xFF0C2031) : const Color(0xFFFAFDFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(McGyver.rsDoubleH(context, 2)),
          topRight: Radius.circular(McGyver.rsDoubleH(context, 2)),
        ),
      ),
      context: context,
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true,
      builder: (context) {
        return const FilterTransactionModal();
      });
}
