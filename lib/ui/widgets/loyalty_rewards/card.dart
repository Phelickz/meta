import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';

class LoyaltyRewardCard extends StatelessWidget {
  const LoyaltyRewardCard({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 5),
      ),
      child: SizedBox(
        width: double.infinity,
        height: McGyver.rsDoubleH(context, 28),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: McGyver.rsDoubleH(context, 23),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/platinum_background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    children: [
                      verticalSpaceXXSmall(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              verticalSpaceSmall(context),
                              Text(
                                'Total Points Balance',
                                style: CustomThemeData.generateStyle(
                                  fontSize: McGyver.textSize(context, 1.2),
                                ),
                              ),
                              verticalSpaceXSmall(context),
                              Text(
                                '5000 Pts',
                                style: CustomThemeData.generateStyle(
                                  fontSize: McGyver.textSize(context, 2.4),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Image.asset(
                            "assets/images/Frame_349.png",
                            height: McGyver.rsDoubleH(context, 8),
                          )
                        ],
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'You are at the peak!',
                          textAlign: TextAlign.left,
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.4),
                            // fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      verticalSpaceXXSmall(context),
                      SizedBox(
                        width: double.infinity,
                        child: LinearProgressIndicator(
                            // borderRadius: BorderRadius.circular(10),
                            value: 23 / 100,
                            backgroundColor: isDarkMode
                                ? const Color(0xFF073961)
                                : const Color(0xFFE4E7EC),
                            color: Colors.purple),
                      ),
                      verticalSpaceXXSmall(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Silver',
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.4),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Gold',
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.4),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Platinum',
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.4),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceXSmall(context),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: McGyver.rsDoubleH(context, 5.6),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                child: CircleAvatar(
                  radius: McGyver.rsDoubleH(context, 5),
                  backgroundColor: Colors.red,

                  // backgroundColor: Colors.red,
                  child: Image.asset(
                    'assets/images/Frame_346.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
