import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';

import '../../views/auth/auth_view_model.dart';

class CreatedPage extends StatelessWidget {
  const CreatedPage({required this.model, super.key});
  final AuthViewModel model;

  @override
  Widget build(BuildContext context) {
    // getThemeManager(context).setThemeMode(ThemeMode.dark);
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 5),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceSmall(context),
            loginListTile(context, 'Deriv Limited', 'Deriv', isDarkMode),
            verticalSpaceSmall(context),
            verticalSpaceXSmall(context),
            Container(
              decoration: BoxDecoration(
                color: isDarkMode
                    ? const Color(0xff073961)
                    : const Color(0xff1570EF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle_outline_outlined,
                      color: Colors.white70,
                    ),
                    horizontalSpaceSmall(context),
                    Expanded(
                      child: Text(
                        // TODO: localization used a namedArgs named model
                        'Your ${model.createdAccountPageEnum == CreatedAccountPageEnum.demo ? "demo" : "real"} account has been created successfully',
                        style: CustomThemeData.generateStyle(
                            fontSize: 14, color: Colors.white70),
                      ),
                    )
                  ],
                ),
              ),
            ),
            verticalSpaceSmall(context),
            verticalSpaceSmall(context),
            Text(
              LocaleKeys.auth_created_accountInformation,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.6),
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ).tr(),
            verticalSpaceSmall(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.auth_created_FullName,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    color: isDarkMode ? Colors.white60 : Colors.black,
                  ),
                ).tr(),
                Text(
                  'Henry Richard',
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    color: isDarkMode ? Colors.white : Colors.black54,
                  ),
                ),
              ],
            ),
            verticalSpaceSmall(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.auth_created_accountType,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    color: isDarkMode ? Colors.white60 : Colors.black,
                  ),
                ).tr(),
                Text(
                  LocaleKeys.auth_created_forexHedge,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    color: isDarkMode ? Colors.white : Colors.black54,
                  ),
                ).tr(),
              ],
            ),
            verticalSpaceSmall(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.deposit,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    color: isDarkMode ? Colors.white60 : Colors.black,
                  ),
                ).tr(),
                Text(
                  '10000',
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    color: isDarkMode ? Colors.white : Colors.black54,
                  ),
                ),
              ],
            ),
            verticalSpaceSmall(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.loginID.tr(),
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    color: isDarkMode ? Colors.white60 : Colors.black,
                  ),
                ),
                Text(
                  '234343029',
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    color: isDarkMode ? Colors.white : Colors.black54,
                  ),
                ),
              ],
            ),
            verticalSpaceSmall(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.password,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    color: isDarkMode ? Colors.white60 : Colors.black,
                  ),
                ).tr(),
                Text(
                  'sadJAsda',
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    color: isDarkMode ? Colors.white : Colors.black54,
                  ),
                ),
              ],
            ),
            verticalSpaceSmall(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.investor,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    color: isDarkMode ? Colors.white60 : Colors.black,
                  ),
                ).tr(),
                Text(
                  'Donald',
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    color: isDarkMode ? Colors.white : Colors.black54,
                  ),
                ),
              ],
            ),
            verticalSpaceSmall(context),
            verticalSpaceMedium(context),
            CustomButtons.generalButton(
                context: context,
                onTap: () {
                  model.setAuthPageEnum = AuthPageEnum.login;
                },
                text: LocaleKeys.done.tr(),
                color: model.radioItem == null
                    ? Colors.black54
                    : Theme.of(context).primaryColor),
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
      onTap: () {
        model.setSelectedBrokerName = title;
        model.setAuthPageEnum = AuthPageEnum.chooseAccount;
      },
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
          color: isDarkMode ? Colors.white : const Color(0xff667085),
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
