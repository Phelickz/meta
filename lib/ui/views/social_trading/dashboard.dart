import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

import '../../../app/responsiveness/res.dart';

@RoutePage()
class SocialTradingDasboard extends StackedView<SocialTradingViewModel> {
  const SocialTradingDasboard({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    SocialTradingViewModel viewModel,
    Widget? child,
  ) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
      isBusy: viewModel.isBusy,
      bodyPadding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 0),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: isDarkMode
            ? const Color(0xff052844)
            : Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () {
            viewModel.goBack();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          )
        ],
        title: Container(
          width: 210,
          height: 46,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(60),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: viewModel.socialTradingDasboardEnum ==
                          SocialTradingDasboardEnum.masterTraders
                      ? ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        )
                      : null,
                  onPressed: () {
                    viewModel.setSocialTradingDashboardEnum =
                        SocialTradingDasboardEnum.masterTraders;
                  },
                  child: Text(
                    'Master Traders',
                    style: CustomThemeData.generateStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  style: viewModel.socialTradingDasboardEnum ==
                          SocialTradingDasboardEnum.myTrades
                      ? ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        )
                      : null,
                  onPressed: () {
                    viewModel.setSocialTradingDashboardEnum =
                        SocialTradingDasboardEnum.myTrades;
                  },
                  child: Text(
                    'My Trades',
                    style: CustomThemeData.generateStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: viewModel.returnPage(context),
    );
  }

  @override
  SocialTradingViewModel viewModelBuilder(BuildContext context) =>
      SocialTradingViewModel();
}
