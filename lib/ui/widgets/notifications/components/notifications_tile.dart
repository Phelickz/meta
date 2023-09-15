// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';

class NotificationTile extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String time;
  final bool isRead;
  final VoidCallback onPressed;
  const NotificationTile(
      {Key? key,
      required this.title,
      required this.description,
      required this.date,
      required this.time,
      required this.onPressed,
      required this.isRead})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onPressed,
      leading: SvgPicture.asset(
        AssetManager.emptyNotifications,
        // color: Theme.of(context).primaryColor,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: McGyver.textSize(context, 1.8),
            ),
      ),
      subtitle: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontSize: McGyver.textSize(context, 1.3),
            ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            date,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: McGyver.textSize(context, 1.1),
                ),
          ),
          Text(
            time,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: McGyver.textSize(context, 1.1),
                ),
          )
        ],
      ),
    );
  }
}
