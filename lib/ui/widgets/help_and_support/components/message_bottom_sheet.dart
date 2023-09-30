import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/ui/widgets/help_and_support/components/suggestions_bar.dart';
import 'package:meta_trader/ui/widgets/textfields/textfield.dart';

import '../../../../app/utils/theme.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../views/help_and_support/help_and_support_view_model.dart';

class MessageBottomSheet extends StatelessWidget {
  final HelpAndSupportViewModel model;

  final bool hasSuggestion;
  const MessageBottomSheet({
    Key? key,
    required this.model,
    this.hasSuggestion = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return Column(
      children: [
        hasSuggestion
            ? SuggestionBar(
                suggestionsList: model.suggestionList,
              )
            : const SizedBox(),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: 24.pWidth(context), vertical: 12.pHeight(context)),
          height: 90.pWidth(context),
          width: MediaQuery.of(context).size.width,
          color: isDarkMode ? const Color(0xff073961) : const Color(0xff20A0F3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 24.pHeight(context),
                width: 24.pWidth(context),
                child: SvgPicture.asset(AssetManager.attachment),
              ),
              SizedBox(
                  height: 40,
                  width: 260.pWidth(context),
                  child: CustomTextFields(
                    filledWithColor: true,
                    suffixIcon: InkWell(
                      child: Transform.scale(
                          scale: 0.5,
                          child: SvgPicture.asset(
                            AssetManager.messageTyping,
                          )),
                    ),
                    hintText: LocaleKeys
                        .helpAndSupport_components_messageBottomSheet_writeYourMessage
                        .tr(),
                  )),
              SizedBox(
                height: 24.pHeight(context),
                width: 24.pWidth(context),
                child: SvgPicture.asset(AssetManager.mic),
              ),
            ],
          ),
        )
      ],
    );
  }
}
