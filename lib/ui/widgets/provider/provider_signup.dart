import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/provider/provider_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/provider/components/provider_form_fields.dart';

class ProviderSignUpPage extends StatelessWidget {
  final ProviderViewModel viewModel;
  const ProviderSignUpPage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 24.pHeight(context),
        ),
        ProviderFormFields.simpleField(LocaleKeys.auth_firstName.tr(),
            LocaleKeys.auth_enterFirstName.tr()),
        SizedBox(
          height: 16.pHeight(context),
        ),
        ProviderFormFields.simpleField(
            LocaleKeys.auth_lastName.tr(), LocaleKeys.auth_enterLastName.tr()),
        SizedBox(
          height: 16.pHeight(context),
        ),
        ProviderFormFields.simpleField(
          LocaleKeys.emailAddress.tr(),
          LocaleKeys.auth_enterEmail.tr(),
        ),
        SizedBox(
          height: 16.pHeight(context),
        ),
        ProviderFormFields.simpleFieldWithIcon(
            LocaleKeys.country.tr(),
            "USA",
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios_outlined))),
        SizedBox(
          height: 16.pHeight(context),
        ),
        ProviderFormFields.simpleField(
            LocaleKeys.phoneNumber.tr(), "+123 340 674 8"),
        SizedBox(
          height: 16.pHeight(context),
        ),
        ProviderFormFields.simpleFieldWithPassword(
          LocaleKeys.password.tr(),
          LocaleKeys.password.tr(),
        ),
        SizedBox(
          height: 16.pHeight(context),
        ),
        ProviderFormFields.simpleFieldWithIcon(
            LocaleKeys.attachment.tr(),
            LocaleKeys.providerWidget_providerSignUp_uploadAttachment.tr(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.folder_copy))),
        SizedBox(
          height: 20.pHeight(context),
        ),
        Row(
          children: [
            Checkbox(
                value: viewModel.checkbox,
                onChanged: (_) => viewModel.toggleCheckbox()),
            SizedBox(
              width: 12.pWidth(context),
            ),
            Expanded(
                child: RichText(
              text: TextSpan(
                  text: LocaleKeys.providerWidget_providerLogin_iAgreeWith.tr(),
                  style: CustomThemeData.generateColoredStyle(
                      fontSize: 12,
                      context: context,
                      fontWeight: FontWeight.w400,
                      lightTextColor: const Color(0xFF98A2B3),
                      darkTextColor: const Color(0xFF98A2B3)),
                  children: [
                    TextSpan(
                      text: LocaleKeys.termsAndCondition.tr(),
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 12,
                          context: context,
                          fontWeight: FontWeight.w400,
                          lightTextColor: const Color(0xFF47B0F5),
                          darkTextColor: const Color(0xFF47B0F5)),
                    ),
                    TextSpan(
                      text: LocaleKeys.providerWidget_providerLogin_forOPening
                          .tr(),
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 12,
                          context: context,
                          fontWeight: FontWeight.w400,
                          lightTextColor: const Color(0xFF98A2B3),
                          darkTextColor: const Color(0xFF98A2B3)),
                    ),
                    TextSpan(
                      text: LocaleKeys
                          .providerWidget_providerLogin_dataProtectionPolicy
                          .tr(),
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 12,
                          context: context,
                          fontWeight: FontWeight.w400,
                          lightTextColor: const Color(0xFF47B0F5),
                          darkTextColor: const Color(0xFF47B0F5)),
                    )
                  ]),
            ))
          ],
        ),
        SizedBox(
          height: 74.pHeight(context),
        ),
        CustomButtons.generalButton(
          context: context,
          onTap: () {
            viewModel.setProviderPageEnum = ProviderPageEnum.dashboard;
          },
          text: LocaleKeys.submit,
          width: double.infinity,
          textSize: 1.8,
        ),
      ],
    );
  }
}
