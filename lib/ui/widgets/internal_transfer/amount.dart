import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/ui/views/internal_transfer/internal_transfer_view_model.dart';
import 'package:meta_trader/ui/widgets/appbar.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:meta_trader/ui/widgets/textfields/textfield.dart';

import '../../../app/utils/theme.dart';

@RoutePage()
class InternalTransferAmount extends StatelessWidget {
  const InternalTransferAmount({super.key, required this.model});
  final InternalTransferViewModel model;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
      appBar: globalAppBar(context, 'Amount', 'Enter amount to transfer', () {
        Navigator.pop(context);
      }, []),
      isBusy: model.isBusy,
      body: Column(
        children: [
          verticalSpaceSmall(context),
          Expanded(
            child: ListView(
              children: [
                Text(
                  'Amount To Fund',
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    color: isDarkMode
                        ? ColorManager.darkText
                        : ColorManager.lightText,
                  ),
                ),
                verticalSpaceXXSmall(context),
                const CustomTextFields(
                  hintText: '0.00 USD',
                  password: false,
                ),
                verticalSpaceSmall(context),
                Text(
                  'Sending Account Password',
                  style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.8),
                      color: ColorManager.lightText),
                ),
                verticalSpaceXXSmall(context),
                IgnorePointer(
                  ignoring: true,
                  child: CustomTextFields(
                    hintText: 'Enter Account Password',
                    password: true,
                    filledWithColor: false,
                    suffixIconConstraints:
                        const BoxConstraints(minHeight: 30, minWidth: 30),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 9.0),
                      child: SvgPicture.asset(
                        'assets/icons/copy.svg',
                        width: 2,
                        height: 2,
                      ),
                    ),
                  ),
                ),
                verticalSpaceSmall(context),
              ],
            ),
          ),
          CustomButtons.generalButton(
              context: context,
              onTap: () {
                model.push(InternalTransferSuccess(model: model));
              },
              text: 'Fund Account'),
          verticalSpaceMedium(context),
        ],
      ),
    );
  }
}
