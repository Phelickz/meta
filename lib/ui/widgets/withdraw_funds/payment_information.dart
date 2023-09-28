import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/payment_methods/payment_method_viewmodel.dart';
import 'package:meta_trader/ui/views/withdraw_funds/withdraw_funds_view_model.dart';

Widget paymentInformationCard(
  BuildContext context,
  String title,
  WithdrawFundViewModel vm,
  PaymentMethodEnum e,
) {
  var isDarkMode = CustomThemeData.isDarkMode(context);
  return Card(
    elevation: 0,
    color: !isDarkMode
        ? const Color(0xfff5fbfe)
        : Theme.of(context).scaffoldBackgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(13),
      side: BorderSide(
        color: isDarkMode
            ? Theme.of(context).secondaryHeaderColor.withOpacity(0.3)
            : Theme.of(context).secondaryHeaderColor,
      ),
    ),
    child: SizedBox(
      // height: McGyver.rsDoubleH(context, 20),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: vm.payemntMethodIcon(e, context),
            ),
            Expanded(
              flex: 9,
              child: Padding(
                padding: const EdgeInsets.only(right: 10, left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 2.2),
                        fontWeight: FontWeight.w700,
                        color:
                            isDarkMode ? Colors.white : ColorManager.lightText,
                      ),
                    ),
                    verticalSpaceXXSmall(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys
                              .withdrawFunds_paymentInformationWidget_accountNumberW,
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.4),
                            color: isDarkMode ? Colors.white : Colors.black45,
                          ),
                        ),
                        Text(
                          '09879342431',
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.4),
                            color: isDarkMode ? Colors.white : Colors.black45,
                          ),
                        ),
                      ],
                    ),
                    // verticalSpaceXXSmall(context),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys.name,
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.4),
                            color: isDarkMode ? Colors.white : Colors.black45,
                          ),
                        ),
                        Text(
                          'Susan Blake',
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.4),
                            color: isDarkMode ? Colors.white : Colors.black45,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys.averageTime,
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.4),
                            color: isDarkMode ? Colors.white : Colors.black45,
                          ),
                        ),
                        Text(
                          LocaleKeys
                              .withdrawFunds_paymentInformationWidget_124Hours,
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.4),
                            color: isDarkMode ? Colors.white : Colors.black45,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys.fee,
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.4),
                            color: isDarkMode ? Colors.white : Colors.black45,
                          ),
                        ),
                        Text(
                          '0%',
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.4),
                            color: isDarkMode ? Colors.white : Colors.black45,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys.limit,
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.4),
                            color: isDarkMode ? Colors.white : Colors.black45,
                          ),
                        ),
                        Text(
                          '10-200,00 USD',
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.4),
                            color: isDarkMode ? Colors.white : Colors.black45,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            horizontalSpaceXSmall(context),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpaceMedium(context),
                Align(
                  alignment: Alignment.center,
                  child: Transform.scale(
                    scale: 1.2,
                    child: SvgPicture.asset(
                      'assets/icons/edit.svg',
                      // ignore: deprecated_member_use
                      color: isDarkMode ? Colors.white54 : Colors.black54,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
