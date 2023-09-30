import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/provider/provider_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';

class ProviderConfirmationPage extends StatelessWidget {
  final ProviderViewModel viewModel;
  const ProviderConfirmationPage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 24.pHeight(context),
        ),
        SizedBox(
            height: 370.pHeight(context),
            width: 278.pWidth(context),
            child: SvgPicture.asset(
              AssetManager.providerIllustartion2,
            )),
        SizedBox(
          height: 24.pHeight(context),
        ),
        Text(
          LocaleKeys.providerWidget_providerConfirmation_yourRequestHas,
          textAlign: TextAlign.center,
          style: CustomThemeData.generateColoredStyle(
              fontSize: 24, context: context, lightTextColor: Colors.black),
        ).tr(),
        SizedBox(
          height: 16.pHeight(context),
        ),
        Text(
          LocaleKeys.providerWidget_providerConfirmation_youWillReceive,
          textAlign: TextAlign.center,
          style: CustomThemeData.generateColoredStyle(
              fontSize: 14, context: context, fontWeight: FontWeight.w400),
        ).tr(),
        const Spacer(),
        CustomButtons.generalButton(
            context: context,
            onTap: () {},
            text: LocaleKeys.continueWord,
            width: double.infinity,
            textSize: 1.8),
      ],
    );
  }
}
