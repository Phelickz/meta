import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/ui/widgets/settings/components/notification_settings_tile.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/utils/theme.dart';
import '../../views/settings/settings_view_model.dart';

class NotificationSettingsPage extends StatelessWidget {
  final SettingsViewModel model;

  const NotificationSettingsPage({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.pHeight(context),
          ),
          Text(
            "App",
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.7),
              color: isDarkMode ? Colors.white54 : const Color(0xff667085),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 10.pHeight(context),
          ),
          SizedBox(
            width: double.infinity,
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 1.pHeight(context),
                  );
                },
                shrinkWrap: true,
                itemCount: model.switchValues.length,
                itemBuilder: (context, index) {
                  return NotificationSettingsTile(
                      title: model.switchValues[index]["title"],
                      value: model.switchValues[index]["value"],
                      onChanged: (value) {
                        model.toggleSwitch(index, value);
                      });
                }),
          )
        ],
      ),
    );
  }
}
