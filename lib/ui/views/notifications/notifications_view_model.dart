import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/notifications/app_bar.dart';
import 'package:meta_trader/ui/widgets/notifications/empty_notifications.dart';
import 'package:meta_trader/ui/widgets/notifications/notification_options.dart';

import '../../../app/core/custom_base_view_model.dart';
import '../../widgets/notifications/notifications.dart';

enum NotificationStateEnum {
  empty,
  hasNotifications,
}

class NotificationViewModel extends CustomBaseViewModel {
  Future<void> init() async {}

  NotificationStateEnum _notificationStateEnum =
      NotificationStateEnum.hasNotifications;
  NotificationStateEnum get notificationStateEnum => _notificationStateEnum;

  bool _markAllAsRead = false;
  bool get markAllAsRead => _markAllAsRead;

  set setNotificationStateEnum(NotificationStateEnum e) {
    _notificationStateEnum = e;
    rebuildUi();
  }

  set setMarkAllAsRead(bool e) {
    _markAllAsRead = e;
    rebuildUi();
  }

  List notifications = [
    {
      "title": LocaleKeys.notification_depositSuccessful.tr(),
      "description":
          "View your withdrawal and deposit history in the deposit of the history at 12.3.2023",
      "date": "2.1.2023 ",
      "time": "16:23:41",
      "isRead": false
    },
    {
      "title": LocaleKeys.notification_depositSuccessful.tr(),
      "description":
          "View your withdrawal and deposit history in the deposit of the history at 12.3.2023",
      "date": "2.1.2023 ",
      "time": "16:23:41",
      "isRead": false
    },
    {
      "title": LocaleKeys.notification_loginFromNewIP.tr(),
      "description":
          "This system has detected a login from a new IP address...",
      "date": "2.1.2023",
      "time": "16:23:41",
      "isRead": false
    },
    {
      "title": LocaleKeys.notification_loginFromNewIP.tr(),
      "description":
          "This system has detected a login from a new IP address...",
      "date": "2.1.2023",
      "time": "16:23:41",
      "isRead": false
    },
    {
      "title": LocaleKeys.notification_loginFromNewIP.tr(),
      "description":
          "This system has detected a login from a new IP address...",
      "date": "2.1.2023",
      "time": "16:23:41",
      "isRead": false
    },
    {
      "title": LocaleKeys.notification_loginFromNewIP.tr(),
      "description":
          "This system has detected a login from a new IP address...",
      "date": "2.1.2023",
      "time": "16:23:41",
      "isRead": false
    },
    {
      "title": LocaleKeys.notification_loginFromNewIP.tr(),
      "description":
          "This system has detected a login from a new IP address...",
      "date": "2.1.2023",
      "time": "16:23:41",
      "isRead": false
    },
    {
      "title": LocaleKeys.notification_withdrawalSuccessful.tr(),
      "description":
          "View your withdrawal and deposit history in the deposit of the history at 12.3.2023",
      "date": "2.1.2023",
      "time": "16:23:41",
      "isRead": false
    },
  ];

  void markAsRead(int index) {
    if (index >= 0 && index < notifications.length) {
      notifications[index]["isRead"] = true;
      rebuildUi();
    }
  }

  void openOptionsBottomSheet(
    BuildContext context,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return NotificationOptionsBottomSheet(
          model: this,
        );
      },
    );
  }

  Widget returnPage() {
    switch (_notificationStateEnum) {
      case NotificationStateEnum.empty:
        return EmptyNotificationPage(model: this);

      case NotificationStateEnum.hasNotifications:
        return NotificationPage(model: this);

      default:
        return Container();
    }
  }

  AppBar? returnAppBar(BuildContext context) {
    switch (_notificationStateEnum) {
      case NotificationStateEnum.empty:
        return notificationsAppBar(
            context,
            LocaleKeys.notification_notificationText.tr(),
            this,
            NotificationStateEnum.empty);
      case NotificationStateEnum.hasNotifications:
        return notificationsAppBar(
            context,
            LocaleKeys.notification_notificationText.tr(),
            this,
            NotificationStateEnum.hasNotifications);
      default:
        return null;
    }
  }
}
