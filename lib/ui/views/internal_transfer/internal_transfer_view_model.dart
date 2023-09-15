import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/ui/widgets/internal_transfer/app_bar.dart';
import 'package:meta_trader/ui/widgets/internal_transfer/select_account.dart';
import 'package:meta_trader/ui/widgets/internal_transfer/select_destination.dart';

enum InternalAccountPageEnum {
  selectAccount,
  selectDestination,
}

class InternalTransferViewModel extends CustomBaseViewModel {
  InternalAccountPageEnum _internalTransferPageEnum =
      InternalAccountPageEnum.selectAccount;
  InternalAccountPageEnum get internalTransferPageEnum =>
      _internalTransferPageEnum;

  int _account = 0;
  int get account => _account;

  int _account2 = 0;
  int get account2 => _account2;

  set setAccount2(int e) {
    _account2 = e;
    rebuildUi();
  }

  set setAccount(int e) {
    _account = e;
    rebuildUi();
  }

  set setInternalAccountPageEnum(InternalAccountPageEnum e) {
    _internalTransferPageEnum = e;
    rebuildUi();
  }

  AppBar? returnAppbar(BuildContext context) {
    switch (_internalTransferPageEnum) {
      case InternalAccountPageEnum.selectAccount:
        return internalAccountAppBar(
            context, 'Transfer Funds', 'Select account to send fund', this);
      case InternalAccountPageEnum.selectDestination:
        return internalAccountAppBar(context, 'Receiving Account',
            'Select account to receive fund', this);
      default:
        return null;
    }
  }

  Widget returnBody(BuildContext context) {
    switch (_internalTransferPageEnum) {
      case InternalAccountPageEnum.selectAccount:
        return SelectAccountInternalTransfer(
          model: this,
        );
      case InternalAccountPageEnum.selectDestination:
        return SelectDestinationInternalTransfer(
          model: this,
        );
      default:
        return Container();
    }
  }
}
