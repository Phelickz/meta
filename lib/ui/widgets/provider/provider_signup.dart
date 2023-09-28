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
        ProviderFormFields.simpleField(
            LocaleKeys.auth_firstName, LocaleKeys.auth_enterFirstName),
        SizedBox(
          height: 16.pHeight(context),
        ),
        ProviderFormFields.simpleField(
            LocaleKeys.auth_lastName, LocaleKeys.auth_enterLastName),
        SizedBox(
          height: 16.pHeight(context),
        ),
        ProviderFormFields.simpleField(
            LocaleKeys.emailAddress, LocaleKeys.auth_enterEmail),
        SizedBox(
          height: 16.pHeight(context),
        ),
        ProviderFormFields.simpleFieldWithIcon(
            LocaleKeys.country,
            "USA",
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios_outlined))),
        SizedBox(
          height: 16.pHeight(context),
        ),
        ProviderFormFields.simpleField(
            LocaleKeys.phoneNumber, "+123 340 674 8"),
        SizedBox(
          height: 16.pHeight(context),
        ),
        ProviderFormFields.simpleFieldWithPassword(
            LocaleKeys.password, LocaleKeys.password),
        SizedBox(
          height: 16.pHeight(context),
        ),
        ProviderFormFields.simpleFieldWithIcon(
            LocaleKeys.attachment,
            LocaleKeys.providerWidget_providerSignUp_uploadAttachment,
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
                  text: LocaleKeys.providerWidget_providerLogin_iAgreeWith,
                  style: CustomThemeData.generateColoredStyle(
                      fontSize: 12,
                      context: context,
                      fontWeight: FontWeight.w400,
                      lightTextColor: const Color(0xFF98A2B3),
                      darkTextColor: const Color(0xFF98A2B3)),
                  children: [
                    TextSpan(
                      text: LocaleKeys.termsAndCondition,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 12,
                          context: context,
                          fontWeight: FontWeight.w400,
                          lightTextColor: const Color(0xFF47B0F5),
                          darkTextColor: const Color(0xFF47B0F5)),
                    ),
                    TextSpan(
                      text: LocaleKeys.providerWidget_providerLogin_forOPening,
                      style: CustomThemeData.generateColoredStyle(
                          fontSize: 12,
                          context: context,
                          fontWeight: FontWeight.w400,
                          lightTextColor: const Color(0xFF98A2B3),
                          darkTextColor: const Color(0xFF98A2B3)),
                    ),
                    TextSpan(
                      text: LocaleKeys
                          .providerWidget_providerLogin_dataProtectionPolicy,
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
