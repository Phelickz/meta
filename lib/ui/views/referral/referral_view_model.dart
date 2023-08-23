import 'package:flutter/material.dart';
import 'package:meta_trader/ui/widgets/referral/components/app_bar.dart';

import '../../../app/core/custom_base_view_model.dart';
import '../../widgets/referral/referral.dart';

enum ReferralStateEnum { unVerified, halfVerified, verified }

class ReferralViewModel extends CustomBaseViewModel {
  Future<void> init() async {}

  String _referralCode = "23145620";
  String get referralCode => _referralCode;

  set referralCode(String referralCode) {
    _referralCode = referralCode;
    rebuildUi();
  }

  Widget returnPage() {
    return ReferralPage(model: this);
  }

  AppBar? returnAppBar(BuildContext context) {
    return referralAppBar(context, "Referral Program", this);
  }
}
