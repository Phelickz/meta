import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';

class TraadingSignalTile extends StatelessWidget {
  final Widget leadingIcon;
  final Color leadingBgColor;
  const TraadingSignalTile(
      {super.key, required this.leadingIcon, required this.leadingBgColor});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      margin: EdgeInsets.only(
        bottom: McGyver.rsDoubleH(context, 0.7),
        top: McGyver.rsDoubleH(context, 0.7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: leadingBgColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: leadingIcon,
              ),
              horizontalSpaceXSmall(context),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Intraday: under pressure",
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 1.8),
                          color: isDarkMode
                              ? const Color(0xFFD0D5DD)
                              : const Color(0xFF667085),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "6:00 PM",
                textAlign: TextAlign.right,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.6),
                  color: const Color(0xFF98A2B3),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          verticalSpaceXXSmall(context),
          Text(
            "Miami Crypto Aspirations\nBoosted by Borderless Capital’s \$25 Milion Fund",
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.6),
              color: isDarkMode
                  ? const Color(0xFFD0D5DD)
                  : const Color(0xFF98A2B3),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
