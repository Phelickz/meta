import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';

class FAQContainer extends StatelessWidget {
  final String faqQuestion;
  final String answer;
  const FAQContainer(
      {Key? key, required this.faqQuestion, required this.answer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            faqQuestion,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 2.pHeight(context),
          ),
          Text(
            answer,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(
            height: 16.pHeight(context),
          ),
        ],
      ),
    );
  }
}
