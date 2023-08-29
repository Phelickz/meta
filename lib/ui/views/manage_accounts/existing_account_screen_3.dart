import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/ui/views/manage_accounts/manage_accounts_view_model.dart';
import 'package:meta_trader/ui/widgets/manage_accounts/manage_accounts/broker_logo.dart';
import 'package:stacked/stacked.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/manage_accounts/existing_account_forms.dart';
import 'package:meta_trader/ui/widgets/manage_accounts/manage_accounts/manage_appbar.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';


class ExistingAccountView3 extends StackedView<ManageAccountViewModel>{
  @override
  Widget builder(BuildContext context, ManageAccountViewModel viewModel, Widget? child) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    // TODO: implement builder
    return Skeleton(
      isBusy: viewModel.isBusy, 
      appBar: existingAccountAppbar2(context, "Change Password",),
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.pHeight(context),),
            existingTile(),
            SizedBox(height: 40.pHeight(context),),
            const ExistingAccountFormView2(),
            SizedBox(height: 5.pHeight(context),),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: false, onChanged: (value)=>{}),
                // SizedBox(width: 6.pWidth(context),),
                Text("Save Password",
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.7),
                  color: isDarkMode ? Colors.white : const Color(0xFF667085),
                  fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
            SizedBox(height: 54.pHeight(context),),
            CustomButtons.generalButton(
                context: context, 
                onTap: () {}, 
                text: "Save Changes",
                textSize: 2
            ),
            SizedBox(height: 16.pHeight(context),),
            Align(
              alignment: Alignment.bottomCenter,
              child: RichText(
                text: TextSpan(
                  text: "Forgot Password?   ",
                    style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    color: isDarkMode ? Colors.white : const Color(0xFF667085),
                    fontWeight: FontWeight.w500
                    ),
                  children: [
                    TextSpan(
                      text: "Contact Broker",
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.8),
                        color: ColorManager.lightHeaderColor,
                        fontWeight: FontWeight.w500
                        ),
                      // recognizer: TapGestureRecognizer()..onTap =() => AppRoute.go(AppRoute.signUp)
                    )
                  ]
                )
              ),
            )
          ],
        ),
        )
      );
  }

  @override
  ManageAccountViewModel viewModelBuilder(BuildContext context) {
    // TODO: implement viewModelBuilder
    return ManageAccountViewModel();
  }

  Widget existingTile(){
    return Builder(
      builder: (context) {
        var isDarkMode = CustomThemeData.isDarkMode(context);
        return Row(
          children: [
                BorkerLogo(brokerLogoPath: AssetManager.brokerLogo,xheight: 48.pHeight(context),),
                SizedBox(width: 16.pWidth(context),),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 160,
                      // height: 35,
                      child: FittedBox(
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.scaleDown,
                        child: Text("FXPro",
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 1.7),
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.pHeight(context)
                    ),
                    Text("ForexPro",
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1),
                      color: ColorManager.lightHeaderColor,
                      fontWeight: FontWeight.w600
                      ),
                    ),
                  ],
                ),
          ],
        );
      }
    );
  }
}