import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/theme.dart';

class SearchQuotesTile extends StatelessWidget {
  final String title, subtitle;
  final void Function()? onPressed;
  const SearchQuotesTile(
      {Key? key, required this.title, required this.subtitle, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SvgPicture.asset(AssetManager.folder),
      title: Text(
        title,
        style: CustomThemeData.generateColoredStyle(
            fontSize: 16, fontWeight: FontWeight.bold, context: context),
      ),
      subtitle: Text(
        subtitle,
        style: CustomThemeData.generateColoredStyle(
            fontSize: 10, context: context),
      ),
      trailing: SvgPicture.asset(AssetManager.forwardArrow),
    );
  }
}
