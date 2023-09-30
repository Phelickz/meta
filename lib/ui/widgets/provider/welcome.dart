import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
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
        SizedBox(
          height: 24.pHeight(context),
        ),
        SizedBox(
            height: 340.pHeight(context),
            width: 278.pWidth(context),
            child: SvgPicture.asset(
              AssetManager.providerIllustartion,
            )),
        SizedBox(
          height: 24.pHeight(context),
        ),
        Text(
          LocaleKeys.providerWidget_welcomeProvider_startGenerating,
          textAlign: TextAlign.center,
          style: CustomThemeData.generateColoredStyle(
              fontSize: 24, context: context, lightTextColor: Colors.black),
        ).tr(),
        SizedBox(
          height: 16.pHeight(context),
        ),
        Text(
          LocaleKeys.providerWidget_welcomeProvider_becomeAProvider,
          textAlign: TextAlign.center,
          style: CustomThemeData.generateColoredStyle(
              fontSize: 14, context: context, fontWeight: FontWeight.w400),
        ).tr(),
        const Spacer(),
        CustomButtons.generalButton(
            context: context,
            onTap: () {
              viewModel.setProviderPageEnum = ProviderPageEnum.signUp;
            },
            text: LocaleKeys.signIn.tr(),
            width: double.infinity,
            textSize: 1.8),
        SizedBox(
          height: 13.pHeight(context),
        ),
        CustomButtons.clearButton(
            context: context,
            onTap: () {
              viewModel.setProviderPageEnum = ProviderPageEnum.login;
            },
            text: LocaleKeys.providerWidget_welcomeProvider_loginInstead.tr(),
            width: double.infinity,
            textSize: 1.8,
            textColor: viewModel.isDarkMode()
                ? Colors.black
                : const Color(0xFF8ACDF9)),
      ],
    );
  }
}
