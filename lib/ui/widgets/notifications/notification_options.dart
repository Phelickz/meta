import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';

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
                onTap: () {},
                text: "Mark all as read"),
            CustomButtons.clearButton(
                context: context,
                width: 150.pWidth(context),
                color: Theme.of(context).scaffoldBackgroundColor,
                textColor: ColorManager.secondaryTextButtonColor,
                onTap: () {},
                text: "Clear All")
            // Add other widgets here
          ],
        ),
      ),
    );
  }
}
