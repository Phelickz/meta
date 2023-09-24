// ignore_for_file: prefer_final_fields, unused_field

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
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
      LocaleKeys.views_helpAndSupportView_question.tr():
          LocaleKeys.views_helpAndSupportView_faqList_question1.tr(),
      LocaleKeys.views_helpAndSupportView_answer.tr():
          "${LocaleKeys.views_helpAndSupportView_faqList_answer1.tr()} \n\n ${LocaleKeys.views_helpAndSupportView_faqList_question1.tr()}"
    },
    {
      LocaleKeys.views_helpAndSupportView_question.tr():
          LocaleKeys.views_helpAndSupportView_faqList_question1.tr(),
      LocaleKeys.views_helpAndSupportView_answer.tr():
          "${LocaleKeys.views_helpAndSupportView_faqList_answer1.tr()} \n\n ${LocaleKeys.views_helpAndSupportView_faqList_question1.tr()}"
    },
    {
      LocaleKeys.views_helpAndSupportView_question.tr():
          LocaleKeys.views_helpAndSupportView_faqList_question1.tr(),
      LocaleKeys.views_helpAndSupportView_answer.tr():
          "${LocaleKeys.views_helpAndSupportView_faqList_answer1.tr()} \n\n ${LocaleKeys.views_helpAndSupportView_faqList_question1.tr()}"
    }
  ];

  List _suggestionsList = [
    LocaleKeys.views_helpAndSupportView_suggestionList_suggestion1.tr(),
    LocaleKeys.views_helpAndSupportView_suggestionList_suggestion2.tr(),
    LocaleKeys.views_helpAndSupportView_suggestionList_suggestion3.tr(),
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
        return helpAndSupportAppBar(
            context,
            LocaleKeys.views_helpAndSupportView_helpAndSupport.tr(),
            "",
            this,
            HelpAndSupportPageEnum.helpAndSupport);
      case HelpAndSupportPageEnum.faq:
        return helpAndSupportAppBar(
            context,
            LocaleKeys.views_helpAndSupportView_faq.tr(),
            "",
            this,
            HelpAndSupportPageEnum.faq);
      case HelpAndSupportPageEnum.customerSupport:
        return helpAndSupportAppBar(
            context,
            LocaleKeys.views_helpAndSupportView_customerCare.tr(),
            LocaleKeys.views_helpAndSupportView_online.tr(),
            this,
            helpAndSupportPageEnum);

      default:
        return null;
    }
  }
}
