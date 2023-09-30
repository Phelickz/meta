import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';

import '../../views/notifications/notifications_view_model.dart';
import '../buttons/buttons.dart';

class NotificationOptionsBottomSheet extends StatelessWidget {
  final NotificationViewModel model;

  const NotificationOptionsBottomSheet({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
            top: Radius.circular(10.0)), // Customize the radius
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomButtons.generalButton(
              context: context,
              width: 150.pWidth(context),
              onTap: () {
                model.setMarkAllAsRead = true;
                Navigator.pop(context);
              },
              text: LocaleKeys.notification_markAllAsRead.tr(),
            ),
            CustomButtons.clearButton(
              context: context,
              width: 150.pWidth(context),
              color: Theme.of(context).scaffoldBackgroundColor,
              textColor: ColorManager.secondaryTextButtonColor,
              onTap: () {
                model.setNotificationStateEnum = NotificationStateEnum.empty;
                Navigator.pop(context);
              },
              text: LocaleKeys.notification_clearAll.tr(),
            )
            // Add other widgets here
          ],
        ),
      ),
    );
  }
}
