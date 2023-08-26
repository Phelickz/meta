import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/payment_methods/payment_method_viewmodel.dart';
import 'package:meta_trader/ui/views/withdraw_funds/withdraw_funds_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/textfields/textfield.dart';
import 'package:meta_trader/ui/widgets/withdraw_funds/payment_information.dart';

class NetellerWithdraw extends StatelessWidget {
  const NetellerWithdraw({super.key, required this.model});
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
                  'Payment Information',
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.3),
                    color: isDarkMode
                        ? ColorManager.darkText
                        : ColorManager.lightText,
                  ),
                ),
                verticalSpaceXXSmall(context),
                paymentInformationCard(
                    context, 'Neteller', model, PaymentMethodEnum.neteller),
                verticalSpaceSmall(context),
                Text(
                  'Amount To Withdraw',
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
                Text(
                  'Additional Information (Optional)',
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    color: isDarkMode
                        ? ColorManager.darkText
                        : ColorManager.lightText,
                  ),
                ),
                verticalSpaceXXSmall(context),
                const CustomTextFields(
                  hintText: 'Leave a remark',
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
              text: 'Withdraw to Bank'),
          verticalSpaceMedium(context),
        ],
      ),
    );
  }
}
