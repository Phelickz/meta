import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';

import '../../../app/responsiveness/res.dart';
import '../../views/quotes/quotes_view_model.dart';

class SearchQuoteDetailsPage extends StatelessWidget {
  final QuotesViewModel model;
  const SearchQuoteDetailsPage({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: McGyver.rsDoubleW(context, 6)),
      child: Column(
        children: [
          Text(
            "",
            style: CustomThemeData.generateColoredStyle(
                fontSize: 12, fontWeight: FontWeight.bold, context: context),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: model.sampleQuoteDetails.length,
              itemBuilder: (context, index) {
                final details = model.sampleQuoteDetails[index];
                return QuoteDetailsTile(
                    title: details?["title"] ?? '',
                    value: details?["value"] ?? '');
              },
              separatorBuilder: (BuildContext context, int index) {
                return verticalSpaceSmall(context);
              },
            ),
          )
        ],
      ),
    );
  }
}

class QuoteDetailsTile extends StatelessWidget {
  final String title, value;
  const QuoteDetailsTile({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: CustomThemeData.generateColoredStyle(
              fontSize: 16, fontWeight: FontWeight.bold, context: context),
        ),
        Text(
          value,
          style: CustomThemeData.generateColoredStyle(
              fontSize: 14, context: context),
        )
      ],
    );
  }
}
