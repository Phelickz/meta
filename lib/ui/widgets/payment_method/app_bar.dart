import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/ui/views/payment_methods/payment_method_viewmodel.dart';
import 'package:meta_trader/ui/views/payment_methods/pm_main/pm_main_view.dart';
import 'package:meta_trader/ui/widgets/payment_method/custom_back_button.dart';

import '../../../app/utils/theme.dart';

PreferredSizeWidget paymentMethodAppBar(
  BuildContext context,
  PaymentMethodViewModel model,
) {
  var isDarkMode = CustomThemeData.isDarkMode(context);
  return PreferredSize(
    preferredSize: const Size.fromHeight(70),
    child: AppBar(
      elevation: 0,
      backgroundColor: isDarkMode
          ? const Color(0xff052844)
          : Theme.of(context).scaffoldBackgroundColor,
      automaticallyImplyLeading: false,
      actions: model.returnActions(context),
      leading: CustomBackButtons(onTap: () {
        if (model.selectedAddPaymentMethodEnum == PaymentMethodEnum.home) {
          model.push(const BottomNavBarRoute());
        } else if (model.selectedAddPaymentMethodEnum ==
            PaymentMethodEnum.none) {
          model.push(const BottomNavBarRoute());
        } else {
          model.onswitchAddPaymentMethod(PaymentMethodEnum.home);
        }
      }),
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.paymentMethodLabel(model.selectedAddPaymentMethodEnum),
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 2.2),
              fontWeight: FontWeight.bold,
              color: isDarkMode
                  ? const Color(0xFFD0D5DD)
                  : const Color(0xFF344054),
            ),
          ),
          model
                  .paymentMethodSubtitle(model.selectedAddPaymentMethodEnum)
                  .isEmpty
              ? const SizedBox()
              : Text(
                  model.paymentMethodSubtitle(
                      model.selectedAddPaymentMethodEnum),
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.5),
                    color:
                        isDarkMode ? Colors.white54 : const Color(0xff667085),
                    fontWeight: FontWeight.normal,
                  ),
                ),
        ],
      ),
    ),
  );
}
