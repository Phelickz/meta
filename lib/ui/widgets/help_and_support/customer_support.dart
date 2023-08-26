import 'package:flutter/material.dart';
import 'package:meta_trader/ui/views/help_and_support/help_and_support_view_model.dart';
import 'package:meta_trader/ui/widgets/help_and_support/components/message_bottom_sheet.dart';

import '../../../app/responsiveness/res.dart';

class CustomerSupportPage extends StatelessWidget {
  final HelpAndSupportViewModel model;

  const CustomerSupportPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: McGyver.rsDoubleW(context, 6)),
            child: model.returnCustomerSupportPage(),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: MessageBottomSheet(
                model: model,
              ))
        ],
      ),
    );
  }
}
