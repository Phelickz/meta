import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/ui/widgets/profile/components/circular_icon_button.dart';
import 'package:meta_trader/ui/widgets/profile/components/profile_tiles.dart';
import 'package:meta_trader/ui/widgets/profile/profile_bar.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/utils/theme.dart';
import '../../views/profile/profile_view_model.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key, required this.model}) : super(key: key);
  final ProfileViewModel model;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileBar(),
          SizedBox(
            height: 12.pHeight(context),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: McGyver.rsDoubleW(context, 6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(AssetManager.referralImage),
                ),
                SizedBox(height: 32.pHeight(context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfileIconButton(
                        icon: AssetManager.manageAccountIcon,
                        title: "Manage Account"),
                    ProfileIconButton(
                        icon: AssetManager.referralsIcon, title: "Referrals"),
                    ProfileIconButton(
                        icon: AssetManager.tradeHistoryIcon,
                        title: "Trade History"),
                  ],
                ),
                SizedBox(
                  height: 12.pHeight(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfileIconButton(
                        icon: AssetManager.loyaltyRewards,
                        title: "Loyalty Rewards"),
                    ProfileIconButton(
                        icon: AssetManager.notificationsIcon,
                        title: "Notifications"),
                    ProfileIconButton(
                        icon: AssetManager.security, title: "Security"),
                  ],
                ),
                SizedBox(height: 32.pHeight(context)),
                ProfileTiles(
                  title: "Withdrawal/Deposit History",
                  subTitle: "view your withdrawal and deposit history",
                  leadingIcon: AssetManager.withdrawal,
                  trailingIcon: AssetManager.forwardArrow,
                ),
                ProfileTiles(
                  title: "Payment Methods",
                  subTitle: "update payment methods",
                  leadingIcon: AssetManager.paymentMethod,
                  trailingIcon: AssetManager.forwardArrow,
                ),
                ProfileTiles(
                  title: "Help and Support",
                  subTitle: "file a complaint with our team",
                  leadingIcon: AssetManager.withdrawal,
                  trailingIcon: AssetManager.forwardArrow,
                ),
                ProfileTiles(
                  title: "Rate the app",
                  subTitle: "give us a review on appstore",
                  leadingIcon: AssetManager.rate,
                ),
                ProfileTiles(
                  title: "Logout",
                  subTitle: "view your withdrawal and deposit history",
                  leadingIcon: AssetManager.logout,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
