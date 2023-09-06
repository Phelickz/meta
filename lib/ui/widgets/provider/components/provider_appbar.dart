import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/provider/provider_view_model.dart';

class ProviderAppbar{

  static AppBar simpleAppBar(
    ProviderViewModel model,
    BuildContext context,
    String title,
    String subTitle,
    Widget? icon
  ){
    return AppBar(
      elevation: 0,
      backgroundColor:  Theme.of(context).scaffoldBackgroundColor,

      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(
          Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
          color: model.isDarkMode() ? const Color(0xffD2D2D2) : Colors.black,
        ),
        onPressed: () {
          model.goBack();
        }),
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: CustomThemeData.generateColoredStyle(fontSize: 18, context: context,fontWeight: FontWeight.w600 ),
          ),
          SizedBox(height: 4.pHeight(context),),
          Text(
            subTitle,
            style: CustomThemeData.generateColoredStyle(fontSize: 14, context: context,fontWeight: FontWeight.w400 ),
          ),
        ],
      ),
      actions: [
        icon??const SizedBox()
      ],
    );
  }

}