import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/colorManager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/utils/theme.dart';

class ProfileBar extends StatelessWidget {
  final String name;
  final String rank;
  final bool isVerified;
  const ProfileBar(
      {Key? key,
      required this.name,
      required this.rank,
      required this.isVerified})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: McGyver.rsDoubleW(context, 6)),
      height: 100.pHeight(context),
      color: isDarkMode
          ? ColorManager.darkHeaderColor
          : ColorManager.lightHeaderColor,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(AssetManager.profile),
          ),
          SizedBox(
            width: 7.pWidth(context),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Susan Blake",
                  style: CustomThemeData.generateStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 3.pHeight(context),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2.pWidth(context),
                          vertical: 2.pHeight(context)),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          Container(
                            height: 24.pHeight(context),
                            width: 24.pWidth(context),
                            padding: EdgeInsets.symmetric(
                                vertical: 4.pHeight(context)),
                            child: SvgPicture.asset(AssetManager.crown),
                          ),
                          SizedBox(
                            width: 1.pWidth(context),
                          ),
                          Text(
                            rank,
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.6),
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 3.pWidth(context),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5.pWidth(context),
                    ),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 5.pWidth(context),
                    ),
                    isDarkMode
                        ? Text(
                            isVerified ? "Verified " : "Unverified",
                            style: CustomThemeData.generateStyle(
                              fontSize: 8,
                              color: Colors.red,
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.pWidth(context),
                                vertical: 5.pHeight(context)),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              children: [
                                Text(
                                  isVerified ? "Verified" : "Unverified",
                                  style: CustomThemeData.generateStyle(
                                    fontSize: 8,
                                    color:
                                        isVerified ? Colors.green : Colors.red,
                                  ),
                                ),
                                isVerified
                                    ? SizedBox()
                                    : Icon(
                                        Icons.warning_amber_outlined,
                                        color: Colors.red,
                                        size: 16.pWidth(context),
                                      )
                              ],
                            ),
                          )
                  ],
                )
              ],
            ),
          ),
          Spacer(),
          SizedBox(
            width: 20.pWidth(context),
            height: 20.pHeight(context),
            child: InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                AssetManager.settings,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
