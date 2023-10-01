import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/constants.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/fund_account/fund_account_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/textfields/textfield.dart';

class SticPay extends StatelessWidget {
  const SticPay({super.key, required this.model});
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
                  LocaleKeys.payId,
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
                        const BoxConstraints(minHeight: 24, minWidth: 24),
                    suffixIcon: Padding(
                      padding: Constants.getPadding(context, 4),
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
                  LocaleKeys.emailAddress,
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
                    hintText: 'SusanBlake@metatrader.io',
                    password: false,
                    filledWithColor: true,
                  ),
                ),
                verticalSpaceSmall(context),
                Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: isDarkMode
                          ? Theme.of(context).secondaryHeaderColor
                          : Colors.black45,
                    ),
                    horizontalSpaceXSmall(context),
                    Expanded(
                      child: Text(
                        LocaleKeys
                            .fundAccountWidget_perfectMoneyWidget_noteThat,
                        style: CustomThemeData.generateStyle(
                          fontSize: 13,
                          color: isDarkMode
                              ? ColorManager.darkText
                              : ColorManager.lightText,
                        ),
                      ).tr(),
                    )
                  ],
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
