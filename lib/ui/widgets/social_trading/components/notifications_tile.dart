import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        // ignore: deprecated_member_use
        // color: isDarkMode ? const Color(0xFF94D1F9) : const Color(0xFF20A0F3),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            date,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            time,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
