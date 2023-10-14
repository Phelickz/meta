import 'dart:async';

import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/app/locator/locator.dart';
import 'package:meta_trader/app/services/snackbar_service.dart';
import 'package:meta_trader/app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasscodeViewModel extends CustomBaseViewModel {
  PasscodeViewModel() {
    getPasscode().then((value) {
      _currentPasscode = value;
      rebuildUi();
    });
  }

  final StreamController<bool> verificationNotifier =
      StreamController<bool>.broadcast();

  final snackBar = locator<SnackBarService>();

  String? _currentPasscode;
  String? get currentPasscode => _currentPasscode;

  String _firstPasscode = "";
  String get firstPasscode => _firstPasscode;

  String _secondPasscode = "";
  String get secondPasscode => _secondPasscode;

  set setFirstPasscode(String value) {
    _firstPasscode = value;
    rebuildUi();
  }

  set setSecondPasscode(String value) {
    _secondPasscode = value;
    rebuildUi();
  }

  Future<void> savePasscode() async {
    // save passcode in shared preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(Constants.passcode, _secondPasscode);
  }

  // delete passcode
  Future<void> deletePasscode() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(Constants.passcode);
    _currentPasscode = null;
    rebuildUi();
  }

  // get passcode
  Future<String?> getPasscode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(Constants.passcode);
  }
}
