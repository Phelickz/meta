import 'package:flutter/material.dart';
import 'package:meta_trader/ui/widgets/profile/profile.dart';

import '../../../app/core/custom_base_view_model.dart';

enum ProfileStateEnum { unVerified, halfVerified, verified }

class ProfileViewModel extends CustomBaseViewModel {
  Future<void> init() async {}

  Widget returnPage() {
    return ProfilePage(model: this);
  }

  AppBar? returnAppBar(BuildContext context) {}
}
