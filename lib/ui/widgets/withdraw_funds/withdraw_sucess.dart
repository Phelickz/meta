import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/withdraw_funds/withdraw_funds_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';

class WithdrawSuccess extends StatelessWidget {
  final WithdrawFundViewModel model;
  const WithdrawSuccess({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpaceMedium(context),
          SvgPicture.asset(
            'assets/images/withdraw_succes.svg',
            height: McGyver.rsDoubleH(context, 50),
            width: McGyver.rsDoubleH(context, 50),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              LocaleKeys
                  .withdrawFunds_withdrawSuccessWidget_yourTransactionIsBeing,
              textAlign: TextAlign.center,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 2.4),
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
            ).tr(),
          ),
          verticalSpaceSmall(context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: LocaleKeys.financialRegulation.tr(),
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.6),
                  color: isDarkMode ? Colors.white60 : Colors.black87,
                ),
                children: [
                  TextSpan(
                    text: '\n\n',
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.6),
                      color: isDarkMode ? Colors.white60 : Colors.black87,
                    ),
                  ),
                  TextSpan(
                    text: LocaleKeys
                        .withdrawFunds_withdrawSuccessWidget_youCanSkip
                        .tr(),
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.6),
                      color: isDarkMode ? Colors.white60 : Colors.black87,
                    ),
                  )
                ],
              ),
            ),
          ),
          const Spacer(),
          CustomButtons.generalButton(
            context: context,
            onTap: () {
              model.push(const BottomNavBarRoute());
            },
            text: LocaleKeys.back.tr(),
          ),
          verticalSpaceMedium(context),
        ],
      ),
    );
  }
}
