// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/verification/email_verify_success.dart';
import 'package:meta_trader/ui/widgets/verification/identity_verification_landing.dart';
import 'package:meta_trader/ui/widgets/verification/identity_verification_success.dart';

import '../../widgets/verification/app_bar.dart';
import '../../widgets/verification/email_verification.dart';
import '../../widgets/verification/select_identiy.dart';
import '../../widgets/verification/verify_landing.dart';
import '../../widgets/verification/verify_one.dart';

enum VerificationPageEnum {
  verifyOne,
  verifyLanding,
  emailVerification,
  emailVerifySuccess,
  identityVerificationLanding,
  selectIdentity,
  cameraCapture,
  identityVerificaitonSuccess
}

enum IdentityType {
  nationalIDCard,
  driverLicense,
  internationalPassport,
}

class VerificationViewModel extends CustomBaseViewModel {
  VerificationPageEnum _verificationPageEnum = VerificationPageEnum.verifyOne;
  VerificationPageEnum get verificationPageEnum => _verificationPageEnum;

  IdentityType _identityType = IdentityType.driverLicense;
  IdentityType get identityType => _identityType;

  String? _radioItem;
  String? get radioItem => _radioItem;

  set setRadio(String val) {
    _radioItem = val;
    rebuildUi();
  }

  set setVerificationViewEnum(VerificationPageEnum e) {
    _verificationPageEnum = e;
    rebuildUi();
  }

  set setIdentityTypeEnum(IdentityType e) {
    _identityType = e;
    rebuildUi();
  }

  Widget returnPage() {
    switch (_verificationPageEnum) {
      case VerificationPageEnum.verifyOne:
        return VerifyOnePage(
          model: this,
        );
      case VerificationPageEnum.verifyLanding:
        return VerifyLandingPage(
          model: this,
        );
      case VerificationPageEnum.emailVerification:
        return EmailVerificationPage(
          model: this,
        );
      case VerificationPageEnum.emailVerifySuccess:
        return EmailVerifySuccessPage(
          model: this,
        );
      case VerificationPageEnum.identityVerificationLanding:
        return IdentityVerificationLandingPage(
          model: this,
        );
      case VerificationPageEnum.selectIdentity:
        return SelectIdentityPage(model: this);
      case VerificationPageEnum.identityVerificaitonSuccess:
        return IdentityVerificationSuccessPage(model: this);
      default:
        return Container();
    }
  }

  AppBar? returnAppBar(BuildContext context) {
    switch (_verificationPageEnum) {
      case VerificationPageEnum.verifyLanding:
        return verifyAppBar(context, LocaleKeys.verifyAccount,
            LocaleKeys.views_providerView_enterYourInformation, this);
      case VerificationPageEnum.selectIdentity:
        return verifyAppBar(
            context,
            LocaleKeys.views_verificationView_VerifyIdentity,
            LocaleKeys.views_verificationView_selectIdToCapture,
            this);
      default:
        return null;
    }
  }
}
