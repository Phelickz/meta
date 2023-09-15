import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/forex_news/forex_news_view_model.dart';
import 'package:meta_trader/ui/widgets/home/market_news.dart';

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
            'Trending 🔥',
            style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.8),
                fontWeight: FontWeight.bold,
                color: isDarkMode ? ColorManager.darkText : Colors.black),
          ),
          verticalSpaceXSmall(context),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    model.setForexNewsViewEnum = ForexNewsViewEnum.details;
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
                          Text(
                            'NZD/USD recovers following mixed NFPs from the US',
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 2.3),
                              fontWeight: FontWeight.w800,
                              color: isDarkMode ? Colors.white : Colors.white,
                            ),
                          ),
                          Text(
                            'Aug 4, 2034 15:07 GMT',
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.5),
                              fontWeight: FontWeight.normal,
                              color: isDarkMode ? Colors.white : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                horizontalSpaceSmall(context),
                GestureDetector(
                  onTap: () {
                    model.setForexNewsViewEnum = ForexNewsViewEnum.details;
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
                          Text(
                            'NZD/USD recovers following mixed NFPs from the US',
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 2.3),
                              fontWeight: FontWeight.w800,
                              color: isDarkMode ? Colors.white : Colors.white,
                            ),
                          ),
                          Text(
                            'Aug 4, 2034 15:07 GMT',
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.5),
                              fontWeight: FontWeight.normal,
                              color: isDarkMode ? Colors.white : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                horizontalSpaceSmall(context),
                GestureDetector(
                  onTap: () {
                    model.setForexNewsViewEnum = ForexNewsViewEnum.details;
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
                          Text(
                            'NZD/USD recovers following mixed NFPs from the US',
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 2.3),
                              fontWeight: FontWeight.w800,
                              color: isDarkMode ? Colors.white : Colors.white,
                            ),
                          ),
                          Text(
                            'Aug 4, 2034 15:07 GMT',
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.5),
                              fontWeight: FontWeight.normal,
                              color: isDarkMode ? Colors.white : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(
          //   width: double.infinity,
          //   // height: McGyver.rsDoubleH(context, 14),
          //   child: ListView.separated(
          //     itemCount: 4,
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) {
          //       return GestureDetector(
          //         onTap: () {
          //           model.setForexNewsViewEnum = ForexNewsViewEnum.details;
          //         },
          //         child: Container(
          //           width: McGyver.rsDoubleW(context, 80),
          //           decoration: BoxDecoration(
          //             color: isDarkMode
          //                 ? const Color(0xff0C95EF)
          //                 : Theme.of(context).primaryColor,
          //             borderRadius: BorderRadius.circular(15),
          //           ),
          //           child: Padding(
          //             padding: const EdgeInsets.all(19.0),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Expanded(
          //                   child: Text(
          //                     'NZD/USD recovers following mixed NFPs from the US',
          //                     style: CustomThemeData.generateStyle(
          //                       fontSize: McGyver.textSize(context, 2.3),
          //                       fontWeight: FontWeight.w800,
          //                       color: isDarkMode ? Colors.white : Colors.white,
          //                     ),
          //                   ),
          //                 ),
          //                 Text(
          //                   'Aug 4, 2034 15:07 GMT',
          //                   style: CustomThemeData.generateStyle(
          //                     fontSize: McGyver.textSize(context, 1.5),
          //                     fontWeight: FontWeight.normal,
          //                     color: isDarkMode ? Colors.white : Colors.white,
          //                   ),
          //                 ),
          //               ],
          //             ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Currency pairs',
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
          verticalSpaceXXSmall(context),
          Column(
            children: [
              GestureDetector(
                  onTap: () {
                    model.setForexNewsViewEnum = ForexNewsViewEnum.details;
                  },
                  child: const MarketNews()),
              verticalSpaceSmall(context),
              GestureDetector(
                  onTap: () {
                    model.setForexNewsViewEnum = ForexNewsViewEnum.details;
                  },
                  child: const MarketNews()),
              verticalSpaceSmall(context),
              GestureDetector(
                  onTap: () {
                    model.setForexNewsViewEnum = ForexNewsViewEnum.details;
                  },
                  child: const MarketNews())
            ],
          ),
          // SizedBox(
          //   height: McGyver.rsDoubleH(context, 33),
          //   width: McGyver.rsDoubleW(context, 100),
          //   child: ListView.separated(
          //     physics: const NeverScrollableScrollPhysics(),
          //     itemCount: 3,
          //     itemBuilder: (context, index) {
          //       return GestureDetector(
          //           onTap: () {
          //             model.setForexNewsViewEnum = ForexNewsViewEnum.details;
          //           },
          //           child: const MarketNews());
          //     },
          //     separatorBuilder: (BuildContext context, int index) {
          //       return verticalSpaceSmall(context);
          //     },
          //   ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Metals',
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
          verticalSpaceXXSmall(context),
          Column(
            children: [
              GestureDetector(
                  onTap: () {
                    model.setForexNewsViewEnum = ForexNewsViewEnum.details;
                  },
                  child: const MarketNews()),
              verticalSpaceSmall(context),
              GestureDetector(
                  onTap: () {
                    model.setForexNewsViewEnum = ForexNewsViewEnum.details;
                  },
                  child: const MarketNews()),
              verticalSpaceSmall(context),
              GestureDetector(
                  onTap: () {
                    model.setForexNewsViewEnum = ForexNewsViewEnum.details;
                  },
                  child: const MarketNews())
            ],
          ),
          // SizedBox(
          //   height: McGyver.rsDoubleH(context, 33),
          //   width: McGyver.rsDoubleW(context, 100),
          //   child: ListView.separated(
          //     physics: const NeverScrollableScrollPhysics(),
          //     itemCount: 3,
          //     itemBuilder: (context, index) {
          //       return GestureDetector(
          //           onTap: () {
          //             model.setForexNewsViewEnum = ForexNewsViewEnum.details;
          //           },
          //           child: const MarketNews());
          //     },
          //     separatorBuilder: (BuildContext context, int index) {
          //       return verticalSpaceSmall(context);
          //     },
          //   ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Crypto News',
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
          verticalSpaceXXSmall(context),
          Column(
            children: [
              GestureDetector(
                  onTap: () {
                    model.setForexNewsViewEnum = ForexNewsViewEnum.details;
                  },
                  child: const MarketNews()),
              verticalSpaceSmall(context),
              GestureDetector(
                  onTap: () {
                    model.setForexNewsViewEnum = ForexNewsViewEnum.details;
                  },
                  child: const MarketNews()),
              verticalSpaceSmall(context),
              GestureDetector(
                  onTap: () {
                    model.setForexNewsViewEnum = ForexNewsViewEnum.details;
                  },
                  child: const MarketNews())
            ],
          ),
          verticalSpaceSmall(context),
          // SizedBox(
          //   height: McGyver.rsDoubleH(context, 33),
          //   width: McGyver.rsDoubleW(context, 100),
          //   child: ListView.separated(
          //     physics: const NeverScrollableScrollPhysics(),
          //     itemCount: 3,
          //     itemBuilder: (context, index) {
          //       return GestureDetector(
          //           onTap: () {
          //             model.setForexNewsViewEnum = ForexNewsViewEnum.details;
          //           },
          //           child: const MarketNews());
          //     },
          //     separatorBuilder: (BuildContext context, int index) {
          //       return verticalSpaceSmall(context);
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
