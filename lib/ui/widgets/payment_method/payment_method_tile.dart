import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/ui/views/payment_methods/payment_method_viewmodel.dart';
import 'package:meta_trader/ui/views/payment_methods/pm_main/pm_main_view.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';

class PaymentMethodTile extends StatelessWidget {
  final PaymentMethodViewModel vm;
  final PaymentMethodEnum paymentMethodEnum;
  const PaymentMethodTile({
    super.key,
    required this.vm,
    required this.paymentMethodEnum,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: GestureDetector(
        onTap: () {
          vm.onTap(paymentMethodEnum);
        },
        child: Row(
          children: [
            vm.payemntMethodIcon(paymentMethodEnum, context),
            horizontalSpaceSmall(context),
            Expanded(
              child: Text(
                vm.paymentMethodLabel(paymentMethodEnum),
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2.1),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode
                      ? const Color(0xFFD0D5DD)
                      : const Color(0xFF667085),
                ),
              ),
            ),
            SizedBox(
              height: 22,
              width: 22,
              child: SvgPicture.asset(
                "assets/images/tick_circle.svg",
              ),
            ),
            horizontalSpaceXXSmall(context),
            SizedBox(
              height: 20,
              width: 20,
              child: SvgPicture.asset(
                "assets/images/arrow_right.svg",
                width: 18,
                height: 18,
                colorFilter: ColorFilter.mode(
                  isDarkMode
                      ? const Color(0xff98A2B3)
                      : const Color(0xFF667085),
                  BlendMode.srcIn,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
