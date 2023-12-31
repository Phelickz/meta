// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/capitalize.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/auth/auth_view.dart';
import 'package:meta_trader/ui/views/profile/profile_view_model.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';

// class ProfileBar extends StatelessWidget {
//   final String name;
//   final String rank;
//   final bool isVerified;
//   const ProfileBar(
//       {Key? key,
//       required this.name,
//       required this.rank,
//       required this.isVerified})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var isDarkMode = CustomThemeData.isDarkMode(context);

//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: McGyver.rsDoubleW(context, 6)),
//       height: 100.pHeight(context),
//       color: isDarkMode
//           ? ColorManager.darkHeaderColor
//           : ColorManager.lightHeaderColor,
//       child: Row(
//         children: [
//           const CircleAvatar(
//             backgroundImage: AssetImage(AssetManager.profile),
//           ),
//           SizedBox(
//             width: 7.pWidth(context),
//           ),
//           Center(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Susan Blake",
//                   style: CustomThemeData.generateStyle(
//                     fontSize: 14,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 3.pHeight(context),
//                 ),
//                 Row(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: 2.pWidth(context),
//                           vertical: 2.pHeight(context)),
//                       decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(12)),
//                       child: Row(
//                         children: [
//                           Container(
//                             height: 24.pHeight(context),
//                             width: 24.pWidth(context),
//                             padding: EdgeInsets.symmetric(
//                                 vertical: 4.pHeight(context)),
//                             child: SvgPicture.asset(AssetManager.crown),
//                           ),
//                           SizedBox(
//                             width: 1.pWidth(context),
//                           ),
//                           Text(
//                             rank,
//                             style: CustomThemeData.generateStyle(
//                               fontSize: McGyver.textSize(context, 1.6),
//                               color: Colors.white,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 3.pWidth(context),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: 5.pWidth(context),
//                     ),
//                     Container(
//                       width: 6,
//                       height: 6,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 5.pWidth(context),
//                     ),
//                     isDarkMode
//                         ? Text(
//                             isVerified ? "Verified " : "Unverified",
//                             style: CustomThemeData.generateStyle(
//                               fontSize: 8,
//                               color: Colors.red,
//                             ),
//                           )
//                         : Container(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 5.pWidth(context),
//                                 vertical: 5.pHeight(context)),
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(12)),
//                             child: Row(
//                               children: [
//                                 Text(
//                                   isVerified ? "Verified" : "Unverified",
//                                   style: CustomThemeData.generateStyle(
//                                     fontSize: 8,
//                                     color:
//                                         isVerified ? Colors.green : Colors.red,
//                                   ),
//                                 ),
//                                 isVerified
//                                     ? const SizedBox()
//                                     : Icon(
//                                         Icons.warning_amber_outlined,
//                                         color: Colors.red,
//                                         size: 16.pWidth(context),
//                                       )
//                               ],
//                             ),
//                           )
//                   ],
//                 )
//               ],
//             ),
//           ),
//           const Spacer(),
//           SizedBox(
//             width: 20.pWidth(context),
//             height: 20.pHeight(context),
//             child: InkWell(
//               onTap: () {},
//               child: SvgPicture.asset(
//                 AssetManager.settings,
//                 color: Colors.white,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

PreferredSize profileAppBar(
  String name,
  String rank,
  bool isVerified,
  BuildContext context,
  ProfileViewModel model,
) {
  var isDarkMode = CustomThemeData.isDarkMode(context);
  return PreferredSize(
    preferredSize: Size.fromHeight(
      McGyver.rsDoubleH(context, Platform.isIOS ? 8 : 10),
    ),
    child: AppBar(
      backgroundColor:
          isDarkMode ? const Color(0xff052844) : Theme.of(context).primaryColor,
      automaticallyImplyLeading: false,
      toolbarHeight: Platform.isIOS ? kToolbarHeight + 10 : kToolbarHeight + 20,
      elevation: 0,
      actions: [
        SizedBox(
          width: 20.pWidth(context),
          height: 20.pHeight(context),
          child: InkWell(
            onTap: () {
              model.push(const SettingsRoute());
            },
            child: SvgPicture.asset(
              AssetManager.settings,
              color: Colors.white,
            ),
          ),
        ),
        horizontalSpaceSmall(context),
      ],
      title: GestureDetector(
        onTap: () {
          model.push(const ManageAccountRoute());
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 27,
                backgroundImage: AssetImage(
                  'assets/images/avi.png',
                ),
                backgroundColor: Colors.white,
              ),
              horizontalSpaceXSmall(context),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.welcome,
                    style: CustomThemeData.generateStyle(
                      fontSize: 18,
                      color: isDarkMode ? Colors.white : Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ).tr(args: [' ${model.userName}']),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: isDarkMode
                                ? Colors.black
                                : const Color(0xff101828),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7.0, vertical: 3),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 10,
                                child: SvgPicture.asset(
                                    'assets/images/silver.svg'),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                model.rank,
                                style: CustomThemeData.generateStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w500,
                                    color: isDarkMode
                                        ? Colors.white
                                        : const Color(0xffD0D5DD)),
                              )
                            ],
                          ),
                        ),
                      ),
                      horizontalSpaceXSmall(context),
                      isDarkMode
                          ? Text(
                              isDemo.value == true
                                  ? LocaleKeys.demo
                                  : isVerified
                                      ? LocaleKeys.verified.tr()
                                      : LocaleKeys.unVerified.tr(),
                              style: CustomThemeData.generateStyle(
                                fontSize: 14,
                                color: isDemo.value == true
                                    ? Theme.of(context).primaryColor
                                    : Colors.red[400]!,
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 7),
                                child: Row(
                                  children: [
                                    Text(
                                      isDemo.value == true
                                          ? LocaleKeys.demo.tr().capitalize()
                                          : isVerified
                                              ? LocaleKeys.verified.tr()
                                              : LocaleKeys.unVerified.tr(),
                                      style: CustomThemeData.generateStyle(
                                        fontSize: 9,
                                        color: isDemo.value == true
                                            ? Theme.of(context).primaryColor
                                            : isVerified
                                                ? Colors.green
                                                : Colors.red,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    isVerified
                                        ? const SizedBox()
                                        : Icon(
                                            Icons.info_outline,
                                            color: isDemo.value == true
                                                ? Theme.of(context).primaryColor
                                                : Colors.red,
                                            size: 12.pWidth(context),
                                          )
                                  ],
                                ),
                              ),
                            ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
