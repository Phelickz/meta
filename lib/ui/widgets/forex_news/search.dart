import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/app/utils/utils.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/forex_news/forex_news_view_model.dart';
import 'package:meta_trader/ui/widgets/home/market_news.dart';

class Search extends StatelessWidget {
  const Search({super.key, required this.model});
  final ForexNewsViewModel model;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: McGyver.rsDoubleW(context, 5),
        ),
        child: Column(
          children: [
            verticalSpaceSmall(context),
            Expanded(
              child: TextField(
                style: CustomThemeData.generateStyle(
                  fontSize: 16,
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                controller: model.brokerSearchController,
                onChanged: (String? value) {
                  if ((value ?? '').isNotEmpty) {
                    model.setTyping = true;
                  } else {
                    model.setTyping = false;
                  }
                  model.setSearchText = value;
                  if (value != null && value.length > 2) {
                    model.fetchAllSearchNews(value);
                  }
                },
                decoration: InputDecoration(
                  hintText: LocaleKeys.search.tr(),
                  hintStyle: CustomThemeData.generateStyle(
                    fontSize: 15,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: model.isTyping
                      ? UnconstrainedBox(
                          child: GestureDetector(
                            onTap: () {
                              model.brokerSearchController.clear();
                              model.setTyping = false;
                            },
                            child: SvgPicture.asset(
                              'assets/images/close-square.svg',
                              height: 25,
                              width: 25,
                              // ignore: deprecated_member_use
                              color: Theme.of(context).secondaryHeaderColor,
                            ),
                          ),
                        )
                      : Icon(
                          Icons.search,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                ),
              ),
            ),
            Expanded(
              flex: 11,
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceSmall(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.forexNewsWidget_searchWidget_searchResult,
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 2),
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? const Color(0xff98A2B3)
                              : const Color(0xff475467),
                        ),
                      ).tr(),
                    ],
                  ),
                  verticalSpaceXXSmall(context),
                  (model.searchForexNews == null ||
                          model.searchForexNews!.data == null)
                      ? Container()
                      : (model.searchForexNews == null ||
                                  model.searchForexNews!.data == null) &&
                              (model.searchText ?? "").isNotEmpty
                          ? SizedBox(
                              height: 100,
                              width: 100,
                              child: Utils.showShimmer(
                                enabled: (model.searchForexNews == null ||
                                    model.searchForexNews!.data == null),
                                context: context,
                              ),
                            )
                          : Column(
                              children:
                                  model.searchForexNews!.data!.take(3).map((e) {
                                return GestureDetector(
                                    onTap: () {
                                      model.setSelectedNews = e;
                                      model.setForexNewsViewEnum =
                                          ForexNewsViewEnum.details;
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 3.0),
                                      child: MarketNewsOriginal(
                                        newsData: e,
                                      ),
                                    ));
                              }).toList(),
                            ),
                  // SizedBox(
                  //   height: McGyver.rsDoubleH(context, 33),
                  //   width: McGyver.rsDoubleW(context, 100),
                  //   child: ListView.separated(
                  //     physics: const NeverScrollableScrollPhysics(),
                  //     itemCount: 3,
                  //     itemBuilder: (context, index) {
                  //       return const MarketNews();
                  //     },
                  //     separatorBuilder: (BuildContext context, int index) {
                  //       return verticalSpaceSmall(context);
                  //     },
                  //   ),
                  // ),
                  verticalSpaceMedium(context),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       LocaleKeys.forexNewsWidget_searchWidget_moreResult,
                  //       style: CustomThemeData.generateStyle(
                  //         fontSize: McGyver.textSize(context, 2),
                  //         fontWeight: FontWeight.bold,
                  //         color: isDarkMode
                  //             ? const Color(0xff98A2B3)
                  //             : const Color(0xff475467),
                  //       ),
                  //     ).tr(),
                  //   ],
                  // ),
                  // verticalSpaceXXSmall(context),
                  // Column(
                  //   children: [
                  //     GestureDetector(
                  //         onTap: () {
                  //           model.setForexNewsViewEnum =
                  //               ForexNewsViewEnum.details;
                  //         },
                  //         child: const MarketNews()),
                  //     verticalSpaceSmall(context),
                  //     GestureDetector(
                  //         onTap: () {
                  //           model.setForexNewsViewEnum =
                  //               ForexNewsViewEnum.details;
                  //         },
                  //         child: const MarketNews()),
                  //     verticalSpaceSmall(context),
                  //     GestureDetector(
                  //         onTap: () {
                  //           model.setForexNewsViewEnum =
                  //               ForexNewsViewEnum.details;
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
                  // //       return const MarketNews();
                  // //     },
                  // //     separatorBuilder: (BuildContext context, int index) {
                  // //       return verticalSpaceSmall(context);
                  // //     },
                  // //   ),
                  // // ),
                ],
              ),
            ),
          ],
        ));
  }
}
