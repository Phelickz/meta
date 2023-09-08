import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';

class PriceSentiments extends StatelessWidget {
  const PriceSentiments(
      {super.key, required this.pair, this.iconButton, this.big});
  final String pair;
  final Widget? iconButton;
  final bool? big;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          pair,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.7),
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black54,
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 10,
          child: Row(
            children: [
              Text(
                '65% Buy',
                style: CustomThemeData.generateStyle(
                  fontSize: 13,
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                width: McGyver.rsDoubleW(context, 11),
                height: 10,
                color: Theme.of(context).primaryColor,
              ),
              Container(
                width: McGyver.rsDoubleW(context, big == true ? 13 : 11),
                height: 10,
                color: Colors.red,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '35% Sell ',
                style: CustomThemeData.generateStyle(
                  fontSize: 13,
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                ),
              ),
            ],
          ),
        ),
        // const Spacer(
        //   flex: 1,
        // ),
        horizontalSpaceXSmall(context),
        iconButton ??
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 21,
                height: 21,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: isDarkMode ? Colors.white70 : Colors.black45,
                      width: 2),
                ),
                child: Center(
                    child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 10,
                  color: isDarkMode ? Colors.white70 : Colors.black45,
                )),
              ),
            )
      ],
    );
  }
}
