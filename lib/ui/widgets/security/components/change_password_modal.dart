import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/responsiveness/size.dart';
import '../../../../app/utils/theme.dart';
import '../../../views/security/security_view_model.dart';
import '../../buttons/buttons.dart';

class ChangePasswordModal extends StatelessWidget {
  final SecurityViewModel vm;
  const ChangePasswordModal({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      height: McGyver.rsDoubleH(context, 50),
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 6),
        vertical: McGyver.rsDoubleH(context, 4),
      ),
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
                child:
                    SvgPicture.asset("assets/images/password_check_big.svg")),
          ),
          verticalSpaceSmall(context),
          Text(
            "Change Password",
            textAlign: TextAlign.center,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 2.8),
              fontWeight: FontWeight.bold,
              color: isDarkMode
                  ? const Color(0xFFD0D5DD)
                  : const Color(0xFF475467),
            ),
          ),
          verticalSpaceXSmall(context),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: McGyver.rsDoubleW(context, 10),
            ),
            child: Text(
              "In order to protect your account, withdrawals will be disabled for 24 hours after you change your password",
              textAlign: TextAlign.center,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.6),
                fontWeight: FontWeight.w500,
                color: isDarkMode
                    ? const Color(0xFFD0D5DD)
                    : const Color(0xFF667085),
              ),
            ),
          ),
          verticalSpaceMedium(context),
          CustomButtons.generalButton(
            text: "Continue",
            context: context,
            onTap: () {
              Navigator.pop(context);
              vm.securityPageEnum = SecurityPageEnum.password;
            },
          )
        ],
      ),
    );
  }
}
