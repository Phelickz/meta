import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';

import '../../../../generated/locale_keys.g.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        height: 170.pHeight(context),
        width: 300.pWidth(context),
        padding: EdgeInsets.symmetric(
            vertical: 24.pHeight(context), horizontal: 12.pWidth(context)),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              LocaleKeys.logOut,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            SizedBox(height: 12.pHeight(context)),
            Text(
              LocaleKeys.helpAndSupport_components_logoutDialog_wantToLogout,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 24.pWidth(context)),
            Row(
              children: [
                CustomButtons.clearButton(
                    context: context,
                    width: 154.pWidth(context),
                    onTap: () {},
                    text: LocaleKeys.logOut,
                    textColor: Colors.red,
                    color: Colors.red),
                CustomButtons.clearButton(
                    context: context, onTap: () {}, text: "Cancel")
              ],
            )
          ],
        ),
      ),
    );
  }
}
