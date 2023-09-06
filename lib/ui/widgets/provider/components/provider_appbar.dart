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
  static AppBar appBarTwo(
    ProviderViewModel model,
    BuildContext context,
  ){
    return AppBar(
      elevation: 0,
      backgroundColor:  Theme.of(context).scaffoldBackgroundColor,
      leading: IconButton(
        icon: Icon(
          Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
          color: model.isDarkMode() ? const Color(0xffD2D2D2) : Colors.black,
        ),
        onPressed: () {
          // model.goBack();
        }),
      centerTitle: true,
      title: Container(
            width: 180,
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xff1D2939),
              borderRadius: BorderRadius.circular(60),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: model.overviewTabSelectedNotifier.value==0
                        ? ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          )
                        : null,
                    onPressed: () => model.setTabNotifiier(0),
                    child: Text(
                      'Overview',
                      style: CustomThemeData.generateStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TextButton(
                    style: model.overviewTabSelectedNotifier.value==1
                        ? ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          )
                        : null,
                    onPressed: ()=>model.setTabNotifiier(1),
                    child: Text(
                      'Trade History',
                      style: CustomThemeData.generateStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.menu, color: model.isDarkMode()?Colors.white:Colors.black,))
      ],
    );
  }
}