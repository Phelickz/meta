import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/auth/radio_button.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';

import '../../views/auth/auth_view_model.dart';

class ChooseAccount extends StatelessWidget {
  const ChooseAccount({required this.model, super.key});
  final AuthViewModel model;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 5),
      ),
      child: Column(
        children: [
          verticalSpaceSmall(context),
          returnTile(
            LocaleKeys.login_existing_account.tr(),
            LocaleKeys.auth_chooseAccount_offersYouVirtual.tr(),
            AuthPageEnum.login,
            context,
            model.radioItem == LocaleKeys.login.tr(),
            true,
            (value) => model.setRadio = LocaleKeys.login.tr(),
          ),
          verticalSpaceSmall(context),
          returnTile(
            LocaleKeys.auth_chooseAccount_demoAccount.tr(),
            LocaleKeys.auth_chooseAccount_offersYouVirtual.tr(),
            AuthPageEnum.demoAccount,
            context,
            model.radioItem == LocaleKeys.demo.tr(),
            true,
            (value) => model.setRadio = LocaleKeys.demo.tr(),
          ),
          verticalSpaceSmall(context),
          returnTile(
            LocaleKeys.auth_chooseAccount_realAccount.tr(),
            LocaleKeys.auth_chooseAccount_forLiveTrading.tr(),
            AuthPageEnum.realAccount,
            context,
            model.radioItem == LocaleKeys.real.tr(),
            true,
            (value) => model.setRadio = LocaleKeys.real.tr(),
          ),
          const Spacer(),
          CustomButtons.generalButton(
              context: context,
              onTap: () {
                if (model.radioItem == LocaleKeys.login.tr()) {
                  model.setAuthPageEnum = AuthPageEnum.login;
                }

                if (model.radioItem == LocaleKeys.demo.tr()) {
                  model.setAuthPageEnum = AuthPageEnum.demoAccount;
                }

                if (model.radioItem == LocaleKeys.real.tr()) {
                  model.setAuthPageEnum = AuthPageEnum.realAccount;
                }
              },
              text: LocaleKeys.next.tr(),
              color: model.radioItem == null
                  ? (isDarkMode ? const Color(0xff344054) : Colors.black54)
                  : Theme.of(context).primaryColor),
          verticalSpaceMedium(context),
        ],
      ),
    );
  }

  Widget returnTile(
      String title,
      String subtitle,
      AuthPageEnum e,
      BuildContext context,
      bool value,
      bool groupValue,
      void Function(bool) onChanged) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Card(
        elevation: 0,
        color: isDarkMode
            ? Theme.of(context).scaffoldBackgroundColor
            : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
              color: Theme.of(context).secondaryHeaderColor, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 15,
          ),
          child: ListTile(
            title: Text(
              title,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 2),
                fontWeight: FontWeight.bold,
                color: (e == AuthPageEnum.login
                    ? Theme.of(context).primaryColor
                    : e == AuthPageEnum.demoAccount
                        ? Colors.green
                        : Colors.red),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Text(
                subtitle,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.4),
                  fontWeight: FontWeight.normal,
                  color: isDarkMode ? Colors.white54 : Colors.black54,
                ),
              ),
            ),
            trailing: Transform.scale(
              scale: 2.0,
              child: CustomRadioWidget(
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
