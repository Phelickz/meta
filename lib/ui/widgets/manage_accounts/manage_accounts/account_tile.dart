import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/widgets/manage_accounts/manage_accounts/broker_logo.dart';
import 'package:meta_trader/ui/widgets/manage_accounts/manage_accounts/type_tag.dart';

import '../../../../generated/locale_keys.g.dart';

class AccountTile extends StatelessWidget {
  final String type, email, brokerLogoPath, details, amount;
  const AccountTile(
      {super.key,
      required this.type,
      required this.email,
      required this.brokerLogoPath,
      required this.details,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
        color:
            isDarkMode ? ColorManager.darkHeaderColor : const Color(0xFFFAFDFF),
        border: !isDarkMode
            ? Border.all(
                color: const Color(0xFFE4E7EC),
              )
            : null,
        borderRadius: BorderRadius.circular(12.pWidth(context)),
      ),
      padding: EdgeInsets.symmetric(
          vertical: 20.pHeight(context), horizontal: 12.pWidth(context)),
      margin: EdgeInsets.symmetric(vertical: 7.pHeight(context)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                details,
                style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1),
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 4.pHeight(context),
              ),
              Text(
                email,
                style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.5),
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 12.pHeight(context),
              ),
              BorkerLogo(brokerLogoPath: brokerLogoPath)
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.5),
                    color: isDarkMode ? const Color(0xFF98A2B3) : Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 4.pWidth(context),
              ),
              Text(
                LocaleKeys.balance,
                style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.2),
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w300),
              ).tr(),
              SizedBox(
                height: 12.pHeight(context),
              ),
              TypeTag(tag: type)
            ],
          )
        ],
      ),
    );
  }
}
