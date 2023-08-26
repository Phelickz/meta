import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/ui/views/help_and_support/help_and_support_view_model.dart';
import 'package:meta_trader/ui/widgets/help_and_support/components/faq_container.dart';

import '../../../app/responsiveness/res.dart';

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
          Text(
            "Our FAQs,",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 16.pHeight(context)),
          Expanded(
            child: ListView.builder(
                itemCount: model.faqs.length,
                itemBuilder: (context, index) {
                  return FAQContainer(
                      faqQuestion: model.faqs[index]["question"],
                      answer: model.faqs[index]["answer"]);
                }),
          )
        ],
      ),
    );
  }
}