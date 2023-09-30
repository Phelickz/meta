import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/provider/provider_view_model.dart';
import 'package:meta_trader/ui/widgets/provider/components/provider_appbar.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';

@RoutePage()
class ProviderFollowerPage extends StatelessWidget {
  final ProviderViewModel viewModel;
  const ProviderFollowerPage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      isBusy: viewModel.isBusy,
      appBar: ProviderAppbar.simpleAppBar(
          viewModel,
          context,
          LocaleKeys.followers.tr(),
          LocaleKeys.views_providerView_viewYourFollowers.tr(),
          false,
          null),
      body: Column(
        children: [
          SizedBox(
            height: 27.pHeight(context),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.providerWidget_providerFollowers_followedRecently,
                style: CustomThemeData.generateColoredStyle(
                    fontSize: 16,
                    context: context,
                    fontWeight: FontWeight.w600,
                    lightTextColor: const Color(0xFF475467),
                    darkTextColor: const Color(0xFF98A2B3)),
              ).tr(),
              const Spacer(),
              // InkWell(
              //     onTap: () => showBottomSheet(
              //         context: context,
              //         builder: (_) {
              //           return Scaffold(
              //             body: ProviderModalBottomsheet.followerBottomSheet(
              //                 viewModel),
              //           );
              //         }),
              //     // ignore: deprecated_member_use
              //     child: SvgPicture.asset(
              //       AssetManager.filter,
              //       color: const Color(0xFF98A2B3),
              //       height: 20,
              //       width: 20,
              //     ))
            ],
          ),
          SizedBox(
            height: 4.pHeight(context),
          ),
          Expanded(
            child: ListView(
              children: [
                followerBar(viewModel.followersData),
                followerBar(viewModel.followersData),
                followerBar(viewModel.followersData),
                followerBar(viewModel.followersData),
                followerBar(viewModel.followersData),
                followerBar(viewModel.followersData),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget followerBar(Map<String, dynamic> followerDetail) {
    return Builder(builder: (context) {
      return Container(
        height: 68.pHeight(context),
        margin: EdgeInsets.only(top: 12.pHeight(context)),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: viewModel.isDarkMode()
                ? ColorManager.darkHeaderColor
                : Theme.of(context).scaffoldBackgroundColor,
            border: viewModel.isDarkMode()
                ? null
                : Border.all(color: const Color(0xFFE4E7EC)),
            borderRadius: BorderRadius.circular(8)),
        width: double.infinity,
        child: Row(
          children: [
            SvgPicture.asset(AssetManager.blankProfile,
                height: 44.pHeight(context), width: 44.pWidth(context)),
            SizedBox(
              width: 6.pWidth(context),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  followerDetail["name"],
                  style: CustomThemeData.generateColoredStyle(
                      fontSize: 14,
                      context: context,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  LocaleKeys.providerWidget_providerFollowers_startedFollowing,
                  style: CustomThemeData.generateColoredStyle(
                      fontSize: 12,
                      context: context,
                      fontWeight: FontWeight.w400),
                ).tr(args: [' ${followerDetail["date"]}']),
                SizedBox(
                  height: 4.pHeight(context),
                )
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  LocaleKeys.location,
                  style: CustomThemeData.generateColoredStyle(
                      fontSize: 12,
                      context: context,
                      fontWeight: FontWeight.w400),
                ).tr(),
                Text(
                  followerDetail["location"],
                  style: CustomThemeData.generateColoredStyle(
                      fontSize: 12,
                      context: context,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
