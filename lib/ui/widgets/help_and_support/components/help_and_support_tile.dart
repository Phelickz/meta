import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/utils/dimensions.dart';

class HelpAndSupportTile extends StatelessWidget {
  final String icon;
  final String title;
  final void Function()? onTap;

  const HelpAndSupportTile(
      {Key? key, required this.title, required this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        width: 32.pWidth(context),
        height: 32.pHeight(context),
        child: SvgPicture.asset(
          icon,
          color: Theme.of(context).primaryColor,
        ),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          // border: Border.all(color: Theme.of(context).primaryColor),
          color: Color(0xffD3ECFD),
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
