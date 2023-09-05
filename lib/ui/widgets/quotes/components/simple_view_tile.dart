import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';

class SimpleViewTile extends StatelessWidget {
  final String currencyPair, low, high, spread;
  final bool isFav;
  final void Function()? onPressed;
  const SimpleViewTile(
      {Key? key,
      required this.currencyPair,
      required this.low,
      required this.isFav,
      required this.spread,
      this.onPressed,
      required this.high})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 95.pWidth(context),
          child: Text(
            currencyPair,
            style: CustomThemeData.generateColoredStyle(
                fontSize: 16, fontWeight: FontWeight.bold, context: context),
          ),
        ),
        SizedBox(
          width: 29.pWidth(context),
        ),
        SizedBox(
          child: Text(high,
              style: CustomThemeData.generateColoredStyle(
                  fontSize: 10,
                  darkTextColor: Color(0xff77C5F8),
                  lightTextColor: Color(0xff20A0F3),
                  context: context)),
        ),
        SizedBox(
          width: 24.pWidth(context),
        ),
        SizedBox(
          child: Text(low,
              style: CustomThemeData.generateColoredStyle(
                  fontSize: 10,
                  darkTextColor: Color(0xffF97066),
                  lightTextColor: Color(0xffF04438),
                  context: context)),
        ),
        SizedBox(
          width: 32.pWidth(context),
        ),
        SizedBox(
          child: Text(
            spread,
            style: CustomThemeData.generateColoredStyle(
                fontSize: 10, context: context),
          ),
        ),
        Spacer(),
        InkWell(
          onTap: onPressed,
          child: Icon(
            Icons.star,
            color: isFav ? Colors.yellow : Colors.grey,
          ),
        )
      ],
    );
  }
}
