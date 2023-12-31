import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/constants.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/fund_account/fund_account_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/textfields/textfield.dart';

import '../../../generated/locale_keys.g.dart';

class OnlineBank extends StatelessWidget {
  const OnlineBank({super.key, required this.model});
  final FundAccountViewModel model;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 5),
      ),
      child: Column(
        children: [
          verticalSpaceSmall(context),
          Expanded(
            child: ListView(
              children: [
                Text(
                  LocaleKeys.fundAccountWidget_onlineBankWidget_selectBank,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    color: isDarkMode
                        ? ColorManager.darkText
                        : ColorManager.lightText,
                  ),
                ).tr(),
                verticalSpaceXXSmall(context),
                CustomTextFields(
                  hintText: LocaleKeys
                      .fundAccountWidget_onlineBankWidget_chooseAvailableBank
                      .tr(),
                  password: false,
                  suffixIcon: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
                verticalSpaceSmall(context),
                Text(
                  LocaleKeys.amountToFund,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    color: isDarkMode
                        ? ColorManager.darkText
                        : ColorManager.lightText,
                  ),
                ).tr(),
                verticalSpaceXXSmall(context),
                const CustomTextFields(
                  hintText: '0.00 USD',
                  password: false,
                ),
                verticalSpaceSmall(context),
                Text(
                  LocaleKeys.fundAccountWidget_onlineBankWidget_accountNumber,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    color: isDarkMode
                        ? ColorManager.darkText
                        : ColorManager.lightText,
                  ),
                ).tr(),
                verticalSpaceXXSmall(context),
                IgnorePointer(
                  ignoring: true,
                  child: CustomTextFields(
                    hintText: '2034829473',
                    password: false,
                    filledWithColor: true,
                    suffixIconConstraints:
                        const BoxConstraints(minHeight: 30, minWidth: 30),
                    suffixIcon: Padding(
                      padding: Constants.getPadding(context, 9),
                      child: SvgPicture.asset(
                        'assets/icons/copy.svg',
                        width: 2,
                        height: 2,
                      ),
                    ),
                  ),
                ),
                verticalSpaceSmall(context),
                Text(
                  LocaleKeys.fundAccountWidget_onlineBankWidget_accountName,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    color: isDarkMode
                        ? ColorManager.darkText
                        : ColorManager.lightText,
                  ),
                ).tr(),
                verticalSpaceXXSmall(context),
                const IgnorePointer(
                  ignoring: true,
                  child: CustomTextFields(
                    hintText: 'Susan Blake',
                    password: false,
                    filledWithColor: true,
                  ),
                ),
              ],
            ),
          ),
          CustomButtons.generalButton(
              context: context, onTap: () {}, text: LocaleKeys.next.tr()),
          verticalSpaceMedium(context),
        ],
      ),
    );
  }
}
