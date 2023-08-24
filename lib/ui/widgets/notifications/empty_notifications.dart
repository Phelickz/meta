// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/utils/theme.dart';
import '../../views/notifications/notifications_view_model.dart';

class EmptyNotificationPage extends StatelessWidget {
  final NotificationViewModel model;

  const EmptyNotificationPage({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: McGyver.rsDoubleW(context, 6),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 120.pHeight(context),
              ),
              Container(
                width: 76.pWidth(context),
                height: 76.pHeight(context),
                padding: EdgeInsets.symmetric(
                    horizontal: 12.pWidth(context),
                    vertical: 12.pHeight(context)),
                decoration: BoxDecoration(
                    color: isDarkMode ? Color(0xff052844) : Color(0xffD3ECFD),
                    borderRadius: BorderRadius.circular(20)),
                child: SvgPicture.asset(
                  AssetManager.emptyNotifications,
                ),
              ),
              SizedBox(
                height: 30.pHeight(context),
              ),
              Text("No Notifications Yet",
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.6),
                    color: isDarkMode ? Colors.white : const Color(0xff667085),
                    fontWeight: FontWeight.w400,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
