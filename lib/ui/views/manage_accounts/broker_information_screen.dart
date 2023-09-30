import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
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
        appBar: existingAccountAppbar2(
            context,
            LocaleKeys
                .views_manageAccount_brokerInformationView_brokersInformation
                .tr()),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              existingTile(),
              SizedBox(
                height: 40.pHeight(context),
              ),
              Text(
                LocaleKeys.views_manageAccount_brokerInformationView_regAddress,
                style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.5),
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500),
              ).tr(),
              SizedBox(
                height: 4.pHeight(context),
              ),
              Text(
                LocaleKeys.views_manageAccount_brokerInformationView_level2,
                style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.5),
                    color: isDarkMode ? Colors.white : const Color(0xFF667085),
                    fontWeight: FontWeight.w500),
              ).tr(),
              SizedBox(
                height: 24.pHeight(context),
              ),
              Text(
                LocaleKeys.website,
                style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.5),
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500),
              ).tr(),
              SizedBox(
                height: 4.pHeight(context),
              ),
              Text(
                LocaleKeys.fxproSite,
                style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.4),
                    color: ColorManager.lightHeaderColor,
                    fontWeight: FontWeight.w600),
              ).tr(),
              SizedBox(
                height: 24.pHeight(context),
              ),
              Text(
                LocaleKeys.support,
                style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.5),
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500),
              ).tr(),
              SizedBox(
                height: 4.pHeight(context),
              ),
              Text(
                LocaleKeys
                    .views_manageAccount_brokerInformationView_supportSite,
                style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.4),
                    color: ColorManager.lightHeaderColor,
                    fontWeight: FontWeight.w600),
              ).tr(),
              SizedBox(
                height: 24.pHeight(context),
              ),
              Text(
                LocaleKeys.phone,
                style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.5),
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500),
              ).tr(),
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
