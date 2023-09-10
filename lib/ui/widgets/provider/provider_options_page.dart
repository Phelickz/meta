import 'package:flutter/material.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/ui/views/provider/provider_view_model.dart';
import 'package:meta_trader/ui/widgets/provider/components/provider_oprions_tile.dart';

class ProviderOptionsPage extends StatelessWidget {
  final ProviderViewModel viewModel;
  const ProviderOptionsPage({Key? key, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30.pHeight(context)),
        ProviderOptionsTile(
            onTap: () {
              viewModel.setProviderPageEnum = ProviderPageEnum.wallet;
            },
            title: "My Wallet",
            leading: AssetManager.paymentMethod),
        SizedBox(height: 18.pHeight(context)),
        ProviderOptionsTile(
            onTap: () {
              viewModel.setProviderPageEnum = ProviderPageEnum.profileSettings;
            },
            title: "Profile Settings",
            leading: AssetManager.editUserIcon),
        SizedBox(height: 18.pHeight(context)),
        ProviderOptionsTile(
            onTap: () {
              viewModel.setProviderPageEnum = ProviderPageEnum.notifications;
            },
            title: "Notification",
            leading: AssetManager.notificationsIcon),
        SizedBox(height: 18.pHeight(context)),
        ProviderOptionsTile(
          title: "Support",
          leading: AssetManager.help,
          onTap: () {
            viewModel.push(const HelpAndSupportRoute());
          },
        ),
        SizedBox(height: 18.pHeight(context)),
        ProviderOptionsTile(
          title: "Logout",
          leading: AssetManager.logout,
          onTap: () {
            viewModel.push(const BottomNavBarRoute());
          },
        ),
      ],
    );
  }
}
