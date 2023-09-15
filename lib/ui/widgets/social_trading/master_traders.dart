import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';
import 'package:meta_trader/ui/widgets/home/higher_success_rates.dart';

class MasterTraders extends StatelessWidget {
  const MasterTraders({super.key, required this.model});
  final SocialTradingViewModel model;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 5),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpaceSmall(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Traders',
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 2),
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? const Color(0xff98A2B3)
                        : const Color(0xff475467),
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text('View more'))
              ],
            ),
            verticalSpaceXSmall(context),
            Column(
              children: [
                GestureDetector(onTap: () {
                  model.push(MasterTraderOverview(model: model));
                }, child: HigherSuccessRates(
                  copyOnTap: () {
                    model.push(MasterTraderOverview(model: model));
                  },
                )),
                verticalSpaceSmall(context),
                GestureDetector(onTap: () {
                  model.push(MasterTraderOverview(model: model));
                }, child: HigherSuccessRates(
                  copyOnTap: () {
                    model.push(MasterTraderOverview(model: model));
                  },
                )),
                verticalSpaceSmall(context),
                GestureDetector(onTap: () {
                  model.push(MasterTraderOverview(model: model));
                }, child: HigherSuccessRates(
                  copyOnTap: () {
                    model.push(MasterTraderOverview(model: model));
                  },
                )),
              ],
            ),
            verticalSpaceSmall(context),
            // SizedBox(
            //   height: McGyver.rsDoubleH(context, 50),
            //   width: McGyver.rsDoubleW(context, 100),
            //   child: ListView.separated(
            //     physics: const NeverScrollableScrollPhysics(),
            //     itemCount: 3,
            //     itemBuilder: (context, index) {
            //       return GestureDetector(onTap: () {
            //         model.push(MasterTraderOverview(model: model));
            //       }, child: HigherSuccessRates(
            //         copyOnTap: () {
            //           model.push(MasterTraderOverview(model: model));
            //         },
            //       ));
            //     },
            //     separatorBuilder: (BuildContext context, int index) {
            //       return verticalSpaceXSmall(context);
            //     },
            //   ),
            // ),
            // verticalSpaceSmall(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Higher Success Rates',
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 2),
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? const Color(0xff98A2B3)
                        : const Color(0xff475467),
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text('View more'))
              ],
            ),
            verticalSpaceXSmall(context),
            // verticalSpaceSmall(context),
            // SizedBox(
            //   height: McGyver.rsDoubleH(context, 50),
            //   width: McGyver.rsDoubleW(context, 100),
            //   child: ListView.separated(
            //     physics: const NeverScrollableScrollPhysics(),
            //     itemCount: 3,
            //     itemBuilder: (context, index) {
            //       return const HigherSuccessRates();
            //     },
            //     separatorBuilder: (BuildContext context, int index) {
            //       return verticalSpaceXSmall(context);
            //     },
            //   ),
            // ),
            Column(
              children: [
                GestureDetector(onTap: () {
                  model.push(MasterTraderOverview(model: model));
                }, child: HigherSuccessRates(
                  copyOnTap: () {
                    model.push(MasterTraderOverview(model: model));
                  },
                )),
                verticalSpaceSmall(context),
                GestureDetector(onTap: () {
                  model.push(MasterTraderOverview(model: model));
                }, child: HigherSuccessRates(
                  copyOnTap: () {
                    model.push(MasterTraderOverview(model: model));
                  },
                )),
                verticalSpaceSmall(context),
                GestureDetector(onTap: () {
                  model.push(MasterTraderOverview(model: model));
                }, child: HigherSuccessRates(
                  copyOnTap: () {
                    model.push(MasterTraderOverview(model: model));
                  },
                )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Low Commissions',
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 2),
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? const Color(0xff98A2B3)
                        : const Color(0xff475467),
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text('View more'))
              ],
            ),
            verticalSpaceXSmall(context),
            Column(
              children: [
                GestureDetector(onTap: () {
                  model.push(MasterTraderOverview(model: model));
                }, child: HigherSuccessRates(
                  copyOnTap: () {
                    model.push(MasterTraderOverview(model: model));
                  },
                )),
                verticalSpaceSmall(context),
                GestureDetector(onTap: () {
                  model.push(MasterTraderOverview(model: model));
                }, child: HigherSuccessRates(
                  copyOnTap: () {
                    model.push(MasterTraderOverview(model: model));
                  },
                )),
                verticalSpaceSmall(context),
                GestureDetector(onTap: () {
                  model.push(MasterTraderOverview(model: model));
                }, child: HigherSuccessRates(
                  copyOnTap: () {
                    model.push(MasterTraderOverview(model: model));
                  },
                )),
              ],
            ),
            // SizedBox(
            //   height: McGyver.rsDoubleH(context, 50),
            //   width: McGyver.rsDoubleW(context, 100),
            //   child: ListView.separated(
            //     physics: const NeverScrollableScrollPhysics(),
            //     itemCount: 3,
            //     itemBuilder: (context, index) {
            //       return const HigherSuccessRates();
            //     },
            //     separatorBuilder: (BuildContext context, int index) {
            //       return verticalSpaceXSmall(context);
            //     },
            //   ),
            // ),
            verticalSpaceMedium(context),
          ],
        ),
      ),
    );
  }
}
