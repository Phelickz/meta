import 'package:easy_localization/easy_localization.dart';
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
          label: LocaleKeys.providerWidget_providerOption_myWallet.tr(),
          assetName: "assets/images/wallet_money.svg",
          onTap: () {
            viewModel.setSocialTradingPageEnum = SocialTradingPageEnum.wallet;
          },
        ),
        OptionTile(
          label: LocaleKeys.notification.tr(),
          assetName: "assets/images/notification.svg",
          onTap: () {
            // viewModel.setSocialTradingPageEnum =
            //     SocialTradingPageEnum.notification;

            viewModel.push(const NotificationRoute());
          },
        ),
        OptionTile(
          label: LocaleKeys.support.tr(),
          assetName: "assets/images/message_question.svg",
          onTap: () {
            viewModel.push(const HelpAndSupportRoute());
          },
        ),
        OptionTile(
          label: LocaleKeys.socialTradingWidget_menuMain_aboutMT5.tr(),
          assetName: "assets/icons/info-circle.svg",
        ),
      ],
    );
  }
}
