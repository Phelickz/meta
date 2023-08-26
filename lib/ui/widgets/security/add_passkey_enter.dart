import 'package:flutter/material.dart';
import 'package:meta_trader/ui/widgets/textfields/label_password_field.dart';
import 'package:meta_trader/ui/widgets/textfields/label_text_field.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';
import '../../views/security/security_view_model.dart';
import '../buttons/buttons.dart';

class AddPasskeyEnterPage extends StatelessWidget {
  final SecurityViewModel model;
  const AddPasskeyEnterPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceXSmall(context),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter a unique 4-digit passkey",
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2.2),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode
                      ? const Color(0xFFD0D5DD)
                      : const Color(0xFF344054),
                ),
              ),
              Text(
                "Your passkey will be used to authorize your withdrawals. Please you are not advised to share this with anyone.",
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.6),
                  fontWeight: FontWeight.w500,
                  color: isDarkMode
                      ? const Color(0xFF667085)
                      : const Color(0xFF667085),
                ),
              ),
            ],
          ),
          verticalSpaceSmall(context),
          const LabelTextField(
            label: "Passkey",
            hintText: "Enter 4-digits passkey",
          ),
          const LabelPasswordField(
            label: "Password",
            hintText: "Enter Your password",
          ),
          verticalSpaceSmall(context),
          verticalSpaceSmall(context),
          CustomButtons.generalButton(
            text: "Continue",
            context: context,
            onTap: () {
              model.securityPageEnum = SecurityPageEnum.passkeyAddedSuccess;
            },
          )
        ],
      ),
    );
  }
}
