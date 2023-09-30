import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/theme.dart';

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
