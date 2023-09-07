import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
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
          label: "My Wallet",
          assetName: "assets/images/wallet_money.svg",
          onTap: () {
            viewModel.setSocialTradingPageEnum = SocialTradingPageEnum.wallet;
          },
        ),
        OptionTile(
          label: "Notifications",
          assetName: "assets/images/notification.svg",
          onTap: () {
            viewModel.setSocialTradingPageEnum =
                SocialTradingPageEnum.notification;
          },
        ),
        const OptionTile(
          label: "Support",
          assetName: "assets/images/message_question.svg",
        ),
        const OptionTile(
          label: "About MT 5 Copy Trading",
          assetName: "assets/icons/info-circle.svg",
        ),
      ],
    );
  }
}
