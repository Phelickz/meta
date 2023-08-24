import 'package:flutter/material.dart';
import 'package:meta_trader/ui/widgets/notifications/app_bar.dart';
import 'package:meta_trader/ui/widgets/notifications/empty_notifications.dart';

import '../../../app/core/custom_base_view_model.dart';
import '../../widgets/notifications/notifications.dart';

enum NotificationStateEnum {
  empty,
  hasNotifications,
}

class NotificationViewModel extends CustomBaseViewModel {
  Future<void> init() async {}

  NotificationStateEnum _notificationStateEnum = NotificationStateEnum.empty;
  NotificationStateEnum get notificationStateEnum => _notificationStateEnum;

  set setNotificationStateEnum(NotificationStateEnum e) {
    _notificationStateEnum = e;
    rebuildUi();
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
    return notificationsAppBar(context, "Notifications", this);
  }
}
