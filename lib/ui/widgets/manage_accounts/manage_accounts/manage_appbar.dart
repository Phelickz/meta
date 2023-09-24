// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/manage_accounts/manage_accounts_view_model.dart';
import 'package:meta_trader/ui/widgets/manage_accounts/manage_accounts/broker_logo.dart';
import 'package:meta_trader/ui/widgets/manage_accounts/manage_accounts/manage_account_bottomsheet.dart';
import 'package:meta_trader/ui/widgets/manage_accounts/manage_accounts/status_tag.dart';
import 'package:meta_trader/ui/widgets/manage_accounts/manage_accounts/type_tag.dart';
import 'package:meta_trader/ui/widgets/textfields/textfield.dart';

import '../../../../generated/locale_keys.g.dart';

AppBar maanageAccountAppBar(
    BuildContext context, ManageAccountViewModel model) {
  var isDarkMode = CustomThemeData.isDarkMode(context);
  return AppBar(
    elevation: 0,
    backgroundColor: isDarkMode
        ? ColorManager.darkHeaderColor
        : ColorManager.lightHeaderColor,
    automaticallyImplyLeading: false,
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
          color: isDarkMode ? Colors.white : Colors.white,
        )),
    centerTitle: false,
    title: Text(
      LocaleKeys.manageAccount,
      style: CustomThemeData.generateStyle(
          fontSize: McGyver.textSize(context, 2),
          color: isDarkMode ? Colors.white : Colors.white,
          fontWeight: FontWeight.bold),
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(right: 24.pWidth(context)),
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                builder: (context) {
                  return const ManageAccountBottomSheet2(
                    accountDetail: "44291097-Deriv-Real",
                  );
                });
          },
          child: SvgPicture.asset(
            AssetManager.add,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 24.pWidth(context)),
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                builder: (context) {
                  return const ManageAccountBottomSheet1(
                    accountDetail: "44291097-Deriv-Real",
                  );
                });
          },
          child: SvgPicture.asset(
            AssetManager.filter,
            color: isDarkMode ? Colors.white : Colors.white,
          ),
        ),
      ),
    ],
  );
}

class ManageAppbarExtension extends StatelessWidget {
  const ManageAppbarExtension({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      height: 150.pHeight(context),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: 24.pWidth(context), vertical: 24.pHeight(context)),
      decoration: BoxDecoration(
        color: isDarkMode
            ? ColorManager.darkHeaderColor
            : ColorManager.lightHeaderColor,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.balance,
                style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.2),
                    color: isDarkMode ? Colors.white : Colors.white,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 8.pHeight(context),
              ),
              Text(
                "509 082.18",
                style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 2.2),
                    color: isDarkMode ? Colors.white : Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8.pHeight(context),
              ),
              Text(
                "susan***@gmail.com",
                style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.2),
                    color: isDarkMode ? Colors.white : Colors.white,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 4.pHeight(context),
              ),
              const StatusTag(status: LocaleKeys.active, color: Colors.green),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BorkerLogo(brokerLogoPath: AssetManager.brokerLogo),
              SizedBox(
                height: 8.pHeight(context),
              ),
              const TypeTag(tag: LocaleKeys.real),
              SizedBox(
                height: 8.pHeight(context),
              ),
              Text(
                "46291097- Deriv-Real",
                style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1),
                    color: isDarkMode ? Colors.white : Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 2.pHeight(context),
              ),
              Text(
                LocaleKeys
                    .manageAccounts_manageAccountsWidget_manageAccountAppBar_accessPointHedge,
                style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1),
                    color: isDarkMode ? Colors.white : Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ],
          )
        ],
      ),
    );
  }
}

AppBar existingAccountAppbar(
    BuildContext context, String title, String subtitle) {
  var isDarkMode = CustomThemeData.isDarkMode(context);
  return AppBar(
    elevation: 0,
    backgroundColor: isDarkMode
        ? ColorManager.darkHeaderColor
        : Theme.of(context).scaffoldBackgroundColor,
    automaticallyImplyLeading: false,
    leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
          color: isDarkMode ? Colors.white : Colors.black,
        )),
    centerTitle: false,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 2.2),
              color: isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 4.pHeight(context),
        ),
        Text(
          subtitle,
          style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.4),
              color: isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.w400),
        ),
      ],
    ),
  );
}

class ExistingAppBarExtension extends StatelessWidget {
  const ExistingAppBarExtension({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      children: [
        SizedBox(
          height: 12.pHeight(context),
        ),
        Container(
          height: 68.pHeight(context),
          width: double.infinity,
          color: isDarkMode
              ? ColorManager.darkHeaderColor
              : Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.pWidth(context)),
                  child: CustomTextFields(
                    suffixIconConstraints:
                        const BoxConstraints(maxWidth: 34, maxHeight: 34),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      // ignore: deprecated_member_use
                      child: SvgPicture.asset(
                        height: 26,
                        width: 26,
                        AssetManager.closeSquare,
                        // ignore: deprecated_member_use
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  )),
              // SizedBox(height: 22.pHeight(context),),
              const Spacer(),
              const Divider(
                color: Color(0xFFD0D5DD),
              )
            ],
          ),
        ),
      ],
    );
  }
}

AppBar existingAccountAppbar2(BuildContext context, String title) {
  var isDarkMode = CustomThemeData.isDarkMode(context);
  return AppBar(
    elevation: 0,
    backgroundColor: isDarkMode
        ? ColorManager.darkHeaderColor
        : Theme.of(context).scaffoldBackgroundColor,
    automaticallyImplyLeading: false,
    leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
          color: isDarkMode ? Colors.white : Colors.black,
        )),
    centerTitle: false,
    title: Text(
      title,
      style: CustomThemeData.generateStyle(
          fontSize: McGyver.textSize(context, 2.2),
          color: isDarkMode ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold),
    ),
  );
}
