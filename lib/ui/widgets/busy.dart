import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:meta_trader/app/utils/theme.dart';

import '../../app/responsiveness/res.dart';

class Busy extends StatelessWidget {
  final String? text;
  const Busy({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = CustomThemeData.isDarkMode(context);
    return Stack(
      children: [
        Container(
          color: isDarkMode
              ? const Color(0xff073961).withOpacity(0.5)
              : Colors.white60,
          height: McGyver.rsDoubleH(context, 100),
        ),
        const Busy1(),
      ],
    );
  }
}

class Busy1 extends StatelessWidget {
  final String? text;

  const Busy1({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = CustomThemeData.isDarkMode(context);
    return Center(
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          width: text != null ? 80.0 : 80.0,
          height: 80.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isDarkMode ? const Color(0xff073961) : Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SpinKitFadingFour(
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
