import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';
import '../../../generated/locale_keys.g.dart';
import '../../views/payment_methods/payment_method_viewmodel.dart';

class AddPaymentMethodTile extends StatelessWidget {
  final PaymentMethodViewModel vm;
  final PaymentMethodEnum paymentMethodEnum;
  const AddPaymentMethodTile({
    super.key,
    required this.vm,
    required this.paymentMethodEnum,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return GestureDetector(
      onTap: () => vm.onswitchAddPaymentMethod(paymentMethodEnum),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isDarkMode ? const Color(0xFF0C2031) : Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vm.payemntMethodIcon(paymentMethodEnum, context),
            horizontalSpaceSmall(context),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vm.paymentMethodLabel(paymentMethodEnum),
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 2.2),
                      fontWeight: FontWeight.bold,
                      color: isDarkMode
                          ? const Color(0xFFD0D5DD)
                          : const Color(0xFF667085),
                    ),
                  ),
                  verticalSpaceXXSmall(context),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _infoLeftText(LocaleKeys.averageTime.tr(), context),
                          _infoRightText(LocaleKeys.instant.tr(), context),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _infoLeftText(LocaleKeys.duration.tr(), context),
                          _infoRightText(LocaleKeys.upTo.tr(), context),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _infoLeftText(LocaleKeys.fee.tr(), context),
                          _infoRightText("0%", context),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _infoLeftText(LocaleKeys.limit.tr(), context),
                          _infoRightText(
                              LocaleKeys
                                  .paymentMethod_addPaymentMethodTile_figure
                                  .tr(),
                              context),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            horizontalSpaceSmall(context),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                ),
                vm.isSelectedAddPaymentMethod(paymentMethodEnum)
                    ? SizedBox(
                        height: 22,
                        width: 22,
                        child: SvgPicture.asset(
                          "assets/images/checkbox.svg",
                        ),
                      )
                    : SizedBox(
                        height: 22,
                        width: 22,
                        child: SvgPicture.asset(
                          "assets/images/uncheckbox.svg",
                        ),
                      ),
                const SizedBox(
                  height: 50,
                  width: 2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoLeftText(String label, BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.left,
      style: CustomThemeData.generateStyle(
        fontSize: McGyver.textSize(context, 1.4),
        fontWeight: FontWeight.w500,
        color: const Color(0xFF98A2B3),
      ),
    );
  }

  Widget _infoRightText(String label, BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.right,
      style: CustomThemeData.generateStyle(
        fontSize: McGyver.textSize(context, 1.4),
        fontWeight: FontWeight.w500,
        color: const Color(0xFF98A2B3),
      ),
    );
  }
}
