import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/models/all_forex_news.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/app/utils/utils.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/forex_news/forex_news_view_model.dart';
import 'package:meta_trader/ui/widgets/home/market_news.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeago/timeago.dart' as timeago;

class ForexNewsAll extends StatelessWidget {
  const ForexNewsAll({super.key, required this.model});
  final ForexNewsViewModel model;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 5),
      ),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceSmall(context),
          Text(
            '${LocaleKeys.trending.tr()}🔥',
            style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.8),
                fontWeight: FontWeight.bold,
                color: isDarkMode ? ColorManager.darkText : Colors.black),
          ).tr(),
          verticalSpaceXSmall(context),
          TrendingWidget(
            model: model,
          ),
          verticalSpaceSmall(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.currencyPair,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode
                      ? const Color(0xff98A2B3)
                      : const Color(0xff475467),
                ),
              ).tr(),
              TextButton(
                onPressed: () {
                  model.key.currentState?.animateTo(1);
                },
                child: const Text(
                  LocaleKeys.viewMore,
                ).tr(),
              )
            ],
          ),
          verticalSpaceXXSmall(context),
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
                  children: model.allCurrencyPairNews!.data!.take(3).map((e) {
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
          verticalSpaceXSmall(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.metals,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode
                      ? const Color(0xff98A2B3)
                      : const Color(0xff475467),
                ),
              ).tr(),
              TextButton(
                onPressed: () {
                  model.key.currentState?.animateTo(2);
                },
                child: const Text(
                  LocaleKeys.viewMore,
                ).tr(),
              )
            ],
          ),
          verticalSpaceXXSmall(context),
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
                  children: model.allMetalNews!.data!.take(3).map((e) {
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
          verticalSpaceXSmall(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.cryptoNews,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode
                      ? const Color(0xff98A2B3)
                      : const Color(0xff475467),
                ),
              ).tr(),
              TextButton(
                onPressed: () {
                  model.key.currentState?.animateTo(3);
                },
                child: const Text(
                  LocaleKeys.viewMore,
                ).tr(),
              )
            ],
          ),
          verticalSpaceXXSmall(context),
          (model.allForexNews == null || model.allForexNews!.data == null)
              ? SizedBox(
                  height: 100,
                  width: 100,
                  child: Shimmer.fromColors(
                      enabled: (model.allForexNews == null ||
                          model.allForexNews!.data == null),
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.white,
                      child: Container(
                        color: Colors.red,
                      )),
                )
              : Column(
                  children: model.allForexNews!.data!.take(3).map((e) {
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
          verticalSpaceSmall(context),
        ],
      ),
    );
  }
}

class TrendingWidget extends StatelessWidget {
  const TrendingWidget({super.key, required this.model});
  final ForexNewsViewModel model;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: (model.trendingHeadline == null ||
              model.trendingHeadline!.data == null)
          ? SizedBox(
              height: 100,
              width: 400,
              child: Shimmer.fromColors(
                  enabled: (model.trendingHeadline == null ||
                      model.trendingHeadline!.data == null),
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.white,
                  child: Container(
                    color: Colors.red,
                  )),
            )
          : Row(
              children: model.trendingHeadline!.data!
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          model.setSelectedNews = NewsData(
                            title: e.headline,
                            date: e.date,
                            sourceName: (e.newsId ?? '').toString(),
                            text: e.text,
                            currency: [],
                          );
                          model.setForexNewsViewEnum =
                              ForexNewsViewEnum.details;
                        },
                        child: Container(
                          width: McGyver.rsDoubleW(context, 80),
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? const Color(0xff0C95EF)
                                : Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(19.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Utils.getTextWidget(
                                  e.headline ?? '',
                                  context,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomThemeData.generateStyle(
                                    fontSize: McGyver.textSize(context, 2.3),
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                  ),
                                ),
                                verticalSpaceXSmall(context),
                                Utils.getTextWidget(
                                  timeago.format(convertDate(e.date)),
                                  context,
                                  style: CustomThemeData.generateStyle(
                                    fontSize: McGyver.textSize(context, 1.5),
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList()),
    );
  }
}
