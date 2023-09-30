import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/ui/views/help_and_support/help_and_support_view_model.dart';
import 'package:meta_trader/ui/widgets/help_and_support/components/help_and_support_tile.dart';

import '../../../app/responsiveness/res.dart';
import '../../../generated/locale_keys.g.dart';

class HelpAndSupportPage extends StatelessWidget {
  final HelpAndSupportViewModel model;

  const HelpAndSupportPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: McGyver.rsDoubleW(context, 6)),
      child: Column(
        children: [
          verticalSpaceXSmall(context),
          HelpAndSupportTile(
            title: LocaleKeys
                .helpAndSupport_helpAndSupportWidget_chatWithCustomer
                .tr(),
            icon: AssetManager.chat,
            onTap: () {
              model.setHelpAndSupportPageEnum =
                  HelpAndSupportPageEnum.customerSupport;
            },
          ),
          HelpAndSupportTile(
            title: LocaleKeys
                .helpAndSupport_helpAndSupportWidget_frequentlyAskedQ
                .tr(),
            icon: AssetManager.faq,
            onTap: () {
              model.setHelpAndSupportPageEnum = HelpAndSupportPageEnum.faq;
            },
          ),
          HelpAndSupportTile(
            title: LocaleKeys.helpAndSupport_helpAndSupportWidget_sendUsAMessage
                .tr(),
            // icon: AssetManager.emptyNotifications,
            icon: 'assets/images/message-text.svg',
            onTap: () {
              // model.setHelpAndSupportPageEnum =
              //     HelpAndSupportPageEnum.sendAMessage;
            },
          ),
        ],
      ),
    );
  }
}
