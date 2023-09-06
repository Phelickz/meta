import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
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
        SizedBox(height: 24.pHeight(context),),
        ProviderFormFields.simpleField("First Name", "Enter your first name"),
        SizedBox(height: 16.pHeight(context),),
        ProviderFormFields.simpleField("Last Name", "Enter your last name"),
        SizedBox(height: 16.pHeight(context),),
        ProviderFormFields.simpleField("Email Address", "Enter your email address"),
        SizedBox(height: 16.pHeight(context),),
        ProviderFormFields.simpleFieldWithIcon("Country", "USA", IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios_outlined))),
        SizedBox(height: 16.pHeight(context),),
        ProviderFormFields.simpleField("Phone Number", "+123 340 674 8"),
        SizedBox(height: 16.pHeight(context),),
        ProviderFormFields.simpleFieldWithPassword("Password", "Password"),
        SizedBox(height: 16.pHeight(context),),
        ProviderFormFields.simpleFieldWithIcon("Attachment", "Upload Attachment", IconButton(onPressed: (){}, icon: const Icon(Icons.folder_copy))),
        SizedBox(height: 20.pHeight(context),),
        Row(
          children: [
            Checkbox(value: viewModel.checkbox, onChanged: (_) => viewModel.toggleCheckbox()),
            SizedBox(width: 12.pWidth(context),),
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: "I agree with the",
                  style: CustomThemeData.generateColoredStyle(fontSize: 12, context: context,fontWeight: FontWeight.w400,lightTextColor: const Color(0xFF98A2B3), darkTextColor: const Color(0xFF98A2B3)),
                  children: [
                    TextSpan(
                      text: "terms and conditions",
                      style: CustomThemeData.generateColoredStyle(fontSize: 12, context: context,fontWeight: FontWeight.w400,lightTextColor: const Color(0xFF47B0F5), darkTextColor: const Color(0xFF47B0F5)),
                    ),
                    TextSpan(
                      text: "for opening an account and the",
                      style: CustomThemeData.generateColoredStyle(fontSize: 12, context: context,fontWeight: FontWeight.w400,lightTextColor: const Color(0xFF98A2B3), darkTextColor: const Color(0xFF98A2B3)),
                    ),
                    TextSpan(
                      text: "data protection policy",
                      style: CustomThemeData.generateColoredStyle(fontSize: 12, context: context,fontWeight: FontWeight.w400,lightTextColor: const Color(0xFF47B0F5), darkTextColor: const Color(0xFF47B0F5)),
                    )
                  ]
                ),
              )
            )
          ],
        ),
        SizedBox(height: 74.pHeight(context),),
        CustomButtons.generalButton(context: context, onTap: (){}, text: "Submit",width: double.infinity, textSize: 1.8,),
      ],
    );
  }
}