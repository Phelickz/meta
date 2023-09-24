import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/forex_news/forex_news_view_model.dart';

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
        child: Column(
          children: [
            verticalSpaceSmall(context),
            Text(
              'NZD/USD ${LocaleKeys.forexNewsWidget_allWidget_text.tr()}',
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
                Text(
                  LocaleKeys.forexNewsWidget_allWidget_text2.tr(),
                  style: CustomThemeData.generateStyle(
                    fontSize: 11,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color:
                        isDarkMode ? const Color(0xff344054) : Colors.black12,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      LocaleKeys.forexNewsWidget_detailsWidget_coinTelegraph
                          .tr(),
                      style: CustomThemeData.generateStyle(
                        fontSize: 10,
                        color: isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            verticalSpaceSmall(context),
            Container(
              width: double.infinity,
              height: McGyver.rsDoubleH(context, 20),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage('assets/images/news.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            verticalSpaceMedium(context),
            Text(
              '''${LocaleKeys.forexNewsWidget_detailsWidget_text.tr()},
              ${LocaleKeys.forexNewsWidget_detailsWidget_text1.tr()} 
              ${LocaleKeys.forexNewsWidget_detailsWidget_text2.tr()} 
              ${LocaleKeys.forexNewsWidget_detailsWidget_text3.tr()} 
              ${LocaleKeys.forexNewsWidget_detailsWidget_text4.tr()} 
              ${LocaleKeys.forexNewsWidget_detailsWidget_text5.tr()} 
              ${LocaleKeys.forexNewsWidget_detailsWidget_text6.tr()} 
              ${LocaleKeys.forexNewsWidget_detailsWidget_text7.tr()} 
              ${LocaleKeys.forexNewsWidget_detailsWidget_text8.tr()} ''',
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.5),
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
            verticalSpaceMedium(context)
          ],
        ),
      ),
    );
  }
}
