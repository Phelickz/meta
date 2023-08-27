import 'package:flutter/material.dart';
import 'package:meta_trader/ui/widgets/settings/components/policy_template.dart';

import '../../../app/responsiveness/res.dart';
import '../../views/settings/settings_view_model.dart';

class PrivacyPolicyPage extends StatelessWidget {
  final SettingsViewModel model;

  const PrivacyPolicyPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final privacyPolicyList = model.privacyPolicy["data"];

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 6),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(model.privacyPolicy["introduction"]),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return PolicyTemplate(
                    index: index,
                    title: privacyPolicyList[index]["heading"],
                    subtitle: privacyPolicyList[index]["data"][index]["data"]
                        ["subheading"],
                    subtitleDescription: privacyPolicyList[index]["data"][index]
                        ["description"],
                    subTitleCount: privacyPolicyList["data"].length,
                    titleDescription: privacyPolicyList[index]["description"]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
