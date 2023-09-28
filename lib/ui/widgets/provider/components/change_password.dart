import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/provider/provider_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/textfields/label_password_field.dart';

import '../../../../app/responsiveness/res.dart';

class ChangePassword extends StatelessWidget {
  final ProviderViewModel viewModel;
  const ChangePassword({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 440.pHeight(context),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 6),
      ),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          SizedBox(
            height: 35.pHeight(context),
          ),
          Text(
            LocaleKeys.changePassword,
            style: CustomThemeData.generateColoredStyle(
                fontSize: 14, context: context),
          ),
          SizedBox(
            height: 20.pHeight(context),
          ),
          const LabelPasswordField(
            label: LocaleKeys.password,
            hintText:
                LocaleKeys.manageAccounts_existingAccountsForm_enterNewPassword,
          ),
          SizedBox(
            height: 12.pHeight(context),
          ),
          const LabelPasswordField(
            label: LocaleKeys
                .providerWidget_providerComponent_changePasswordWidget_confirmPassword,
            hintText:
                LocaleKeys.manageAccounts_existingAccountsForm_reEnterPassword,
          ),
          SizedBox(
            height: 60.pHeight(context),
          ),
          CustomButtons.generalButton(
            context: context,
            onTap: () {
              Navigator.pop(context);
            },
            text: LocaleKeys.confirm,
          )
        ],
      ),
    );
  }
}
