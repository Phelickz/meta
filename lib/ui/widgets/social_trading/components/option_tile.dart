import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';

class OptionTile extends StatelessWidget {
  final String assetName;
  final String label;
  final void Function()? onTap;

  const OptionTile({
    super.key,
    required this.label,
    required this.assetName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: McGyver.rsDoubleH(context, 1.2),
        horizontal: McGyver.rsDoubleW(context, 6),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            SizedBox(
              width: McGyver.rsDoubleW(context, 6.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(assetName,
                      height: McGyver.rsDoubleW(context, 5.5),
                      width: McGyver.rsDoubleW(context, 5.5),
                      colorFilter: ColorFilter.mode(
                        isDarkMode
                            ? const Color(0xff98A2B3)
                            : const Color(0xFF667085),
                        BlendMode.srcIn,
                      )),
                ],
              ),
            ),
            horizontalSpaceXSmall(context),
            Expanded(
              child: Text(
                label,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2.1),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode
                      ? const Color(0xFFD0D5DD)
                      : const Color(0xFF667085),
                ),
              ),
            ),
            if (onTap != null)
              SizedBox(
                height: McGyver.rsDoubleW(context, 5),
                width: McGyver.rsDoubleW(context, 5),
                child: SvgPicture.asset(
                  "assets/images/arrow_right.svg",
                  colorFilter: ColorFilter.mode(
                    isDarkMode
                        ? const Color(0xff98A2B3)
                        : const Color(0xFF667085),
                    BlendMode.srcIn,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
