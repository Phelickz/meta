import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/provider/provider_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/responsiveness/size.dart';
import '../../../../app/utils/asset_manager.dart';
import '../../textfields/textfield.dart';

class EditStrategyDescription extends StatelessWidget {
  final ProviderViewModel viewModel;
  const EditStrategyDescription({Key? key, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 6),
      ),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          SizedBox(
            height: 35.pHeight(context),
          ),
          Text(
            "Change password",
            style: CustomThemeData.generateColoredStyle(
                fontSize: 14, context: context),
          ),
          SizedBox(
            height: 20.pHeight(context),
          ),
          Text(
            "Strategy Description",
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.8),
              fontWeight: FontWeight.w500,
              color: isDarkMode
                  ? const Color(0xFFD0D5DD)
                  : const Color(
                      0xFF667085,
                    ),
            ),
          ),
          verticalSpaceXXSmall(context),
          CustomTextFields(
            hintText: viewModel.strategyDescription,
            maxLines: 7,
            suffixIcon: Align(
              alignment: Alignment.topCenter,
              child: Transform.scale(
                  alignment: Alignment.topCenter,
                  scale: 0.6,
                  child: SvgPicture.asset(AssetManager.edit)),
            ),
          ),
          SizedBox(
            height: 64.pHeight(context),
          ),
          CustomButtons.generalButton(
              context: context,
              onTap: () {
                Navigator.pop(context);
              },
              text: "confirm")
        ],
      ),
    );
  }
}
