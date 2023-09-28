import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';
import 'package:meta_trader/ui/widgets/social_trading/components/option_tile.dart';

class MenuMainPage extends StatelessWidget {
  final SocialTradingViewModel viewModel;
  const MenuMainPage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpaceXSmall(context),
        OptionTile(
          label: LocaleKeys.providerWidget_providerOption_myWallet,
          assetName: "assets/images/wallet_money.svg",
          onTap: () {
            viewModel.setSocialTradingPageEnum = SocialTradingPageEnum.wallet;
          },
        ),
        OptionTile(
          label: LocaleKeys.notification,
          assetName: "assets/images/notification.svg",
          onTap: () {
            // viewModel.setSocialTradingPageEnum =
            //     SocialTradingPageEnum.notification;

            viewModel.push(const NotificationRoute());
          },
        ),
        OptionTile(
          label: LocaleKeys.support,
          assetName: "assets/images/message_question.svg",
          onTap: () {
            viewModel.push(const HelpAndSupportRoute());
          },
        ),
        const OptionTile(
          label: LocaleKeys.socialTradingWidget_menuMain_aboutMT5,
          assetName: "assets/icons/info-circle.svg",
        ),
      ],
    );
  }
}
