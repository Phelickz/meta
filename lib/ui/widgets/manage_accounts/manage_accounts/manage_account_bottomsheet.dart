import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/locator/locator.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/app/services/router_service.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/manage_accounts/manage_accounts_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';

import '../../../../generated/locale_keys.g.dart';

class ManageAccountBottomSheet1 extends StatelessWidget {
  final String accountDetail;
  final ManageAccountViewModel model;
  const ManageAccountBottomSheet1(
      {super.key, required this.accountDetail, required this.model});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      height: 283.pHeight(context),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          color: Theme.of(context).scaffoldBackgroundColor),
      padding: EdgeInsets.symmetric(
          horizontal: 24.pWidth(context), vertical: 22.pHeight(context)),
      child: Column(
        children: [
          Text(
            accountDetail,
            style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.3),
                color: isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 30.pHeight(context),
          ),
          GestureDetector(
            onTap: () {
              final router = locator<RouterService>();
              router.router.push(ManageAccountPasswordPage(model: model));
            },
            child: Text(
              LocaleKeys.changePassword,
              style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2),
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w600),
            ).tr(),
          ),
          SizedBox(
            height: 16.pHeight(context),
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const DeleteAccountDialog();
                  });
            },
            child: Text(
              LocaleKeys.deleteAccount,
              style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2),
                  color: Colors.red,
                  fontWeight: FontWeight.w600),
            ).tr(),
          ),
          SizedBox(
            height: 16.pHeight(context),
          ),
          CustomButtons.generalButton(
            context: context,
            onTap: () {
              Navigator.pop(context);
            },
            text: LocaleKeys.cancel.tr(),
            textSize: 2,
          )
        ],
      ),
    );
  }
}

class ManageAccountBottomSheet2 extends StatelessWidget {
  final String accountDetail;
  final ManageAccountViewModel model;
  const ManageAccountBottomSheet2(
      {super.key, required this.accountDetail, required this.model});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      height: 300.pHeight(context),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: 24.pWidth(context), vertical: 22.pHeight(context)),
      child: Column(
        children: [
          Text(
            accountDetail,
            style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.3),
                color: isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 30.pHeight(context),
          ),
          GestureDetector(
            onTap: () {
              final router = locator<RouterService>();
              router.router.push(ManageAccountLoginPage(model: model));
            },
            child: Text(
              LocaleKeys.login,
              style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2),
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w600),
            ).tr(),
          ),
          SizedBox(
            height: 12.pHeight(context),
          ),
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const DetailDialog();
                  });
            },
            child: Text(
              LocaleKeys.properties,
              style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2),
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w600),
            ).tr(),
          ),
          SizedBox(
            height: 12.pHeight(context),
          ),
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const DeleteAccountDialog();
                  });
            },
            child: Text(
              LocaleKeys.deleteAccount,
              style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2),
                  color: Colors.red,
                  fontWeight: FontWeight.w600),
            ).tr(),
          ),
          SizedBox(
            height: 20.pHeight(context),
          ),
          CustomButtons.generalButton(
              context: context,
              onTap: () {
                Navigator.pop(context);
              },
              text: LocaleKeys.cancel.tr(),
              textSize: 2)
        ],
      ),
    );
  }
}

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        height: 180.pHeight(context),
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
              LocaleKeys.deleteAccount,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(fontSize: 18),
            ).tr(),
            SizedBox(height: 12.pHeight(context)),
            Text(
              LocaleKeys
                  .manageAccounts_manageAccountsWidget_manageAccountBottomSheet_doYouReallyWant,
              style: Theme.of(context).textTheme.labelMedium,
            ).tr(),
            SizedBox(height: 24.pWidth(context)),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 48.pHeight(context),
                    width: 154.pWidth(context),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.red)),
                    child: Center(
                      child: Text(
                        LocaleKeys.delete,
                        style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 2),
                            color: Colors.red,
                            fontWeight: FontWeight.w500),
                      ).tr(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.pWidth(context),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    LocaleKeys.cancel,
                    style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 2),
                        color: isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500),
                  ).tr(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DetailDialog extends StatelessWidget {
  const DetailDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        height: 227.pHeight(context),
        width: 360.pWidth(context),
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
              LocaleKeys.properties,
              style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.5),
                  color: isDarkMode ? Colors.white : const Color(0xFF98A2B3),
                  fontWeight: FontWeight.w500),
            ).tr(),
            SizedBox(height: 12.pHeight(context)),
            Text(
              LocaleKeys
                  .manageAccounts_manageAccountsWidget_manageAccountBottomSheet_figure,
              style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.5),
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500),
            ).tr(),
            Text(
              'FXPro limited ',
              style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.5),
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              LocaleKeys
                  .manageAccounts_manageAccountsWidget_manageAccountBottomSheet_twelveUsd,
              style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.5),
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500),
            ).tr(),
            Text(
              LocaleKeys
                  .manageAccounts_manageAccountsWidget_manageAccountBottomSheet_demo_account,
              style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.5),
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500),
            ).tr(),
            SizedBox(height: 23.pHeight(context)),
            CustomButtons.clearButton(
                context: context,
                onTap: () {
                  Navigator.pop(context);
                },
                text: LocaleKeys.ok.tr(),
                textSize: 2)
          ],
        ),
      ),
    );
  }
}
