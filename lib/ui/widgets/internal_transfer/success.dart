import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/internal_transfer/internal_transfer_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';

import '../../../generated/locale_keys.g.dart';

@RoutePage()
class InternalTransferSuccess extends StatelessWidget {
  const InternalTransferSuccess({super.key, required this.model});
  final InternalTransferViewModel model;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
      isBusy: model.isBusy,
      body: Column(
        children: [
          verticalSpaceSmall(context),
          verticalSpaceSmall(context),
          SizedBox(
            height: McGyver.rsDoubleH(context, 50),
            width: McGyver.rsDoubleW(context, 100),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: McGyver.rsDoubleW(context, 10),
              ),
              child: isDarkMode
                  ? Image.asset(
                      "assets/images/success_illustration_dark.png",
                      fit: BoxFit.contain,
                    )
                  : Image.asset(
                      "assets/images/success_illustration_light.png",
                    ),
            ),
          ),
          Text(
            LocaleKeys.internalTransfer_successWidget_transferSuccessful,
            textAlign: TextAlign.center,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 2.5),
              fontWeight: FontWeight.w700,
              color: isDarkMode
                  ? const Color(0xFFF2F4F7)
                  : const Color(0xff475467),
            ),
          ).tr(),
          verticalSpaceSmall(context),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: LocaleKeys.internalTransfer_successWidget_fiveHunUSD.tr(),
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.5),
                fontWeight: FontWeight.w500,
                color: isDarkMode
                    ? const Color(0xff98A2B3)
                    : const Color(0xFF667085),
              ),
            ),
          ),
          verticalSpaceLarge(context),
          CustomButtons.generalButton(
            context: context,
            onTap: () {
              model.push(const BottomNavBarRoute());
            },
            text: LocaleKeys.close.tr(),
          ),
        ],
      ),
    );
  }
}
