import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';

class StatusTag extends StatelessWidget {
  final String status;
  final Color color;
  const StatusTag({super.key, required this.status, required this.color});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      height: 18.pHeight(context),
      width: 50.pWidth(context),
      padding: EdgeInsets.symmetric(
        horizontal: 6.pWidth(context),
        vertical: 2.pHeight(context)
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white
      ),
      child: Center(
        child: Row(
          children: [
            Container(
              height: 4.pHeight(context),
              width: 4.pWidth(context),
              // color: color,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: color
              ),
            ),
            const Spacer(),
            Text(
              status,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.2),
                color: isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.w300
              ),
            )
          ],
        ),
      ),
    );
  }
}