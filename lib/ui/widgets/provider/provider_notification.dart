import 'package:flutter/material.dart';
import 'package:meta_trader/ui/widgets/notifications/components/notifications_tile.dart';

import '../../views/provider/provider_view_model.dart';

class ProviderNotificationPage extends StatelessWidget {
  final ProviderViewModel viewModel;

  const ProviderNotificationPage({Key? key, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: viewModel.notifications.length,
        itemBuilder: (context, index) {
          final notification = viewModel.notifications[index];
          return NotificationTile(
              title: notification["title"],
              description: notification['description'],
              date: notification["date"],
              time: notification["time"],
              onPressed: () {
                // model.markAsRead(index);
              },
              isRead: notification["isRead"]);
        });
  }
}
