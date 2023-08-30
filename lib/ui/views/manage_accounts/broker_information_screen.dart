import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/ui/views/manage_accounts/manage_accounts_view_model.dart';
import 'package:meta_trader/ui/widgets/manage_accounts/manage_accounts/broker_logo.dart';
import 'package:stacked/stacked.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/widgets/manage_accounts/manage_accounts/manage_appbar.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';

class BrokerInfomationView extends StackedView<ManageAccountViewModel> {
  const BrokerInfomationView({super.key});

  @override
  Widget builder(
      BuildContext context, ManageAccountViewModel viewModel, Widget? child) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    // TODO: implement builder
    return Skeleton(
        isBusy: viewModel.isBusy,
        appBar: existingAccountAppbar2(context, "Broker Information"),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              existingTile(),
              SizedBox(
                height: 40.pHeight(context),
              ),
              Text(
                "Registration Address",
                style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.5),
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 4.pHeight(context),
              ),
              Text(
                "Level 2, ken Lee building, 20 Edith Cavell street, Port Luis, Mauritius",
                style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.5),
                    color: isDarkMode ? Colors.white : const Color(0xFF667085),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 24.pHeight(context),
              ),
              Text(
                "Website",
                style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.5),
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 4.pHeight(context),
              ),
              Text(
                "www.fxpro.com",
                style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.4),
                    color: ColorManager.lightHeaderColor,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 24.pHeight(context),
              ),
              Text(
                "Support",
                style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.5),
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 4.pHeight(context),
              ),
              Text(
                "support@fxpro.com",
                style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.4),
                    color: ColorManager.lightHeaderColor,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 24.pHeight(context),
              ),
              Text(
                "Phone",
                style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.5),
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 4.pHeight(context),
              ),
              Text(
                "+92 892 983 123",
                style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.4),
                    color: ColorManager.lightHeaderColor,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 24.pHeight(context),
              ),
            ],
          ),
        ));
  }

  @override
  ManageAccountViewModel viewModelBuilder(BuildContext context) {
    // TODO: implement viewModelBuilder
    return ManageAccountViewModel();
  }

  Widget existingTile() {
    return Builder(builder: (context) {
      var isDarkMode = CustomThemeData.isDarkMode(context);
      return Row(
        children: [
          BorkerLogo(
            brokerLogoPath: AssetManager.brokerLogo,
            xheight: 48.pHeight(context),
          ),
          SizedBox(
            width: 16.pWidth(context),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 160,
                // height: 35,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "FXPro",
                    style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.7),
                        color: isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(height: 10.pHeight(context)),
              Text(
                "ForexPro",
                style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1),
                    color: ColorManager.lightHeaderColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      );
    });
  }
}
