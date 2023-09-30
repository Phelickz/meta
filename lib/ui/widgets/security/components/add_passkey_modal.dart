import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import '../../../../app/responsiveness/res.dart';
import '../../../../app/responsiveness/size.dart';
import '../../../../app/utils/theme.dart';
import '../../../views/security/security_view_model.dart';
import '../../buttons/buttons.dart';

class AddPasskeyModal extends StatelessWidget {
  final SecurityViewModel vm;
  const AddPasskeyModal({
    super.key,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      height: McGyver.rsDoubleH(context, 73),
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleH(context, 2),
        vertical: McGyver.rsDoubleH(context, 4),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: McGyver.rsDoubleH(context, 14),
              width: McGyver.rsDoubleH(context, 14),
              padding: EdgeInsets.all(
                McGyver.rsDoubleH(context, 2),
              ),
              decoration: BoxDecoration(
                  color: isDarkMode
                      ? const Color(0xFF052844)
                      : const Color(0xFFD3ECFD),
                  borderRadius: BorderRadius.circular(
                    McGyver.rsDoubleH(context, 3),
                  )),
              child: SizedBox(
                  height: McGyver.rsDoubleH(context, 9.5),
                  width: McGyver.rsDoubleH(context, 9.5),
                  child: SvgPicture.asset("assets/images/shield_tick.svg")),
            ),
            verticalSpaceSmall(context),
            Text(
              LocaleKeys.addAPasskey,
              textAlign: TextAlign.center,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 2.8),
                fontWeight: FontWeight.bold,
                color: isDarkMode
                    ? const Color(0xFFD0D5DD)
                    : const Color(0xFF475467),
              ),
            ).tr(),
            verticalSpaceSmall(context),
            verticalSpaceSmall(context),
            _addPasskeyModalTile(
              context: context,
              isDarkMode: isDarkMode,
              assetName: "assets/images/security_safe.svg",
              title: LocaleKeys
                  .securityWidget_securityComponents_addPassKeyModel_noNeedToRemember
                  .tr(),
              subtitle: LocaleKeys
                  .securityWidget_securityComponents_addPassKeyModel_withPasskey
                  .tr(),
            ),
            _addPasskeyModalTile(
              context: context,
              isDarkMode: isDarkMode,
              assetName: "assets/images/devices.svg",
              title: LocaleKeys
                  .securityWidget_securityComponents_addPassKeyModel_worksOnAll
                  .tr(),
              subtitle: LocaleKeys
                  .securityWidget_securityComponents_addPassKeyModel_passkeysWill
                  .tr(),
            ),
            _addPasskeyModalTile(
              context: context,
              isDarkMode: isDarkMode,
              assetName: "assets/images/safe_home.svg",
              title: LocaleKeys
                  .securityWidget_securityComponents_addPassKeyModel_keepYourAccountSafe
                  .tr(),
              subtitle: LocaleKeys
                  .securityWidget_securityComponents_addPassKeyModel_passkeysOffer
                  .tr(),
            ),
            verticalSpaceSmall(context),
            verticalSpaceSmall(context),
            CustomButtons.generalButton(
              text: LocaleKeys.continueWord.tr(),
              context: context,
              onTap: () {
                Navigator.pop(context);
                vm.securityPageEnum = SecurityPageEnum.addPasskey;
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _addPasskeyModalTile({
    required BuildContext context,
    required bool isDarkMode,
    required String assetName,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: EdgeInsets.only(
        bottom: McGyver.rsDoubleH(context, 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: McGyver.rsDoubleW(context, 10),
            width: McGyver.rsDoubleW(context, 10),
            padding: EdgeInsets.all(
              McGyver.rsDoubleW(context, 1.9),
            ),
            decoration: BoxDecoration(
              color: isDarkMode
                  ? const Color(0xFF052844)
                  : const Color(0xFFD3ECFD),
              borderRadius: BorderRadius.circular(
                McGyver.rsDoubleW(context, 5),
              ),
            ),
            child: SvgPicture.asset(
              assetName,
              colorFilter: ColorFilter.mode(
                isDarkMode ? const Color(0xff94D1F9) : const Color(0xFF20A0F3),
                BlendMode.srcIn,
              ),
            ),
          ),
          horizontalSpaceSmall(context),
          SizedBox(
            width: McGyver.rsDoubleW(context, 75),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
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
                  subtitle,
                  textAlign: TextAlign.left,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.4),
                    fontWeight: FontWeight.w500,
                    color: isDarkMode
                        ? const Color(0xFFD0D5DD)
                        : const Color(0xFF667085),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
