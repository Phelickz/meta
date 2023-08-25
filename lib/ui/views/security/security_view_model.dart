import 'package:flutter/material.dart';
import 'package:meta_trader/ui/widgets/security/add_passkey.dart';
import 'package:meta_trader/ui/widgets/security/app_bar.dart';
import 'package:meta_trader/ui/widgets/security/auto_lock.dart';
import 'package:meta_trader/ui/widgets/security/email_verify.dart';
import 'package:meta_trader/ui/widgets/security/passkey.dart';
import 'package:meta_trader/ui/widgets/security/phone_verify.dart';
import 'package:meta_trader/ui/widgets/security/security_main.dart';

import '../../../../app/core/custom_base_view_model.dart';
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
}

class SecurityViewModel extends CustomBaseViewModel {
  SecurityPageEnum _securityPageEnum = SecurityPageEnum.main;
  SecurityPageEnum get securityPageEnum => _securityPageEnum;

  set securityPageEnum(SecurityPageEnum e) {
    _securityPageEnum = e;
    rebuildUi();
  }

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
      default:
        return Container();
    }
  }

  Widget returnAppBar(BuildContext context) {
    switch (_securityPageEnum) {
      case SecurityPageEnum.main:
        return securityAppBar(
          context,
          'Security',
          '',
          this,
        );
      case SecurityPageEnum.passkey:
        return securityAppBar(
          context,
          'Passkeys',
          '',
          this,
        );
      case SecurityPageEnum.emailVerify:
        return securityAppBar(
          context,
          '',
          '',
          this,
        );
      case SecurityPageEnum.autoLock:
        return securityAppBar(
          context,
          'Auto-Lock',
          'Enable to lock app automatically',
          this,
        );
      case SecurityPageEnum.password:
        return securityAppBar(
          context,
          'Change Password',
          '',
          this,
        );
      case SecurityPageEnum.devices:
        return securityAppBar(
          context,
          'Devices',
          '',
          this,
        );
      case SecurityPageEnum.addPasskey:
        return securityAppBar(
          context,
          'Add Passkey',
          '',
          this,
        );
      default:
        return Container();
    }
  }
}
