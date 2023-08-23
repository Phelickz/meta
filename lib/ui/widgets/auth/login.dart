import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/ui/views/auth/auth_view_model.dart';
import 'package:meta_trader/ui/views/verification/verification_view.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/textfields/textfield.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/utils/theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({required this.model, super.key});
  final AuthViewModel model;

  @override
  Widget build(BuildContext context) {
    // getThemeManager(context).setThemeMode(ThemeMode.light);
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 6),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceSmall(context),
            loginListTile(context, 'Deriv Limited', 'Deriv', isDarkMode),
            verticalSpaceSmall(context),
            Text(
              'Login ID',
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.8),
                color: isDarkMode ? Colors.white70 : const Color(0xff667085),
              ),
            ),
            verticalSpaceXSmall(context),
            const CustomTextFields(
              hintText: 'Enter your login ID',
            ),
            verticalSpaceSmall(context),
            Text(
              'Password',
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.8),
                color: isDarkMode ? Colors.white70 : const Color(0xff667085),
              ),
            ),
            verticalSpaceXSmall(context),
            const CustomTextFields(
              hintText: 'Password',
              password: true,
            ),
            verticalSpaceSmall(context),
            Text(
              'Server',
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.8),
                color: isDarkMode ? Colors.white70 : const Color(0xff667085),
              ),
            ),
            verticalSpaceXSmall(context),
            CustomTextFields(
              hintText: 'DCFXPrime-Real',
              password: false,
              suffixIcon: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
            verticalSpaceSmall(context),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (val) {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  activeColor: Theme.of(context).primaryColor,
                ),
                // SizedBox(width: 1),
                Text(
                  "Save Password",
                  style: CustomThemeData.generateStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color:
                        isDarkMode ? Colors.white54 : const Color(0xff98A2B3),
                  ),
                )
              ],
            ),
            verticalSpaceSmall(context),
            CustomButtons.generalButton(
              context: context,
              onTap: () {
                model.push(const VerificationView());
              },
              text: 'Sign in',
            ),
            verticalSpaceXSmall(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Forgot password ?',
                  style: CustomThemeData.generateStyle(
                    fontSize: 13,
                    color: isDarkMode ? Colors.white : const Color(0xff667085),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).primaryColor),
                  onPressed: () {},
                  child: Text(
                    "Contact Broker",
                    style: CustomThemeData.generateStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget loginListTile(
      BuildContext context, String title, String subtitle, bool isDarkMode) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () {},
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/images/logo.png'),
          ),
          border: Border.all(
            color: Theme.of(context).secondaryHeaderColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      title: Text(
        title,
        style: CustomThemeData.generateStyle(
          fontSize: McGyver.textSize(context, 1.8),
          fontWeight: FontWeight.w700,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: CustomThemeData.generateStyle(
          fontSize: McGyver.textSize(context, 1.3),
          fontWeight: FontWeight.normal,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
