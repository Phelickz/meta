import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/theme.dart';

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
                      'Decrypt',
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
                    Text(
                      '18 hours ago',
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
                    Text(
                      'USD Coin',
                      style: CustomThemeData.generateStyle(
                        fontSize: 12,
                        color: isDarkMode ? Colors.blue : Colors.blue,
                      ),
                    ),
                  ],
                ),
                verticalSpaceXSmall(context),
                Text(
                  'Maimi Crypto Aspirations Boosted by Borderless Capital\'s \$25 Million Fund Lorem Ipsum',
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
