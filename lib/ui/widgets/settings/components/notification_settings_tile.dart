import 'package:flutter/material.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/utils/theme.dart';

class NotificationSettingsTile extends StatelessWidget {
  final String title;
  final bool value;
  final Function onChanged;

  const NotificationSettingsTile(
      {Key? key,
      required this.title,
      required this.value,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return ListTile(
        title: Text(
          title,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.5),
            color: isDarkMode ? Colors.white54 : const Color(0xff667085),
            fontWeight: FontWeight.normal,
          ),
        ),
        trailing: Switch.adaptive(
          value: value,
          activeColor: Colors.blue,
          onChanged: (bool value) {
            onChanged(value);
          },
        ));
  }
}
