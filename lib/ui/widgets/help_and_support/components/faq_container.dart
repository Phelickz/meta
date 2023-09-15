import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';

class FAQContainer extends StatelessWidget {
  final String faqQuestion;
  final String answer;
  const FAQContainer(
      {Key? key, required this.faqQuestion, required this.answer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            faqQuestion,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: McGyver.textSize(context, 2),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode
                      ? ColorManager.darkText
                      : ColorManager.lightText,
                ),
          ),
          SizedBox(
            height: 2.pHeight(context),
          ),
          Text(
            answer,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: McGyver.textSize(context, 1.6),
                  color: isDarkMode
                      ? ColorManager.darkText
                      : ColorManager.lightText,
                ),
          ),
          SizedBox(
            height: 16.pHeight(context),
          ),
        ],
      ),
    );
  }
}
