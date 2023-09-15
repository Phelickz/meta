import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class LoyaltyRewardCard extends StatelessWidget {
  const LoyaltyRewardCard({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: Column(
                  children: [
                    verticalSpaceXXSmall(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
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
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Image.asset(
                            "assets/images/Frame_349.png",
                            height: McGyver.rsDoubleH(context, 8),
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Align(
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
                    ),
                    verticalSpaceXXSmall(context),
                    SizedBox(
                      width: 1000,
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: SfSlider(
                          overlayShape: const SfOverlayShape(),
                          min: 0.0,
                          max: 100.0,
                          value: 100,
                          interval: 20,
                          activeColor: Colors.deepPurple,
                          // showTicks: true,
                          // showLabels: true,
                          enableTooltip: true,
                          minorTicksPerInterval: 1,
                          thumbIcon: Container(
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 3),
                            ),
                          ),
                          onChanged: (dynamic value) {
                            // setState(() {
                            //   _value = value;
                            // });
                          },
                        ),
                      ),
                    ),
                    // SliderTheme(
                    //   data: SliderThemeData(
                    //     thumbShape: const RoundSliderThumbShape(
                    //         enabledThumbRadius: 12),
                    //     // here
                    //     trackShape: CustomTrackShape(),
                    //   ),
                    //   child: Slider(
                    //     inactiveColor: isDarkMode
                    //         ? const Color(0xFF073961)
                    //         : const Color(0xFFE4E7EC),
                    //     activeColor: Colors.purple,
                    //     value: 1,
                    //     onChanged: (v) {
                    //       // setState(() {
                    //       //   sliderValue = v;
                    //       // });
                    //     },
                    //   ),
                    // ),
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: LinearProgressIndicator(
                    //       // borderRadius: BorderRadius.circular(10),
                    //       value: 100 / 100,
                    //       backgroundColor: isDarkMode
                    //           ? const Color(0xFF073961)
                    //           : const Color(0xFFE4E7EC),
                    //       color: Colors.purple),
                    // ),
                    // verticalSpaceXXSmall(context),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
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
                    ),
                    verticalSpaceXSmall(context),
                  ],
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

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop + 16, trackWidth, 1);
  }
}
