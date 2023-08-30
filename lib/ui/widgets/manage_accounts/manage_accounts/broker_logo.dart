// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';

class BorkerLogo extends StatelessWidget {
  final String brokerLogoPath;
  double? height;
  BorkerLogo({super.key, required this.brokerLogoPath, double? xheight}) {
    height = xheight ?? 28;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height!.pHeight(context),
      width: height!.pWidth(context),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(brokerLogoPath),
        ),
        border: Border.all(
          color: Theme.of(context).secondaryHeaderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10.pWidth(context)),
      ),
    );
  }
}
