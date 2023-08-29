import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/responsiveness/size.dart';
import '../../../../app/utils/theme.dart';
import '../../../views/security/security_view_model.dart';
import '../../buttons/buttons.dart';

class EmptyPasskey extends StatelessWidget {
  final SecurityViewModel model;
  const EmptyPasskey({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      children: [
        verticalSpaceLarge(context),
        Container(
          height: McGyver.rsDoubleH(context, 10),
          width: McGyver.rsDoubleH(context, 10),
          padding: EdgeInsets.all(
            McGyver.rsDoubleH(context, 1.5),
          ),
          decoration: BoxDecoration(
              color: isDarkMode
                  ? const Color(0xFF052844)
                  : const Color(0xFFD3ECFD),
              borderRadius: BorderRadius.circular(
                McGyver.rsDoubleH(context, 2),
              )),
          child: SizedBox(
            height: McGyver.rsDoubleH(context, 8),
            width: McGyver.rsDoubleH(context, 8),
            child: SvgPicture.asset(
              "assets/images/shield_security_empty.svg",
            ),
          ),
        ),
        verticalSpaceSmall(context),
        Text(
          " Passkeys added Yet",
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.8),
            fontWeight: FontWeight.bold,
            color:
                isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFF98A2B3),
          ),
        ),
        SizedBox(
          height: McGyver.rsDoubleH(context, 48),
        ),
        CustomButtons.generalButton(
          context: context,
          onTap: () {
            model.securityPageEnum = SecurityPageEnum.addPasskey;
          },
          text: 'Add A Passkey',
        ),
      ],
    );
  }
}
