import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: McGyver.rsDoubleH(context, 100),
      width: McGyver.rsDoubleW(context, 100),
      // TODO add image
      color: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
