import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';

import '../../../app/responsiveness/size.dart';
import '../../views/security/security_view_model.dart';
import 'components/auto_lock_tile.dart';

class AutoLockPage extends StatelessWidget {
  final SecurityViewModel model;
  const AutoLockPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpaceSmall(context),
        AutoLockTile(
          onChanged: model.onPatternLockChanged,
          assetName: "assets/images/routing_2.svg",
          title: LocaleKeys.pattern.tr(),
          subtitle: LocaleKeys.securityWidget_autoLockWidget_usingPattern.tr(),
          value: model.isPatternLockEnabled,
        ),
        verticalSpaceXSmall(context),
        AutoLockTile(
          onChanged: model.onFaceLockChanged,
          assetName: "assets/images/user_octagon.svg",
          title: LocaleKeys.securityWidget_autoLockWidget_faceUnlock.tr(),
          subtitle: LocaleKeys.securityWidget_autoLockWidget_usingYourFace.tr(),
          value: model.isFaceLockEnabled,
        )
      ],
    );
  }
}
