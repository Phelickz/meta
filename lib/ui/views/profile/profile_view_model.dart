import 'package:flutter/material.dart';
import 'package:meta_trader/ui/widgets/profile/components/verification_bar.dart';
import 'package:meta_trader/ui/widgets/profile/profile.dart';

import '../../../app/core/custom_base_view_model.dart';

enum ProfileStateEnum { unVerified, halfVerified, verified }

class ProfileViewModel extends CustomBaseViewModel {
  Future<void> init() async {}

  String _userName = "Susan";
  String get userName => _userName;

  String _rank = "Silver";
  String get rank => _rank;

  bool _isVerified = false;
  bool get isVerified => _isVerified;

  int _verificationState = 2;
  int get verificationState => _verificationState;

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

  set verificationState(int currentState) {
    _verificationState = currentState;
    rebuildUi();
  }

  ProfileStateEnum _profileStateEnum = ProfileStateEnum.verified;
  ProfileStateEnum get profileStateEnum => _profileStateEnum;

  set setProfileStateEnum(ProfileStateEnum e) {
    _profileStateEnum = e;
    rebuildUi();
  }

  Widget returnVerifiedBar() {
    switch (_profileStateEnum) {
      case ProfileStateEnum.unVerified:
        return VerificationBar(model: this);
      case ProfileStateEnum.halfVerified:
        return VerificationBar(model: this);
      case ProfileStateEnum.verified:
        return const SizedBox();
      default:
        return const SizedBox();
    }
  }

  Widget returnPage() {
    return ProfilePage(model: this);
  }

  AppBar? returnAppBar(BuildContext context) {
    return AppBar();
  }
}
