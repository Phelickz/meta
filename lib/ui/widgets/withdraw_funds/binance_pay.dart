import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/payment_methods/payment_method_viewmodel.dart';
import 'package:meta_trader/ui/views/withdraw_funds/withdraw_funds_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/textfields/textfield.dart';
import 'package:meta_trader/ui/widgets/withdraw_funds/payment_information.dart';

class BinancePayWithdraw extends StatelessWidget {
  const BinancePayWithdraw({super.key, required this.model});
  final WithdrawFundViewModel model;

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
                // verticalSpaceSmall(context),
                Text(
                  LocaleKeys.paymentInformation,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.3),
                    color: isDarkMode
                        ? ColorManager.darkText
                        : ColorManager.lightText,
                  ),
                ),
                verticalSpaceXXSmall(context),
                paymentInformationCard(context, 'Binance Pay', model,
                    PaymentMethodEnum.binancePay),
                verticalSpaceSmall(context),
                Text(
                  LocaleKeys.amountToWithdraw,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    color: isDarkMode
                        ? ColorManager.darkText
                        : ColorManager.lightText,
                  ),
                ),
                verticalSpaceXXSmall(context),
                const CustomTextFields(
                  hintText: '0.00 USD',
                  password: false,
                ),
                verticalSpaceSmall(context),
                // Text(
                //   'Additional Information (Optional)',
                //   style: CustomThemeData.generateStyle(
                //     fontSize: McGyver.textSize(context, 1.8),
                //     color: isDarkMode
                //         ? ColorManager.darkText
                //         : ColorManager.lightText,
                //   ),
                // ),
                verticalSpaceXXSmall(context),
                const CustomTextFields(
                  hintText: LocaleKeys.leaveAMark,
                  password: false,
                ),
              ],
            ),
          ),
          CustomButtons.generalButton(
              context: context,
              onTap: () {
                model.setWithdrawFundViewEnum = WithdrawFundPageEnum.success;
              },
              text: LocaleKeys.withdrawToBank),
          verticalSpaceMedium(context),
        ],
      ),
    );
  }
}
