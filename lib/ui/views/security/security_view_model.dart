import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/security/add_passkey.dart';
import 'package:meta_trader/ui/widgets/security/auto_lock.dart';
import 'package:meta_trader/ui/widgets/security/email_verified_success.dart';
import 'package:meta_trader/ui/widgets/security/email_verify.dart';
import 'package:meta_trader/ui/widgets/security/passkey.dart';
import 'package:meta_trader/ui/widgets/security/passkey_added_success.dart';
import 'package:meta_trader/ui/widgets/security/phone_verified_success.dart';
import 'package:meta_trader/ui/widgets/security/phone_verify.dart';
import 'package:meta_trader/ui/widgets/security/security_main.dart';

import '../../../../app/core/custom_base_view_model.dart';
import '../../widgets/security/add_passkey_enter.dart';
import '../../widgets/security/components/app_bar.dart';
import '../../widgets/security/devices.dart';
import '../../widgets/security/password.dart';

enum SecurityPageEnum {
  main,
  passkey,
  autoLock,
  devices,
  phoneVerify,
  emailVerify,
  password,
  addPasskey,
  addPasskeyEnter,
  passkeyAddedSuccess,
  emailVerifySuccess,
  phoneVerifySuccess,
}

class SecurityViewModel extends CustomBaseViewModel {
  SecurityPageEnum _securityPageEnum = SecurityPageEnum.main;
  SecurityPageEnum get securityPageEnum => _securityPageEnum;

  set securityPageEnum(SecurityPageEnum e) {
    _securityPageEnum = e;
    rebuildUi();
  }

  bool isPatternLockEnabled = false;
  bool isFaceLockEnabled = false;

  void onPatternLockChanged(bool val) {
    isPatternLockEnabled = val;
    rebuildUi();
  }

  void onFaceLockChanged(bool val) {
    isFaceLockEnabled = val;
    rebuildUi();
  }

  bool get isPasskeyEmpty => true;

  Widget returnPage() {
    switch (_securityPageEnum) {
      case SecurityPageEnum.main:
        return SecurityMainPage(model: this);
      case SecurityPageEnum.passkey:
        return PasskeyPage(model: this);
      case SecurityPageEnum.autoLock:
        return AutoLockPage(model: this);
      case SecurityPageEnum.devices:
        return DevicesPage(model: this);
      case SecurityPageEnum.phoneVerify:
        return PhoneVerificationPage(model: this);
      case SecurityPageEnum.emailVerify:
        return EmailVerificationPage(model: this);
      case SecurityPageEnum.password:
        return PasswordPage(model: this);
      case SecurityPageEnum.addPasskey:
        return AddPasskeyPage(model: this);
      case SecurityPageEnum.addPasskeyEnter:
        return AddPasskeyEnterPage(model: this);
      case SecurityPageEnum.passkeyAddedSuccess:
        return PasskeyAddedSuccessPage(model: this);
      case SecurityPageEnum.emailVerifySuccess:
        return EmailVerifiedSuccessPage(model: this);
      case SecurityPageEnum.phoneVerifySuccess:
        return PhoneVerifiedSuccessPage(model: this);
      default:
        return Container();
    }
  }

  PreferredSizeWidget? returnAppBar(BuildContext context) {
    switch (_securityPageEnum) {
      case SecurityPageEnum.main:
        return securityAppBar2(
          context,
          LocaleKeys.security.tr(),
          '',
          this,
        );
      case SecurityPageEnum.passkey:
        return securityAppBar2(
          context,
          LocaleKeys.passKeys.tr(),
          '',
          this,
        );

      case SecurityPageEnum.emailVerify:
        return securityAppBar2(
          context,
          '',
          '',
          this,
        );
      case SecurityPageEnum.autoLock:
        return securityAppBar2(
          context,
          LocaleKeys.views_security_autoLock.tr(),
          LocaleKeys.views_security_enableToLock.tr(),
          this,
        );
      case SecurityPageEnum.password:
        return securityAppBar2(
          context,
          LocaleKeys.changePassword.tr(),
          '',
          this,
        );
      case SecurityPageEnum.devices:
        return securityAppBar2(
          context,
          LocaleKeys.devices.tr(),
          '',
          this,
        );
      case SecurityPageEnum.addPasskey:
      case SecurityPageEnum.addPasskeyEnter:
        return securityAppBar2(
          context,
          LocaleKeys.views_security_addPasskey.tr(),
          '',
          this,
        );
      default:
        return null;
    }
  }
}
