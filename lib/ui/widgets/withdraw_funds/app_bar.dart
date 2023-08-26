import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/ui/views/withdraw_funds/withdraw_funds_view_model.dart';

import '../../../app/utils/theme.dart';

AppBar withdrawFundAppBar(BuildContext context, String title, String subtitle,
    WithdrawFundViewModel model) {
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
        if (model.withdrawFundPageEnum == WithdrawFundPageEnum.selectAccount) {
          model.goBack();
        } else if (model.withdrawFundPageEnum ==
            WithdrawFundPageEnum.paymentMethods) {
          model.setWithdrawFundViewEnum = WithdrawFundPageEnum.selectAccount;
        } else {
          model.setWithdrawFundViewEnum = WithdrawFundPageEnum.paymentMethods;
        }
      },
    ),
    centerTitle: false,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 2),
            color: isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle.isEmpty
            ? const SizedBox()
            : Text(
                subtitle,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.5),
                  color: isDarkMode ? Colors.white54 : const Color(0xff667085),
                  fontWeight: FontWeight.normal,
                ),
              ),
      ],
    ),
  );
}
