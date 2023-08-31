import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';

class ManageAccountBottomSheet1 extends StatelessWidget {
  final String accountDetail;
  const ManageAccountBottomSheet1({super.key, required this.accountDetail});

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
          Text(
            "Change Password",
            style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 2),
                color: isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 16.pHeight(context),
          ),
          Text(
            "Delete Account",
            style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 2),
                color: Colors.red,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 16.pHeight(context),
          ),
          CustomButtons.generalButton(
            context: context,
            onTap: () {},
            text: "Cancel",
            textSize: 2,
          )
        ],
      ),
    );
  }
}

class ManageAccountBottomSheet2 extends StatelessWidget {
  final String accountDetail;
  const ManageAccountBottomSheet2({super.key, required this.accountDetail});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      height: 300.pHeight(context),
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
          Text(
            "Login",
            style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 2),
                color: isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600),
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
              "Properties",
              style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2),
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w600),
            ),
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
              "Delete Account",
              style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2),
                  color: Colors.red,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 20.pHeight(context),
          ),
          CustomButtons.generalButton(
              context: context, onTap: () {}, text: "Cancel", textSize: 2)
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
              "Delete account",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            SizedBox(height: 12.pHeight(context)),
            Text(
              'Do you really want to delete account?',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 24.pWidth(context)),
            Row(
              children: [
                Container(
                  height: 48.pHeight(context),
                  width: 154.pWidth(context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red)),
                  child: Center(
                    child: Text(
                      "Delete",
                      style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 2),
                          color: Colors.red,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.pWidth(context),
                ),
                Text(
                  "Cancel",
                  style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 2),
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w500),
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
        height: 217.pHeight(context),
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
              "Properties",
              style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.5),
                  color: isDarkMode ? Colors.white : const Color(0xFF98A2B3),
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 12.pHeight(context)),
            Text(
              '23299752',
              style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.5),
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'FXPro limited ',
              style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.5),
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'USD 12 000 000.00',
              style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.5),
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'demo-account',
              style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.5),
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 23.pHeight(context)),
            CustomButtons.clearButton(
                context: context, onTap: () {}, text: "Ok", textSize: 2)
          ],
        ),
      ),
    );
  }
}
