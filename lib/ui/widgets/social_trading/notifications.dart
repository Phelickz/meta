import 'package:flutter/material.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';

import '../../../app/responsiveness/res.dart';
import 'components/notifications_tile.dart';

class NotificationPage extends StatelessWidget {
  final SocialTradingViewModel viewModel;

  const NotificationPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 6),
      ),
      child: ListView.builder(
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
                  viewModel.markAsRead(index);
                },
                isRead: notification["isRead"]);
          }),
    );
  }
}
