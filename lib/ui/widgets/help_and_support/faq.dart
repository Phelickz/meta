import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/ui/views/help_and_support/help_and_support_view_model.dart';
import 'package:meta_trader/ui/widgets/help_and_support/components/faq_container.dart';

import '../../../app/responsiveness/res.dart';
import '../../../generated/locale_keys.g.dart';

class FAQPage extends StatelessWidget {
  final HelpAndSupportViewModel model;

  const FAQPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: McGyver.rsDoubleW(context, 6)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceSmall(context),
          Text(
            LocaleKeys.helpAndSupport_faqWidget_ourFaq,
            style: Theme.of(context).textTheme.bodyLarge,
          ).tr(),
          SizedBox(height: 16.pHeight(context)),
          Expanded(
            child: ListView.builder(
              itemCount: model.faqs.length,
              itemBuilder: (context, index) {
                return FAQContainer(
                    faqQuestion: model.faqs[index]["question"],
                    answer: model.faqs[index]["answer"]);
              },
            ),
          )
        ],
      ),
    );
  }
}
