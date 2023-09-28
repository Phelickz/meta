import 'package:flutter/material.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/profile/components/circular_icon_button.dart';
import 'package:meta_trader/ui/widgets/profile/components/profile_tiles.dart';

import '../../../app/responsiveness/res.dart';
import '../../views/profile/profile_view_model.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key, required this.model}) : super(key: key);
  final ProfileViewModel model;

  @override
  Widget build(BuildContext context) {
    // var isDarkMode = CustomThemeData.isDarkMode(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                model.returnVerifiedBar(),
                InkWell(
                  onTap: () {},
                  child: Image.asset(AssetManager.referralImage),
                ),
                SizedBox(height: 32.pHeight(context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfileIconButton(
                      icon: AssetManager.manageAccountIcon,
                      title: LocaleKeys.manageAccount,
                      onTap: () {
                        model.push(const ManageAccountRoute());
                      },
                    ),
                    ProfileIconButton(
                      icon: AssetManager.referralsIcon,
                      title: LocaleKeys.logOut,
                      onTap: () {
                        model.push(const ReferralRoute());
                      },
                    ),
                    ProfileIconButton(
                      icon: AssetManager.tradeHistoryIcon,
                      title: LocaleKeys.tradeHistory,
                      onTap: () {
                        model.push(const TradeHistoryRoute());
                      },
                    ),
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
                      title: LocaleKeys.loyaltyReward,
                      onTap: () {
                        model.push(const LoyaltyRewardsRoute());
                      },
                    ),
                    ProfileIconButton(
                      icon: AssetManager.notificationsIcon,
                      title: LocaleKeys.notification,
                      onTap: () {
                        model.push(const NotificationRoute());
                      },
                    ),
                    ProfileIconButton(
                      icon: AssetManager.security,
                      title: LocaleKeys.security,
                      onTap: () {
                        model.push(const SecurityRoute());
                      },
                    ),
                  ],
                ),
                SizedBox(height: 32.pHeight(context)),
                ProfileTiles(
                  title: LocaleKeys.profile_profileWidget_viewYourWithD,
                  subTitle: LocaleKeys.profile_profileWidget_viewWithDrawalH,
                  leadingIcon: AssetManager.withdrawal,
                  trailingIcon: AssetManager.forwardArrow,
                  onTap: () {
                    model.push(const TransactionsRoute());
                  },
                ),
                ProfileTiles(
                  title: LocaleKeys.paymentMethod,
                  subTitle: LocaleKeys.profile_profileWidget_updatePaymentM,
                  leadingIcon: AssetManager.paymentMethod,
                  trailingIcon: AssetManager.forwardArrow,
                  onTap: () {
                    model.push(const PaymentMethodRoute());
                  },
                ),
                ProfileTiles(
                  title: LocaleKeys.helpAndSupport,
                  subTitle: LocaleKeys.profile_profileWidget_fileAComplaint,
                  leadingIcon: AssetManager.withdrawal,
                  trailingIcon: AssetManager.forwardArrow,
                  onTap: () {
                    model.push(const HelpAndSupportRoute());
                  },
                ),
                const ProfileTiles(
                  title: LocaleKeys.profile_profileWidget_rateTheApp,
                  subTitle: LocaleKeys.profile_profileWidget_giveUsAReview,
                  leadingIcon: AssetManager.rate,
                ),
                const ProfileTiles(
                  title: LocaleKeys.logOut,
                  subTitle: LocaleKeys.profile_profileWidget_viewWithDrawalH,
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
