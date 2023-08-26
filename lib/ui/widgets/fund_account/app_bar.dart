import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/ui/views/fund_account/fund_account_view_model.dart';

import '../../../app/utils/theme.dart';

AppBar fundAccountAppBar(BuildContext context, String title, String subtitle,
    FundAccountViewModel model) {
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
        if (model.fundAccountPageEnum == FundAccountPageEnum.selectAccount) {
          model.goBack();
        } else if (model.fundAccountPageEnum ==
            FundAccountPageEnum.selectDepositMethod) {
          model.setFundAccountPageEnum = FundAccountPageEnum.selectAccount;
        } else {
          model.setFundAccountPageEnum =
              FundAccountPageEnum.selectDepositMethod;
        }

        // if (model.authPageEnum == AuthPageEnum.chooseAccount) {
        //   model.setAuthPageEnum = AuthPageEnum.broker;
        // }

        // if (model.authPageEnum == AuthPageEnum.login) {
        //   model.setAuthPageEnum = AuthPageEnum.chooseAccount;
        // }

        // if (model.authPageEnum == AuthPageEnum.demoAccount) {
        //   model.setAuthPageEnum = AuthPageEnum.chooseAccount;
        // }

        // if (model.authPageEnum == AuthPageEnum.realAccount) {
        //   model.setAuthPageEnum = AuthPageEnum.chooseAccount;
        // }

        // if (model.authPageEnum == AuthPageEnum.created) {
        //   model.setAuthPageEnum = AuthPageEnum.chooseAccount;
        // }
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
        Text(
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
