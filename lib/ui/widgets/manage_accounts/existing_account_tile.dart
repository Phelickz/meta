import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/widgets/manage_accounts/manage_accounts/broker_logo.dart';

class ExistingAccountTile extends StatefulWidget {
  final String brokerLogoPath, title, subtitle;
  ExistingAccountTile({super.key, required this.brokerLogoPath, required this.title, required this.subtitle});

  @override
  State<ExistingAccountTile> createState() => _ExistingAccountTileState();
}

class _ExistingAccountTileState extends State<ExistingAccountTile> {
  // late Color color;

  @override
  void initState() {
    // color = Theme.of(context).scaffoldBackgroundColor;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return InkWell(
      onTap: () {
        setState(() {
          // color = isDarkMode ? ColorManager.darkHeaderColor : ColorManager.lightHeaderColor;
        });
      },
      child: Container(
        // color: color,
        padding: EdgeInsets.symmetric(horizontal: 4.pWidth(context), vertical: 18.pHeight(context)),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BorkerLogo(brokerLogoPath: widget.brokerLogoPath,xheight: 30.pHeight(context),),
            SizedBox(width: 16.pWidth(context),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 160,
                  // height: 35,
                  child: Text(widget.title,
                  overflow: TextOverflow.ellipsis,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.7),
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.pHeight(context)
                ),
                Text(widget.subtitle,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1),
                  color: ColorManager.lightHeaderColor,
                  fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              height: 22,
              width: 22,
              child: SvgPicture.asset(AssetManager.infoCircle, color: Colors.black,)),
          ],
        ),
      ),
    );
  }
}