import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/provider/provider_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';

class WelcomePage extends StatelessWidget {
  final ProviderViewModel viewModel;
  const WelcomePage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 24.pHeight(context),),
        SizedBox(
          height: 340.pHeight(context),
          width: 278.pWidth(context),
          child: SvgPicture.asset(AssetManager.providerIllustartion,)
          ),
        SizedBox(height: 24.pHeight(context),),
        Text(
          "Start Generating Income\nFor Your Followers",
          textAlign: TextAlign.center,
          style: CustomThemeData.generateColoredStyle(fontSize: 24, context: context, lightTextColor: Colors.black ),
        ),
        SizedBox(height: 16.pHeight(context),),
        Text(
          "Become a Provider on our\nplatform, showcasing your trading\nskills and earning income from\nyour followers",
          textAlign: TextAlign.center,
          style: CustomThemeData.generateColoredStyle(fontSize: 14, context: context,fontWeight: FontWeight.w400 ),
        ),
        const Spacer(),

        CustomButtons.generalButton(context: context, onTap: (){}, text: "Sign Up",width: double.infinity, textSize: 1.8),
        SizedBox(height: 13.pHeight(context),),
        CustomButtons.clearButton(context: context, onTap: (){}, text: "Login Instead",width: double.infinity, textSize: 1.8 ,textColor: viewModel.isDarkMode() ? Colors.white : const Color(0xFF8ACDF9)),
      ],
    );
  }
}