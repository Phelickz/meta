import 'package:flutter/material.dart';
import 'package:meta_trader/ui/widgets/profile/profile.dart';

import '../../../app/core/custom_base_view_model.dart';

enum ProfileStateEnum { unVerified, halfVerified, verified }

class ProfileViewModel extends CustomBaseViewModel {
  Future<void> init() async {}

  String _userName = "Susan Blake";
  String get userName => _userName;

  String _rank = "Silver";
  String get rank => _rank;

  bool _isVerified = false;
  bool get isVerified => _isVerified;

  set userName(String name) {
    _userName = name;
    rebuildUi();
  }

  set rank(String ranking) {
    _rank = ranking;
    rebuildUi();
  }

  set isVerified(bool verification) {
    _isVerified = verification;
    rebuildUi();
  }

  Widget returnPage() {
    return ProfilePage(model: this);
  }

  AppBar? returnAppBar(BuildContext context) {}
}
