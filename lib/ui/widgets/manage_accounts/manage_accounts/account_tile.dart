import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/manage_accounts/manage_accounts_view_model.dart';
import 'package:meta_trader/ui/widgets/manage_accounts/manage_accounts/broker_logo.dart';
import 'package:meta_trader/ui/widgets/manage_accounts/manage_accounts/manage_account_bottomsheet.dart';
import 'package:meta_trader/ui/widgets/manage_accounts/manage_accounts/type_tag.dart';

class AccountTile extends StatelessWidget {
  final ManageAccountViewModel model;
  final String type, email, brokerLogoPath, details, amount;
  const AccountTile(
      {super.key,
      required this.type,
      required this.email,
      required this.brokerLogoPath,
      required this.details,
      required this.amount,
      required this.model});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return InkWell(
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
              return ManageAccountBottomSheet2(
                accountDetail: "44291097-Deriv-Real",
                model: model,
              );
            });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isDarkMode
              ? ColorManager.darkHeaderColor
              : const Color(0xFFFAFDFF),
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
                      color:
                          isDarkMode ? const Color(0xFF98A2B3) : Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4.pWidth(context),
                ),
                Text(
                  "Balance",
                  style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.2),
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 12.pHeight(context),
                ),
                TypeTag(tag: type)
              ],
            )
          ],
        ),
      ),
    );
  }
}
