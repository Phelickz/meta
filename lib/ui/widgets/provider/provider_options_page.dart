import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/ui/widgets/provider/components/provider_oprions_tile.dart';

class ProviderOptionsPage extends StatelessWidget {
  const ProviderOptionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProviderOptionsTile(
            title: "My Wallet", leading: AssetManager.paymentMethod),
        ProviderOptionsTile(
            title: "Profile Settings", leading: AssetManager.editUserIcon),
        ProviderOptionsTile(
            title: "Notification", leading: AssetManager.notificationsIcon),
        ProviderOptionsTile(title: "Support", leading: AssetManager.help),
        ProviderOptionsTile(title: "Logout", leading: AssetManager.logout),
      ],
    );
  }
}
