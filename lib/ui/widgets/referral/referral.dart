// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/ui/widgets/referral/components/referral_tile.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/utils/color_manager.dart';
import '../../../app/utils/theme.dart';
import '../../views/referral/referral_view_model.dart';
import '../buttons/buttons.dart';

class ReferralPage extends StatelessWidget {
  final ReferralViewModel model;

  const ReferralPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: McGyver.rsDoubleW(context, 6),
        ),
        child: Column(
          children: [
            SizedBox(
              width: 300.pWidth(context),
              height: 300.pHeight(context),
              child: Center(
                child: SvgPicture.asset(
                  isDarkMode
                      ? AssetManager.referralPageImageDark
                      : AssetManager.referralPageImageLight,
                ),
              ),
            ),
            Center(
              child: SizedBox(
                  width: 300.pWidth(context),
                  child: Text(
                    "Refer now and earn \$10 credit on your next trade",
                    textAlign: TextAlign.center,
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 2.4),
                      color:
                          isDarkMode ? Colors.white54 : const Color(0xff475467),
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
            SizedBox(
              height: 16.pHeight(context),
            ),
            Container(
              width: McGyver.rsDoubleW(context, 45),
              padding: EdgeInsets.symmetric(
                  vertical: 13.pHeight(context),
                  horizontal: 34.pHeight(context)),
              color: isDarkMode
                  ? ColorManager.darkHeaderColor
                  : ColorManager.lightHeaderColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Referral Code",
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.5),
                      color: const Color(0xffECF7FE),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        model.referralCode,
                        style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.8),
                            color: const Color(0xffECF7FE),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 5.pWidth(context)),
                      SvgPicture.asset(
                        AssetManager.copy,
                        color: const Color(0xffECF7FE),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.pHeight(context),
            ),
            Text(
              'How does it work',
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 2),
                color: isDarkMode ? Colors.white54 : Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            verticalSpaceSmall(context),
            const ReferralTile(
              title: "Invite your friends to register on Meta Trader 5 ",
              icon: AssetManager.convert,
            ),
            SizedBox(
              height: 16.pHeight(context),
            ),
            const ReferralTile(
              title:
                  "When your friend registers on app, both of you will get \$10 reward credit ",
              icon: AssetManager.paymentMethod,
            ),
            SizedBox(
              height: 16.pHeight(context),
            ),
            const ReferralTile(
              title: "Your reward credit can then be used on your next trade",
              icon: AssetManager.reward,
            ),
            SizedBox(
              height: 19.pHeight(context),
            ),
            CustomButtons.generalButton(
              context: context,
              onTap: () {},
              text: "Refer Now",
            ),
            verticalSpaceMedium(context),
          ],
        ),
      ),
    );
  }
}
