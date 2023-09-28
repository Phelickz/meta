import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/responsiveness/size.dart';
import '../../../../app/utils/theme.dart';
import '../../../../generated/locale_keys.g.dart';
import 'delete_popup.dart';

class PasskeyTile extends StatelessWidget {
  const PasskeyTile({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.only(
        bottom: McGyver.rsDoubleH(context, 1.2),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icons/security_user.svg",
            height: McGyver.rsDoubleW(context, 6),
            width: McGyver.rsDoubleW(context, 6),
            colorFilter: ColorFilter.mode(
              isDarkMode ? const Color(0xff98A2B3) : const Color(0xFF667085),
              BlendMode.srcIn,
            ),
          ),
          horizontalSpaceSmall(context),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.passkey,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 2.1),
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? const Color(0xFFD0D5DD)
                        : const Color(0xFF667085),
                  ),
                ),
                SizedBox(
                  height: McGyver.rsDoubleH(context, 0.3),
                ),
                Text(
                  LocaleKeys
                      .securityWidget_securityComponents_passkeyTile_added12,
                  textAlign: TextAlign.left,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.4),
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF98A2B3),
                  ),
                ),
                Text(
                  LocaleKeys
                      .securityWidget_securityComponents_passkeyTile_lastUsed,
                  textAlign: TextAlign.left,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.4),
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF98A2B3),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              SvgPicture.asset(
                height: McGyver.rsDoubleH(context, 2.6),
                width: McGyver.rsDoubleH(context, 2.6),
                'assets/images/edit.svg',
                colorFilter: ColorFilter.mode(
                  isDarkMode
                      ? const Color(0xff98A2B3)
                      : const Color(0xFF667085),
                  BlendMode.srcIn,
                ),
              ),
              horizontalSpaceXSmall(context),
              InkWell(
                onTap: () {
                  showDeletePasskeyPopup(context);
                },
                child: SvgPicture.asset(
                  height: McGyver.rsDoubleH(context, 2.6),
                  width: McGyver.rsDoubleH(context, 2.6),
                  'assets/images/trash.svg',
                  colorFilter: ColorFilter.mode(
                    isDarkMode
                        ? const Color(0xff98A2B3)
                        : const Color(0xFF667085),
                    BlendMode.srcIn,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void showDeletePasskeyPopup(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor:
            isDarkMode ? const Color(0xFF0C2031) : const Color(0xFFFAFDFF),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(
            McGyver.rsDoubleH(context, 2),
          ),
        )),
        alignment: Alignment.center,
        insetPadding: const EdgeInsets.all(10),
        child: DeletePopup(
          title: LocaleKeys.passKeys,
          onDelete: () {},
        ),
      ),
    );
  }
}
