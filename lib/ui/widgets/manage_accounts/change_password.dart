import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/ui/views/manage_accounts/manage_accounts_view_model.dart';
import 'package:meta_trader/ui/widgets/appbar.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';
import '../../views/security/security_view_model.dart';
import '../buttons/buttons.dart';
import '../textfields/label_password_field.dart';

@RoutePage()
class ManageAccountPasswordPage extends StatelessWidget {
  final ManageAccountViewModel model;
  const ManageAccountPasswordPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
      isBusy: model.isBusy,
      appBar: globalAppBar(context, 'Change Password', '', () {
        Navigator.pop(context);
      }, []),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceXSmall(context),
            Row(
              children: [
                SizedBox(
                  height: McGyver.rsDoubleH(context, 7),
                  width: McGyver.rsDoubleH(context, 7),
                  child: Image.asset("assets/images/fx_pro.png"),
                ),
                horizontalSpaceXSmall(context),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "FXPro",
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.7),
                        fontWeight: FontWeight.bold,
                        color: isDarkMode
                            ? const Color(0xFFD0D5DD)
                            : const Color(0xFF667085),
                      ),
                    ),
                    Text(
                      "ForexPro",
                      style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 1.4),
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ],
            ),
            verticalSpaceSmall(context),
            verticalSpaceXSmall(context),
            const LabelPasswordField(
              label: "Current Password",
              hintText: "Enter current password",
            ),
            const LabelPasswordField(
              label: "New Password",
              hintText: "Enter new password",
            ),
            const LabelPasswordField(
              label: "Re-enter Password",
              hintText: "Re-enter new password",
            ),
            Row(
              children: [
                Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor:
                        isDarkMode ? Colors.white70 : const Color(0xff98A2B3),
                  ),
                  child: Checkbox(
                    value: false,
                    visualDensity: VisualDensity.compact,
                    onChanged: (val) {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    side: BorderSide(
                      color: isDarkMode
                          ? const Color(0xFFD0D5DD)
                          : const Color(0xff98A2B3),
                    ),
                    checkColor:
                        isDarkMode ? Colors.white70 : const Color(0xff98A2B3),
                    activeColor: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  width: McGyver.rsDoubleW(context, 1),
                ),
                Expanded(
                  child: Text(
                    "Save Password",
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.7),
                      fontWeight: FontWeight.normal,
                      color: isDarkMode
                          ? const Color(0xFFD0D5DD)
                          : const Color(0xFF667085),
                    ),
                  ),
                )
              ],
            ),
            verticalSpaceMedium(context),
            verticalSpaceSmall(context),
            CustomButtons.generalButton(
              text: "Save Changes",
              context: context,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              width: McGyver.rsDoubleW(context, 1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Forgot password?",
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.6),
                    fontWeight: FontWeight.w500,
                    color: isDarkMode
                        ? const Color(0xFFD0D5DD)
                        : const Color(0xFF667085),
                  ),
                ),
                CustomButtons.generalTextButton(
                  width: McGyver.rsDoubleW(context, 27),
                  text: "Contact Broker",
                  padding: McGyver.rsDoubleH(context, 0.1),
                  context: context,
                  textColor: isDarkMode
                      ? const Color(0xFF42B0F8)
                      : const Color(0xFF20A0F3),
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
