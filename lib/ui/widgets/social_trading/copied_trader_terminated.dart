import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:meta_trader/ui/widgets/social_trading/components/rating_modal.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';
import '../buttons/buttons.dart';

@RoutePage()
class CopiedTraderTerminatedPage extends StatelessWidget {
  final SocialTradingViewModel viewModel;

  const CopiedTraderTerminatedPage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Skeleton(
        isBusy: viewModel.isBusy,
        body: Column(
          children: [
            verticalSpaceSmall(context),
            verticalSpaceSmall(context),
            verticalSpaceSmall(context),
            SizedBox(
              height: McGyver.rsDoubleH(context, 46),
              width: McGyver.rsDoubleW(context, 100),
              child: isDarkMode
                  ? Image.asset(
                      "assets/images/success_illustration_dark.png",
                      fit: BoxFit.contain,
                    )
                  : Image.asset(
                      "assets/images/success_illustration_light.png",
                    ),
            ),
            Text(
              LocaleKeys
                  .socialTradingWidget_copiedTraderTerminated_subscriptionTerminated,
              textAlign: TextAlign.center,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 2.6),
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
                text: LocaleKeys.youHaveSuccessCopied.tr(),
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.7),
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
                // viewModel.push(const SocialTxradingDasboard());
                showRatingCopyingModal(context, viewModel);
              },
              text: LocaleKeys.continueWord.tr(),
            ),
          ],
        ),
      ),
    );
  }

  void showRatingCopyingModal(BuildContext context, SocialTradingViewModel vm) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    showModalBottomSheet(
        backgroundColor:
            isDarkMode ? const Color(0xFF0C2031) : const Color(0xFFFAFDFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(McGyver.rsDoubleH(context, 2)),
            topRight: Radius.circular(McGyver.rsDoubleH(context, 2)),
          ),
        ),
        context: context,
        isDismissible: true,
        enableDrag: true,
        isScrollControlled: true,
        builder: (context) {
          return const RatingModal();
        });
  }
}
