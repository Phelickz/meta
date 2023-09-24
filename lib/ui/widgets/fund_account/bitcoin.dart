import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/fund_account/fund_account_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/textfields/textfield.dart';

class Bitcoin extends StatelessWidget {
  const Bitcoin({super.key, required this.model});
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
                  LocaleKeys.walletAddress.tr(),
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    color: isDarkMode
                        ? ColorManager.darkText
                        : ColorManager.lightText,
                  ),
                ),
                verticalSpaceXXSmall(context),
                IgnorePointer(
                  ignoring: true,
                  child: CustomTextFields(
                    hintText: '9Wer220GtwP3418ewh2jJ&E368',
                    password: false,
                    filledWithColor: true,
                    suffixIconConstraints:
                        const BoxConstraints(minHeight: 30, minWidth: 30),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 9.0),
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
                  LocaleKeys.amountToFund.tr(),
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    color: isDarkMode
                        ? ColorManager.darkText
                        : ColorManager.lightText,
                  ),
                ),
                verticalSpaceXXSmall(context),
                const CustomTextFields(
                  hintText: '0 BTC',
                  password: false,
                ),
                verticalSpaceSmall(context),
                Text(
                  LocaleKeys.chooseNetwork.tr(),
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    color: isDarkMode
                        ? ColorManager.darkText
                        : ColorManager.lightText,
                  ),
                ),
                verticalSpaceXXSmall(context),
                CustomTextFields(
                  hintText: LocaleKeys.btcBeacon.tr(),
                  password: false,
                  suffixIcon: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
                verticalSpaceSmall(context),
                verticalSpaceXSmall(context),
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
                            .fundAccountWidget_bitcoinWidget_makeSureToFund
                            .tr(),
                        style: CustomThemeData.generateStyle(
                          fontSize: 13,
                          color: isDarkMode
                              ? ColorManager.darkText
                              : ColorManager.lightText,
                        ),
                      ),
                    )
                  ],
                ),
                verticalSpaceSmall(context),
                verticalSpaceSmall(context),
              ],
            ),
          ),
          CustomButtons.generalButton(
              context: context,
              onTap: () {},
              text: LocaleKeys.fundAccount.tr()),
          verticalSpaceMedium(context),
        ],
      ),
    );
  }
}
