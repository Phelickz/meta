import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/utils/dimensions.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/utils/asset_manager.dart';
import '../../../app/utils/theme.dart';
import '../../../generated/locale_keys.g.dart';
import '../../views/help_and_support/help_and_support_view_model.dart';

class CustomerSupportEmptyIcon extends StatelessWidget {
  final HelpAndSupportViewModel model;

  const CustomerSupportEmptyIcon({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 120.pHeight(context),
          width: MediaQuery.of(context).size.width,
        ),
        Container(
          width: 76.pWidth(context),
          height: 76.pHeight(context),
          padding: EdgeInsets.symmetric(
              horizontal: 12.pWidth(context), vertical: 12.pHeight(context)),
          decoration: BoxDecoration(
              color: isDarkMode
                  ? const Color(0xff052844)
                  : const Color(0xffD3ECFD),
              borderRadius: BorderRadius.circular(20)),
          child: SvgPicture.asset(
            AssetManager.messages,
          ),
        ),
        SizedBox(
          height: 30.pHeight(context),
        ),
        Text(LocaleKeys.helpAndSupport_emptyIcon_noMessage,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.6),
              color: isDarkMode ? Colors.white : const Color(0xff667085),
              fontWeight: FontWeight.w400,
            )).tr()
      ],
    );
  }
}
