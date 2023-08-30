import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/dimensions.dart';

import '../../../../app/utils/asset_manager.dart';
import '../../../../app/utils/theme.dart';
import '../../../views/transactions/transactions_view_model.dart';

AppBar transactionsAppBar(
    BuildContext context, String title, TransactionsViewModel model) {
  var isDarkMode = CustomThemeData.isDarkMode(context);
  return AppBar(
    elevation: 0,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    automaticallyImplyLeading: false,
    leading: IconButton(
        icon: Icon(
          Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        onPressed: () {
          model.goBack();
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
      Padding(
        padding: EdgeInsets.only(right: 24.pWidth(context)),
        child: InkWell(
          onTap: () {},
          child: SvgPicture.asset(
            AssetManager.filter,
            // ignore: deprecated_member_use
            color: const Color(0xff98A2B3),
          ),
        ),
      )
    ],
  );
}
