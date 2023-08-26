import 'package:flutter/material.dart';

import '../../../app/responsiveness/size.dart';
import '../../views/security/security_view_model.dart';
import 'auto_lock_tile.dart';

class AutoLockPage extends StatelessWidget {
  final SecurityViewModel model;
  const AutoLockPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpaceXSmall(context),
        AutoLockTile(
          onChanged: model.onPatternLockChanged,
          assetName: "assets/images/routing_2.svg",
          title: "Pattern",
          subtitle: "using pattern to unlock app",
          value: model.isPatternLockEnabled,
        ),
        AutoLockTile(
          onChanged: model.onFaceLockChanged,
          assetName: "assets/images/user_octagon.svg",
          title: "Face lock",
          subtitle: "using your face to unlock app",
          value: model.isFaceLockEnabled,
        )
      ],
    );
  }
}
