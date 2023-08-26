import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/utils/dimensions.dart';

class HelpAndSupportTile extends StatelessWidget {
  final String icon;
  final String title;

  const HelpAndSupportTile({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        width: 32.pWidth(context),
        height: 32.pHeight(context),
        child: SvgPicture.asset(icon),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Theme.of(context).primaryColor)),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
