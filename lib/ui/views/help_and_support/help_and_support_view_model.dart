// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/ui/widgets/help_and_support/app_bar.dart';
import 'package:meta_trader/ui/widgets/help_and_support/customer_support.dart';
import 'package:meta_trader/ui/widgets/help_and_support/empty.dart';
import 'package:meta_trader/ui/widgets/help_and_support/empty_icon.dart';
import 'package:meta_trader/ui/widgets/help_and_support/faq.dart';
import 'package:meta_trader/ui/widgets/help_and_support/help_and_support.dart';

import '../../../app/locator/locator.dart';
import '../../../app/services/theme_service.dart';

enum HelpAndSupportPageEnum {
  helpAndSupport,
  customerSupport,
  faq,
  sendAMessage
}

enum CustomerSupportEnum {
  emptyIcon,
  empty,
  withTextAndAudio,
  withTextAndImage,
  withImage
}

class HelpAndSupportViewModel extends CustomBaseViewModel {
  bool _isDarkMode = false;
  final _themeService = locator<ThemeServices>();

  HelpAndSupportPageEnum _helpAndSupportPageEnum =
      HelpAndSupportPageEnum.helpAndSupport;

  HelpAndSupportPageEnum get helpAndSupportPageEnum => _helpAndSupportPageEnum;

  set setHelpAndSupportPageEnum(HelpAndSupportPageEnum e) {
    _helpAndSupportPageEnum = e;
    rebuildUi();
  }

  CustomerSupportEnum _customerSupportEnum = CustomerSupportEnum.emptyIcon;
  CustomerSupportEnum get customerSupportEnum => _customerSupportEnum;

  set setCustomerSupportEnum(CustomerSupportEnum e) {
    _customerSupportEnum = e;
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

  List _suggestionsList = [
    "I need a favor",
    "How do I withdraw",
    "I cant fund my wallet"
  ];

  List get suggestionList => _suggestionsList;
  Widget returnPage() {
    switch (_helpAndSupportPageEnum) {
      case HelpAndSupportPageEnum.helpAndSupport:
        return HelpAndSupportPage(model: this);
      case HelpAndSupportPageEnum.faq:
        return FAQPage(model: this);
      case HelpAndSupportPageEnum.customerSupport:
        return CustomerSupportPage(model: this);

      default:
        return Container();
    }
  }

  Widget returnCustomerSupportPage() {
    switch (_customerSupportEnum) {
      case CustomerSupportEnum.empty:
        return CustomerSupportEmpty(model: this);
      case CustomerSupportEnum.emptyIcon:
        return CustomerSupportEmptyIcon(model: this);
      case CustomerSupportEnum.withImage:
        return CustomerSupportPage(model: this);
      case CustomerSupportEnum.withTextAndAudio:
        return CustomerSupportPage(model: this);
      case CustomerSupportEnum.withTextAndImage:
        return CustomerSupportPage(model: this);

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
        return helpAndSupportAppBar(
            context, "Customer care", "Online", this, helpAndSupportPageEnum);

      default:
        return null;
    }
  }
}
