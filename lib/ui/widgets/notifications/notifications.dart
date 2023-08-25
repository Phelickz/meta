// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:meta_trader/ui/widgets/notifications/components/notifications_tile.dart';

import '../../../app/responsiveness/res.dart';
import '../../views/notifications/notifications_view_model.dart';

class NotificationPage extends StatelessWidget {
  final NotificationViewModel model;

  const NotificationPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 6),
      ),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: model.notifications.length,
          itemBuilder: (context, index) {
            final notification = model.notifications[index];
            return NotificationTile(
                title: notification["title"],
                description: notification['description'],
                date: notification["date"],
                time: notification["time"],
                onPressed: () {
                  model.markAsRead(index);
                },
                isRead: notification["isRead"]);
          }),
    );
  }
}
