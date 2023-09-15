import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';
import 'package:meta_trader/ui/widgets/appbar.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';

@RoutePage()
class SubscriptionGuidePage extends StatelessWidget {
  final SocialTradingViewModel viewModel;
  const SubscriptionGuidePage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
      appBar: globalAppBar(
          context, 'Subscription Guide', 'Learn about subscription setup', () {
        viewModel.goBack();
      }, []),
      isBusy: viewModel.isBusy,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceXSmall(context),
          Text(
            "Copy Proportion",
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.9),
              fontWeight: FontWeight.bold,
              color: isDarkMode
                  ? const Color(0xFFFFFFFF)
                  : const Color(0xFF475467),
            ),
          ),
          verticalSpaceXSmall(context),
          Text(
            "Select the size of your investment that will be engaged in copy trading",
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.6),
              fontWeight: FontWeight.w500,
              color: isDarkMode
                  ? const Color(0xFF98A2B3)
                  : const Color(0xFF667085),
            ),
          ),
          verticalSpaceXSmall(context),
          _bulletPointText(context, "Equal x1:",
              "The volume of your copied orders will equal the volume of the master trader’s orders."),
          verticalSpaceXSmall(context),
          _bulletPointText(context, "Double x2:",
              "To facilitate transactions, we may collect details related to your bank account, credit/debit card information, and transaction history."),
          verticalSpaceXSmall(context),
          _bulletPointText(context, "Triple x3:",
              "We may automatically collect information about your device, operating system, browser type, IP address, and interactions with our platform to improve our services and user experience."),
          verticalSpaceSmall(context),
          Text(
            "Add Support Funds",
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.9),
              fontWeight: FontWeight.bold,
              color: isDarkMode
                  ? const Color(0xFFFFFFFF)
                  : const Color(0xFF475467),
            ),
          ),
          verticalSpaceXSmall(context),
          Text(
            "Support funds help to protect your investments from unexpected market movement.\n\nIdeally, you should add support funds that will be at least 50% of the required investment.",
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.6),
              fontWeight: FontWeight.w500,
              color: isDarkMode
                  ? const Color(0xFF98A2B3)
                  : const Color(0xFF667085),
            ),
          )
        ],
      ),
    );
  }

  Widget _bulletPointText(
      BuildContext context, String boldText, String mediumText) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.only(left: McGyver.rsDoubleW(context, 2)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              CircleAvatar(
                radius: McGyver.rsDoubleW(context, .5),
                backgroundColor: isDarkMode
                    ? const Color(0xFF98A2B3)
                    : const Color(0xFF667085),
              ),
            ],
          ),
          horizontalSpaceXSmall(context),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: boldText,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.6),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode
                      ? const Color(0xFFFFFFFF)
                      : const Color(0xFF475467),
                ),
                children: [
                  TextSpan(
                    text: " ",
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.6),
                      fontWeight: FontWeight.w500,
                      color: isDarkMode
                          ? const Color(0xFF98A2B3)
                          : const Color(0xFF667085),
                    ),
                  ),
                  TextSpan(
                    text: mediumText,
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.6),
                      fontWeight: FontWeight.w500,
                      color: isDarkMode
                          ? const Color(0xFF98A2B3)
                          : const Color(0xFF667085),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
