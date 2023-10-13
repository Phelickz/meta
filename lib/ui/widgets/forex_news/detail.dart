import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/app/utils/utils.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/forex_news/forex_news_view_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';
import '../home/market_news.dart';

class DetailNews extends StatelessWidget {
  const DetailNews({super.key, required this.model});
  final ForexNewsViewModel model;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 5),
      ),
      child: SingleChildScrollView(
        child: model.selectedNews == null
            ? Container()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceSmall(context),
                  Utils.getTextWidget(
                    model.selectedNews?.title ?? '',
                    context,
                    // toLang: context.locale.toString().toLowerCase(),
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 2.3),
                      fontWeight: FontWeight.w800,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  verticalSpaceSmall(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Utils.getTextWidget(
                        timeago.format(convertDate(model.selectedNews?.date)),
                        context,
                        // toLang: context.locale.toString().toLowerCase(),
                        style: CustomThemeData.generateStyle(
                          fontSize: 11,
                          color: isDarkMode ? Colors.white : Colors.black87,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: isDarkMode
                              ? const Color(0xff344054)
                              : Colors.black12,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Utils.getTextWidget(
                            model.selectedNews?.sourceName ?? '',
                            context,
                            // toLang: context.locale.toString().toLowerCase(),
                            style: CustomThemeData.generateStyle(
                              fontSize: 10,
                              color: isDarkMode ? Colors.white : Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (model.selectedNews?.newsUrl != null) ...[
                    verticalSpaceSmall(context),
                    Container(
                      width: double.infinity,
                      height: McGyver.rsDoubleH(context, 20),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15),
                        // image: const DecorationImage(
                        //   image: AssetImage('assets/images/news.png'),
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          height: McGyver.rsDoubleH(context, 8),
                          width: McGyver.rsDoubleW(context, 18),
                          imageUrl: model.selectedNews?.imageUrl ?? '',
                          placeholder: (context, url) => const Center(
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) => Image.asset(
                            'assets/images/news.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    verticalSpaceSmall(context),
                  ],
                  verticalSpaceSmall(context),
                  Utils.getTextWidget(
                    model.selectedNews?.text ?? '',
                    context,
                    // toLang: context.locale.toString().toLowerCase(),
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.7),
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                  verticalSpaceXSmall(context),
                  if (model.selectedNews?.newsUrl != null) ...[
                    GestureDetector(
                      onTap: () async {
                        await launchUrl(
                            Uri.parse(model.selectedNews!.newsUrl!));
                      },
                      child: Text(
                        LocaleKeys.viewMore.tr(),
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 1.7),
                          color: Theme.of(context).primaryColor,
                        ),
                      ).tr(),
                    ),
                  ],
                  verticalSpaceMedium(context)
                ],
              ),
      ),
    );
  }
}
