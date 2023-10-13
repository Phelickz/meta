import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/forex_news/forex_news_view_model.dart';
import 'package:meta_trader/ui/widgets/forex_news/all.dart';
import 'package:meta_trader/ui/widgets/home/market_news.dart';
import 'package:shimmer/shimmer.dart';

class Metals extends StatelessWidget {
  const Metals({super.key, required this.model});
  final ForexNewsViewModel model;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    model.metalsNewsController.addListener(() {
      if (model.metalsNewsController.position.pixels ==
          model.metalsNewsController.position.maxScrollExtent) {
        model.fetchAllMetalNews(getMore: true);
      }
    });
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 5),
      ),
      child: ListView(
        controller: model.metalsNewsController,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceSmall(context),
          Text(
            '${LocaleKeys.trending.tr()}🔥',
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.8),
              fontWeight: FontWeight.bold,
              color: isDarkMode
                  ? ColorManager.darkText
                  : Theme.of(context).primaryColor,
            ),
          ).tr(),
          verticalSpaceXSmall(context),
          TrendingWidget(
            model: model,
          ),
          // SizedBox(
          //   width: double.infinity,
          //   height: McGyver.rsDoubleH(context, 14),
          //   child: ListView.separated(
          //     itemCount: 4,
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) {
          //       return ContainerColor.fromARGB(255, 139, 110, 110)       width: McGyver.rsDoubleW(context, 80),
          //         decoration: BoxDecoration(
          //           color: isDarkMode
          //               ? const Color(0xff0C95EF)
          //               : Theme.of(context).primaryColor,
          //           borderRadius: BorderRadius.circular(15),
          //         ),
          //         child: Padding(
          //           padding: const EdgeInsets.all(19.0),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Expanded(
          //                 child: Text(
          //                   'NZD/USD recovers following mixed NFPs from the US',
          //                   style: CustomThemeData.generateStyle(
          //                     fontSize: McGyver.textSize(context, 2.3),
          //                     fontWeight: FontWeight.w800,
          //                     color: isDarkMode ? Colors.white : Colors.white,
          //                   ),
          //                 ),
          //               ),
          //               Text(
          //                 'Aug 4, 2034 15:07 GMT',
          //                 style: CustomThemeData.generateStyle(
          //                   fontSize: McGyver.textSize(context, 1.5),
          //                   fontWeight: FontWeight.normal,
          //                   color: isDarkMode ? Colors.white : Colors.white,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       );
          //     },
          //     separatorBuilder: (context, index) {
          //       return horizontalSpaceSmall(context);
          //     },
          //   ),
          // ),
          verticalSpaceSmall(context),
          (model.allMetalNews == null || model.allMetalNews!.data == null)
              ? SizedBox(
                  height: 100,
                  width: 100,
                  child: Shimmer.fromColors(
                      enabled: (model.allMetalNews == null ||
                          model.allMetalNews!.data == null),
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.white,
                      child: Container(
                        color: Colors.red,
                      )),
                )
              : Column(
                  children: model.allMetalNews!.data!.map((e) {
                    return GestureDetector(
                        onTap: () {
                          model.setSelectedNews = e;
                          model.setForexNewsViewEnum =
                              ForexNewsViewEnum.details;
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          child: MarketNewsOriginal(
                            newsData: e,
                          ),
                        ));
                  }).toList(),
                ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       '#XAU',
          //       style: CustomThemeData.generateStyle(
          //         fontSize: McGyver.textSize(context, 2),
          //         fontWeight: FontWeight.bold,
          //         color: isDarkMode
          //             ? const Color(0xff98A2B3)
          //             : const Color(0xff475467),
          //       ),
          //     ),
          //     TextButton(
          //         onPressed: () {}, child: const Text(LocaleKeys.viewMore).tr())
          //   ],
          // ),
          // verticalSpaceXXSmall(context),
          // Column(
          //   children: [
          //     GestureDetector(
          //         onTap: () {
          //           model.setForexNewsViewEnum = ForexNewsViewEnum.details;
          //         },
          //         child: const MarketNews()),
          //     verticalSpaceSmall(context),
          //     GestureDetector(
          //         onTap: () {
          //           model.setForexNewsViewEnum = ForexNewsViewEnum.details;
          //         },
          //         child: const MarketNews()),
          //     verticalSpaceSmall(context),
          //     GestureDetector(
          //         onTap: () {
          //           model.setForexNewsViewEnum = ForexNewsViewEnum.details;
          //         },
          //         child: const MarketNews())
          //   ],
          // ),
          // // SizedBox(
          // //   height: McGyver.rsDoubleH(context, 33),
          // //   width: McGyver.rsDoubleW(context, 100),
          // //   child: ListView.separated(
          // //     physics: const NeverScrollableScrollPhysics(),
          // //     itemCount: 3,
          // //     itemBuilder: (context, index) {
          // //       return const MarketNews();
          // //     },
          // //     separatorBuilder: (BuildContext context, int index) {
          // //       return verticalSpaceSmall(context);
          // //     },
          // //   ),
          // // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       '#XRP',
          //       style: CustomThemeData.generateStyle(
          //         fontSize: McGyver.textSize(context, 2),
          //         fontWeight: FontWeight.bold,
          //         color: isDarkMode
          //             ? const Color(0xff98A2B3)
          //             : const Color(0xff475467),
          //       ),
          //     ),
          //     TextButton(
          //         onPressed: () {}, child: const Text(LocaleKeys.viewMore).tr())
          //   ],
          // ),
          // verticalSpaceXXSmall(context),
          // Column(
          //   children: [
          //     GestureDetector(
          //         onTap: () {
          //           model.setForexNewsViewEnum = ForexNewsViewEnum.details;
          //         },
          //         child: const MarketNews()),
          //     verticalSpaceSmall(context),
          //     GestureDetector(
          //         onTap: () {
          //           model.setForexNewsViewEnum = ForexNewsViewEnum.details;
          //         },
          //         child: const MarketNews()),
          //     verticalSpaceSmall(context),
          //     GestureDetector(
          //         onTap: () {
          //           model.setForexNewsViewEnum = ForexNewsViewEnum.details;
          //         },
          //         child: const MarketNews())
          //   ],
          // ),
          // // SizedBox(
          // //   height: McGyver.rsDoubleH(context, 33),
          // //   width: McGyver.rsDoubleW(context, 100),
          // //   child: ListView.separated(
          // //     physics: const NeverScrollableScrollPhysics(),
          // //     itemCount: 3,
          // //     itemBuilder: (context, index) {
          // //       return const MarketNews();
          // //     },
          // //     separatorBuilder: (BuildContext context, int index) {
          // //       return verticalSpaceSmall(context);
          // //     },
          // //   ),
          // // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       '#BTC',
          //       style: CustomThemeData.generateStyle(
          //         fontSize: McGyver.textSize(context, 2),
          //         fontWeight: FontWeight.bold,
          //         color: isDarkMode
          //             ? const Color(0xff98A2B3)
          //             : const Color(0xff475467),
          //       ),
          //     ),
          //     TextButton(
          //         onPressed: () {}, child: const Text(LocaleKeys.viewMore).tr())
          //   ],
          // ),
          // verticalSpaceXXSmall(context),
          // Column(
          //   children: [
          //     GestureDetector(
          //         onTap: () {
          //           model.setForexNewsViewEnum = ForexNewsViewEnum.details;
          //         },
          //         child: const MarketNews()),
          //     verticalSpaceSmall(context),
          //     GestureDetector(
          //         onTap: () {
          //           model.setForexNewsViewEnum = ForexNewsViewEnum.details;
          //         },
          //         child: const MarketNews()),
          //     verticalSpaceSmall(context),
          //     GestureDetector(
          //         onTap: () {
          //           model.setForexNewsViewEnum = ForexNewsViewEnum.details;
          //         },
          //         child: const MarketNews())
          //   ],
          // ),
          // verticalSpaceSmall(context),
          // // SizedBox(
          // //   height: McGyver.rsDoubleH(context, 33),
          // //   width: McGyver.rsDoubleW(context, 100),
          // //   child: ListView.separated(
          // //     physics: const NeverScrollableScrollPhysics(),
          // //     itemCount: 3,
          // //     itemBuilder: (context, index) {
          // //       return GestureDetector(
          // //           onTap: () {
          // //             model.setForexNewsViewEnum = ForexNewsViewEnum.details;
          // //           },
          // //           child: const MarketNews());
          // //     },
          // //     separatorBuilder: (BuildContext context, int index) {
          // //       return verticalSpaceSmall(context);
          // //     },
          // //   ),
          // // ),
        ],
      ),
    );
  }
}
