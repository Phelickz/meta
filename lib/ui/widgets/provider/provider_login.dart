import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/provider/provider_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/provider/components/provider_form_fields.dart';

class ProviderLoginPage extends StatelessWidget {
  final ProviderViewModel viewModel;
  const ProviderLoginPage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24.pHeight(context),),
        ProviderFormFields.simpleField("Account ID", "Enter your account ID"),
        SizedBox(height: 16.pHeight(context),),
        ProviderFormFields.simpleFieldWithPassword("Password", "Password"),
         SizedBox(height: 16.pHeight(context),),
        ProviderFormFields.simpleFieldWithIcon("Desired Fee", "0%", IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios_outlined))),
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
        Spacer(),
        CustomButtons.generalButton(context: context, onTap: (){}, text: "Register",width: double.infinity, textSize: 1.8,),
      ],
    );
  }
}