import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/ui/views/auth/auth_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/textfields/textfield.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/utils/theme.dart';

class RealPage extends StatelessWidget {
  const RealPage({required this.model, super.key});
  final AuthViewModel model;

  @override
  Widget build(BuildContext context) {
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
              'Enter Personal Information',
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.6),
                color: Theme.of(context).primaryColor,
              ),
            ),
            verticalSpaceSmall(context),
            Text(
              'First Name',
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.8),
                color: isDarkMode ? Colors.white : const Color(0xff667085),
              ),
            ),
            verticalSpaceXSmall(context),
            const CustomTextFields(
              hintText: 'Enter your first name',
            ),
            verticalSpaceSmall(context),
            Text(
              'Last Name',
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.8),
                color: isDarkMode ? Colors.white : const Color(0xff667085),
              ),
            ),
            verticalSpaceXSmall(context),
            const CustomTextFields(
              hintText: 'Enter your last name',
            ),
            verticalSpaceSmall(context),
            Text(
              'Email Address',
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.8),
                color: isDarkMode ? Colors.white : const Color(0xff667085),
              ),
            ),
            verticalSpaceXSmall(context),
            const CustomTextFields(
              hintText: 'Enter your email address',
            ),
            verticalSpaceSmall(context),
            Text(
              'Phone Number',
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.8),
                color: isDarkMode ? Colors.white : const Color(0xff667085),
              ),
            ),
            verticalSpaceXSmall(context),
            const CustomTextFields(
              hintText: '+1234567890',
            ),
            verticalSpaceSmall(context),
            Text(
              'Language',
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.8),
                color: isDarkMode ? Colors.white : const Color(0xff667085),
              ),
            ),
            verticalSpaceXSmall(context),
            CustomTextFields(
              hintText: 'Select language',
              password: false,
              suffixIcon: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
            verticalSpaceSmall(context),
            verticalSpaceSmall(context),
            Text(
              'Enter Account Information',
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.6),
                color: Theme.of(context).primaryColor,
              ),
            ),
            verticalSpaceSmall(context),
            Text(
              'Country',
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.8),
                color: isDarkMode ? Colors.white : const Color(0xff667085),
              ),
            ),
            verticalSpaceXSmall(context),
            CustomTextFields(
              hintText: 'Nigeria',
              password: false,
              suffixIcon: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
            verticalSpaceSmall(context),
            Text(
              'Use Hedge',
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.8),
                color: isDarkMode ? Colors.white : const Color(0xff667085),
              ),
            ),
            verticalSpaceXSmall(context),
            CustomTextFields(
              hintText: 'Preliminary Account',
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
                Expanded(
                  child: Text(
                    "I agree with the terms and conditions for opening an account and the data protection policy.",
                    style: CustomThemeData.generateStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color:
                          isDarkMode ? Colors.white : const Color(0xff98A2B3),
                    ),
                  ),
                )
              ],
            ),
            verticalSpaceSmall(context),
            CustomButtons.generalButton(
              context: context,
              onTap: () {
                model.setAuthPageEnum = AuthPageEnum.created;
              },
              text: 'Next',
            ),
            verticalSpaceMedium(context),
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
