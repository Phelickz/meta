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

class CurrencyPairs extends StatelessWidget {
  const CurrencyPairs({super.key, required this.model});
  final ForexNewsViewModel model;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    model.currencyPairController.addListener(() {
      if (model.currencyPairController.position.pixels ==
          model.currencyPairController.position.maxScrollExtent) {
        model.fetchAllCurrencyPairNews(getMore: true);
      }
    });
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 5),
      ),
      child: ListView(
        controller: model.currencyPairController,
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
          verticalSpaceSmall(context),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       '#USD',
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
          (model.allCurrencyPairNews == null ||
                  model.allCurrencyPairNews!.data == null)
              ? SizedBox(
                  height: 100,
                  width: 100,
                  child: Shimmer.fromColors(
                      enabled: (model.allCurrencyPairNews == null ||
                          model.allCurrencyPairNews!.data == null),
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.white,
                      child: Container(
                        color: Colors.red,
                      )),
                )
              : Column(
                  children: model.allCurrencyPairNews!.data!.map((e) {
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
          // //       return GestureDetector(
          // //         onTap: () {
          // //           model.setForexNewsViewEnum = ForexNewsViewEnum.details;
          // //         },
          // //         child: const MarketNews(),
          // //       );
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
          //       '#NZDJPY',
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
          // //       return GestureDetector(
          // //         onTap: () {
          // //           model.setForexNewsViewEnum = ForexNewsViewEnum.details;
          // //         },
          // //         child: const MarketNews(),
          // //       );
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
          //       '#NZDJPY',
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
          // verticalSpaceSmall(context)
          // // SizedBox(
          // //   height: McGyver.rsDoubleH(context, 33),
          // //   width: McGyver.rsDoubleW(context, 100),
          // //   child: ListView.separated(
          // //     physics: const NeverScrollableScrollPhysics(),
          // //     itemCount: 3,
          // //     itemBuilder: (context, index) {
          // //       return GestureDetector(
          // //         onTap: () {
          // //           model.setForexNewsViewEnum = ForexNewsViewEnum.details;
          // //         },
          // //         child: const MarketNews(),
          // //       );
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
