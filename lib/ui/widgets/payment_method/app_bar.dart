import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/ui/views/payment_methods/payment_method_viewmodel.dart';
import '../../../app/utils/theme.dart';

AppBar paymentMethodAppBar(BuildContext context, String title, String subtitle,
    PaymentMethodViewModel model,
    [String assetName = '']) {
  var isDarkMode = CustomThemeData.isDarkMode(context);
  return AppBar(
    elevation: 0,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    automaticallyImplyLeading: false,
    leading: IconButton(
        icon: Icon(
          Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        onPressed: () {
          if (model.paymentMethodPageEnum == PaymentMethodPageEnum.main) {
            model.goBack();
          }

          if (model.paymentMethodPageEnum == PaymentMethodPageEnum.binancePay) {
            model.paymentMethodPageEnum = PaymentMethodPageEnum.main;
          }

          if (model.paymentMethodPageEnum == PaymentMethodPageEnum.neteller) {
            model.paymentMethodPageEnum = PaymentMethodPageEnum.main;
          }

          if (model.paymentMethodPageEnum == PaymentMethodPageEnum.onlineBank) {
            model.paymentMethodPageEnum = PaymentMethodPageEnum.main;
          }

          if (model.paymentMethodPageEnum == PaymentMethodPageEnum.tether) {
            model.paymentMethodPageEnum = PaymentMethodPageEnum.main;
          }

          if (model.paymentMethodPageEnum == PaymentMethodPageEnum.skrill) {
            model.paymentMethodPageEnum = PaymentMethodPageEnum.main;
          }
          if (model.paymentMethodPageEnum == PaymentMethodPageEnum.sticPay) {
            model.paymentMethodPageEnum = PaymentMethodPageEnum.main;
          }
          if (model.paymentMethodPageEnum ==
              PaymentMethodPageEnum.perfectMoney) {
            model.paymentMethodPageEnum = PaymentMethodPageEnum.main;
          }
          if (model.paymentMethodPageEnum ==
              PaymentMethodPageEnum.addPaymentMethod) {
            model.paymentMethodPageEnum = PaymentMethodPageEnum.main;
          }
        }),
    centerTitle: false,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 2),
            fontWeight: FontWeight.bold,
            color:
                isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFF344054),
          ),
        ),
        if (subtitle != '')
          Text(
            subtitle,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.6),
              fontWeight: FontWeight.w500,
              color: isDarkMode
                  ? const Color(0xFF667085)
                  : const Color(0xFF667085),
            ),
          ),
      ],
    ),
    actions: [
      if (assetName != "")
        IconButton(
          onPressed: () {
            if (model.paymentMethodPageEnum == PaymentMethodPageEnum.main) {
              model.paymentMethodPageEnum =
                  PaymentMethodPageEnum.addPaymentMethod;
            }
          },
          icon: SizedBox(
            height: McGyver.rsDoubleH(context, 2.8),
            width: McGyver.rsDoubleH(context, 2.8),
            child: SvgPicture.asset(
              assetName,
              colorFilter: ColorFilter.mode(
                isDarkMode ? const Color(0xff98A2B3) : const Color(0xFF667085),
                BlendMode.srcIn,
              ),
            ),
          ),
        )
    ],
  );
}
