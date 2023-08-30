import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/utils/theme.dart';
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
          Flexible(
            fit: FlexFit.loose,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: privacyPolicyList.length,
              itemBuilder: (context, index) {
                final subList = privacyPolicyList[index]["data"];
                return SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${index + 1}. ${privacyPolicyList[index]["heading"]}",
                        style: CustomThemeData.generateColoredStyle(
                            fontSize: 16,
                            context: context,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        privacyPolicyList[index]["description"],
                        style: CustomThemeData.generateColoredStyle(
                            fontSize: 12, context: context),
                      ),
                      SizedBox(
                        height: 5.pHeight(context),
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          width: double.infinity,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: subList.length,
                              itemBuilder: (context, subIndex) {
                                return RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                    text:
                                        " . ${subList[subIndex]["subheading"]}:",
                                    style: CustomThemeData.generateColoredStyle(
                                        fontSize: 12,
                                        context: context,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  TextSpan(
                                    text:
                                        " ${subList[subIndex]["description"]}",
                                    style: CustomThemeData.generateColoredStyle(
                                        fontSize: 12,
                                        context: context,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ]));
                              }),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
