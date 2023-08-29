import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/ui/views/security/security_view_model.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/responsiveness/size.dart';
import '../../../../app/utils/theme.dart';

enum SecurityOptionStatus { confirmed, unconfirmed }

class SecurityOptionTile extends StatelessWidget {
  final bool hasStatus;
  final bool hasLeadingIcon;
  final String? assetName;
  final String label;
  final SecurityViewModel vm;
  final SecurityOptionStatus? status;
  final bool hasRedLabel;
  final Function()? onTap;

  const SecurityOptionTile({
    super.key,
    required this.vm,
    required this.label,
    this.onTap,
    this.assetName,
    this.hasStatus = false,
    this.status,
    this.hasLeadingIcon = false,
    this.hasRedLabel = false,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: McGyver.rsDoubleH(context, 1.2),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            if (hasLeadingIcon)
              SizedBox(
                width: McGyver.rsDoubleW(context, 6.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(assetName ?? "",
                        height: McGyver.rsDoubleW(context, 6),
                        width: McGyver.rsDoubleW(context, 6),
                        colorFilter: ColorFilter.mode(
                          isDarkMode
                              ? const Color(0xff98A2B3)
                              : const Color(0xFF667085),
                          BlendMode.srcIn,
                        )),
                  ],
                ),
              ),
            if (hasLeadingIcon) horizontalSpaceSmall(context),
            Expanded(
              child: !hasRedLabel
                  ? Text(
                      label,
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 2.1),
                        fontWeight: FontWeight.bold,
                        color: isDarkMode
                            ? const Color(0xFFD0D5DD)
                            : const Color(0xFF667085),
                      ),
                    )
                  : Text(
                      label,
                      style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 2.1),
                          fontWeight: FontWeight.bold,
                          color: const Color(0xffF97066)),
                    ),
            ),
            if (hasStatus)
              status == SecurityOptionStatus.confirmed
                  ? SizedBox(
                      height: McGyver.rsDoubleW(context, 6),
                      width: McGyver.rsDoubleW(context, 6),
                      child: SvgPicture.asset(
                        "assets/images/tick_circle.svg",
                      ),
                    )
                  : SizedBox(
                      height: McGyver.rsDoubleW(context, 6),
                      width: McGyver.rsDoubleW(context, 6),
                      child: SvgPicture.asset(
                        "assets/images/info_circle.svg",
                      ),
                    ),
            horizontalSpaceXXSmall(context),
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
