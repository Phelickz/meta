import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/models/all_forex_news.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/app/utils/utils.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';
import '../../../generated/locale_keys.g.dart';

class MarketNews extends StatelessWidget {
  const MarketNews({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      LocaleKeys.decrypt,
                      style: CustomThemeData.generateStyle(
                        fontSize: 12,
                        color: isDarkMode ? Colors.white60 : Colors.black45,
                      ),
                    ).tr(),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: CircleAvatar(
                        radius: 2,
                      ),
                    ),
                    Text(
                      LocaleKeys.home_marketNewsWidget_hoursAgo,
                      style: CustomThemeData.generateStyle(
                        fontSize: 12,
                        color: isDarkMode ? Colors.white60 : Colors.black45,
                      ),
                    ).tr(),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: CircleAvatar(
                        radius: 2,
                      ),
                    ),
                    Text(
                      LocaleKeys.home_marketNewsWidget_usdCoin,
                      style: CustomThemeData.generateStyle(
                        fontSize: 12,
                        color: isDarkMode ? Colors.blue : Colors.blue,
                      ),
                    ).tr(),
                  ],
                ),
                verticalSpaceXSmall(context),
                Text(
                  LocaleKeys.home_marketNewsWidget_maimiCryptoAsp,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.4),
                    color: isDarkMode ? ColorManager.darkText : Colors.black45,
                  ),
                ).tr(),
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Container(
            height: McGyver.rsDoubleH(context, 8),
            width: McGyver.rsDoubleW(context, 18),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/images/news.png'),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MarketNewsOriginal extends StatelessWidget {
  final NewsData newsData;
  const MarketNewsOriginal({super.key, required this.newsData});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, // this is important to make the text align to the left
              children: [
                Row(
                  children: [
                    Utils.getTextWidget(
                      newsData.sourceName ?? '',
                      context,
                      style: CustomThemeData.generateStyle(
                        fontSize: 12,
                        color: isDarkMode ? Colors.white60 : Colors.black45,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: CircleAvatar(
                        radius: 2,
                      ),
                    ),
                    Utils.getTextWidget(
                      timeago.format(convertDate(newsData.date)),
                      context,
                      style: CustomThemeData.generateStyle(
                        fontSize: 12,
                        color: isDarkMode ? Colors.white60 : Colors.black45,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: CircleAvatar(
                        radius: 2,
                      ),
                    ),
                    Utils.getTextWidget(
                      newsData.currency != null && newsData.currency!.isNotEmpty
                          ? newsData.currency?.first ?? ''
                          : newsData.topics != null &&
                                  newsData.topics!.isNotEmpty
                              ? newsData.topics?.first ?? ''
                              : newsData.sentiment ?? '',
                      context,
                      style: CustomThemeData.generateStyle(
                        fontSize: 12,
                        color: isDarkMode ? Colors.blue : Colors.blue,
                      ),
                    ),
                  ],
                ),
                verticalSpaceXSmall(context),
                Utils.getTextWidget(
                  newsData.title ?? '',
                  context,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.4),
                    color: isDarkMode ? ColorManager.darkText : Colors.black45,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Container(
            height: McGyver.rsDoubleH(context, 8),
            width: McGyver.rsDoubleW(context, 18),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: McGyver.rsDoubleH(context, 8),
                width: McGyver.rsDoubleW(context, 18),
                imageUrl: newsData.imageUrl ?? '',
                placeholder: (context, url) => const Center(
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) =>
                    Image.asset('assets/images/news.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

convertDate(String? dateString) {
  if (dateString == null) {
    return DateTime.now();
  } else {
    String dateString = "Fri, 29 Sep 2023 03:00:16 -0400";

    // Define the date format
    DateFormat dateFormat = DateFormat('E, dd MMM yyyy HH:mm:ss Z');

    // Parse the date string
    DateTime dateTime = dateFormat.parse(dateString);

    return dateTime;
  }
}
