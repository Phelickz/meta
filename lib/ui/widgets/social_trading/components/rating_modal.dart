import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';

class RatingModal extends StatelessWidget {
  const RatingModal({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      height: McGyver.rsDoubleH(context, 35),
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 6),
        vertical: McGyver.rsDoubleH(context, 4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Rate Satoshi Nakamoto",
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.6),
              fontWeight: FontWeight.w500,
              color: isDarkMode
                  ? const Color(0xFF98A2B3)
                  : const Color(0xFF667085),
            ),
          ),
          verticalSpaceSmall(context),
          Text(
            "Take a moment and rate me",
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.7),
              fontWeight: FontWeight.bold,
              color: isDarkMode
                  ? const Color(0xFFFFFFFF)
                  : const Color(0xFF475467),
            ),
          ),
          verticalSpaceXSmall(context),
          Row(
            children: [
              Icon(
                Icons.star,
                size: 26,
                color: Colors.amber[300],
              ),
              Icon(
                Icons.star,
                size: 26,
                color: Colors.amber[300],
              ),
              Icon(
                Icons.star,
                size: 26,
                color: Colors.amber[300],
              ),
              Icon(
                Icons.star,
                size: 26,
                color: Colors.amber[300],
              ),
              Icon(
                Icons.star,
                size: 26,
                color: Colors.amber[300],
              )
            ],
          ),
          verticalSpaceSmall(context),
          verticalSpaceSmall(context),
          CustomButtons.generalButton(
            text: "Submit Feedback",
            context: context,
            textColor: Theme.of(context).primaryColor,
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
