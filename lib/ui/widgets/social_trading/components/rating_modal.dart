import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/locator/locator.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/app/services/router_service.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/social_trading/components/rating.dart';

class RatingModal extends StatefulWidget {
  const RatingModal({super.key});

  @override
  State<RatingModal> createState() => _RatingModalState();
}

class _RatingModalState extends State<RatingModal> {
  double value = 3.5;
  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      height: McGyver.rsDoubleH(context, 35),
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 6),
        vertical: McGyver.rsDoubleH(context, 4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys
                .socialTradingWidget_socialTradingComponent_rateModel_rateSatoshi,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.6),
              fontWeight: FontWeight.w500,
              color: isDarkMode
                  ? const Color(0xFF98A2B3)
                  : const Color(0xFF667085),
            ),
          ).tr(),
          verticalSpaceSmall(context),
          Text(
            LocaleKeys
                .socialTradingWidget_socialTradingComponent_rateModel_takeAMoment,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.7),
              fontWeight: FontWeight.bold,
              color: isDarkMode
                  ? const Color(0xFFFFFFFF)
                  : const Color(0xFF475467),
            ),
          ).tr(),
          verticalSpaceXSmall(context),
          RatingStars(
            value: value,
            onValueChanged: (v) {
              //
              setState(() {
                value = v;
              });
            },
            starBuilder: (index, color) => Icon(
              Icons.ac_unit_outlined,
              color: color,
            ),
            starCount: 5,
            starSize: 20,
            valueLabelColor: const Color(0xff9b9b9b),
            valueLabelTextStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 12.0),
            valueLabelRadius: 10,
            maxValue: 5,
            starSpacing: 2,
            maxValueVisibility: true,
            valueLabelVisibility: true,
            animationDuration: const Duration(milliseconds: 1000),
            valueLabelPadding:
                const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
            valueLabelMargin: const EdgeInsets.only(right: 8),
            starOffColor: const Color(0xffe7e8ea),
            starColor: Colors.yellow,
          ),

          // Row(
          //   children: [
          //     Icon(
          //       Icons.star,
          //       size: 26,
          //       color: Colors.amber[300],
          //     ),
          //     Icon(
          //       Icons.star,
          //       size: 26,
          //       color: Colors.amber[300],
          //     ),
          //     Icon(
          //       Icons.star,
          //       size: 26,
          //       color: Colors.amber[300],
          //     ),
          //     Icon(
          //       Icons.star,
          //       size: 26,
          //       color: Colors.amber[300],
          //     ),
          //     Icon(
          //       Icons.star,
          //       size: 26,
          //       color: Colors.amber[300],
          //     )
          //   ],
          // ),
          verticalSpaceSmall(context),
          verticalSpaceSmall(context),
          CustomButtons.generalButton(
            text: LocaleKeys
                .socialTradingWidget_socialTradingComponent_rateModel_submitFeedback
                .tr(),
            context: context,
            onTap: () {
              Navigator.pop(context);
              final router = locator<RouterService>();
              router.router.push(const SocialTradingDasboard());
            },
          )
        ],
      ),
    );
  }
}
