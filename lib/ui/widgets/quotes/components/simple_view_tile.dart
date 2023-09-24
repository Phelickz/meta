import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';

class SimpleViewTile extends StatefulWidget {
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
  State<SimpleViewTile> createState() => _SimpleViewTileState();
}

class _SimpleViewTileState extends State<SimpleViewTile> {
  bool _showStar = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 95.pWidth(context),
          child: Text(
            widget.currencyPair,
            style: CustomThemeData.generateColoredStyle(
                fontSize: McGyver.textSize(context, 2.2),
                fontWeight: FontWeight.bold,
                context: context),
          ),
        ),
        SizedBox(
          width: 19.pWidth(context),
        ),
        SizedBox(
          child: Text(
            widget.high,
            style: CustomThemeData.generateColoredStyle(
              fontSize: McGyver.textSize(context, 1.5),
              darkTextColor: const Color(0xff77C5F8),
              lightTextColor: const Color(0xff20A0F3),
              context: context,
            ),
          ),
        ),
        SizedBox(
          width: 24.pWidth(context),
        ),
        SizedBox(
          child: Text(
            widget.low,
            style: CustomThemeData.generateColoredStyle(
              fontSize: McGyver.textSize(context, 1.5),
              darkTextColor: const Color(0xffF97066),
              lightTextColor: const Color(0xffF04438),
              context: context,
            ),
          ),
        ),
        SizedBox(
          width: 42.pWidth(context),
        ),
        SizedBox(
          child: Text(
            widget.spread,
            style: CustomThemeData.generateColoredStyle(
                fontSize: McGyver.textSize(context, 1.5), context: context),
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            setState(() {
              _showStar = !_showStar;
            });
          },
          child: Icon(
            Icons.star,
            color: _showStar ? Colors.amber : Colors.grey,
          ),
        )
      ],
    );
  }
}
