// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/ui/widgets/help_and_support/app_bar.dart';
import 'package:meta_trader/ui/widgets/help_and_support/faq.dart';
import 'package:meta_trader/ui/widgets/help_and_support/help_and_support.dart';

import '../../../app/locator/locator.dart';
import '../../../app/services/theme_service.dart';

enum HelpAndSupportPageEnum { helpAndSupport, customerSupport, faq }

class HelpAndSupportViewModel extends CustomBaseViewModel {
  bool _isDarkMode = false;
  final _themeService = locator<ThemeServices>();

  HelpAndSupportPageEnum _helpAndSupportPageEnum = HelpAndSupportPageEnum.faq;
  HelpAndSupportPageEnum get helpAndSupportPageEnum => _helpAndSupportPageEnum;

  set setHelpAndSupportPageEnum(HelpAndSupportPageEnum e) {
    _helpAndSupportPageEnum = e;
    rebuildUi();
  }

  List faqs = [
    {
      "question": "How do i make withdrawals?",
      "answer":
          "I wanted to take this opportunity to reiterate my enthusiasm for the position and my strong interest in becoming a valuable member of the [Company Name] team. After our conversation, I am even more convinced that this is a role where I can contribute my expertise and make a positive impact.\n\nI was particularly impressed by [specific aspect or project discussed during the interview], and I believe my background in [relevant experience] would allow me to bring fresh perspectives and valuable insights to the team"
    },
    {
      "question": "How do i make withdrawals?",
      "answer":
          "I wanted to take this opportunity to reiterate my enthusiasm for the position and my strong interest in becoming a valuable member of the [Company Name] team. After our conversation, I am even more convinced that this is a role where I can contribute my expertise and make a positive impact.\n\nI was particularly impressed by [specific aspect or project discussed during the interview], and I believe my background in [relevant experience] would allow me to bring fresh perspectives and valuable insights to the team"
    },
    {
      "question": "How do i make withdrawals?",
      "answer":
          "I wanted to take this opportunity to reiterate my enthusiasm for the position and my strong interest in becoming a valuable member of the [Company Name] team. After our conversation, I am even more convinced that this is a role where I can contribute my expertise and make a positive impact.\n\nI was particularly impressed by [specific aspect or project discussed during the interview], and I believe my background in [relevant experience] would allow me to bring fresh perspectives and valuable insights to the team"
    }
  ];
  Widget returnPage() {
    switch (_helpAndSupportPageEnum) {
      case HelpAndSupportPageEnum.helpAndSupport:
        return HelpAndSupportPage(model: this);
      case HelpAndSupportPageEnum.faq:
        return FAQPage(model: this);
      case HelpAndSupportPageEnum.customerSupport:
        return SizedBox();

      default:
        return Container();
    }
  }

  AppBar? returnAppBar(BuildContext context) {
    switch (_helpAndSupportPageEnum) {
      case HelpAndSupportPageEnum.helpAndSupport:
        return helpAndSupportAppBar(context, "Help and Support", "", this,
            HelpAndSupportPageEnum.helpAndSupport);
      case HelpAndSupportPageEnum.faq:
        return helpAndSupportAppBar(
            context, "FAQ", "", this, HelpAndSupportPageEnum.faq);
      case HelpAndSupportPageEnum.customerSupport:
        return null;

      default:
        return null;
    }
  }
}
