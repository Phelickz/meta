import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FaceIDViewModel extends CustomBaseViewModel {
  FaceIDViewModel() {
    getFaceIdEnabled().then((value) {
      _isFaceIdEnabled = value ?? false;
      rebuildUi();
    });
  }

  bool _isFaceIdEnabled = false;
  bool get isFaceIdEnabled => _isFaceIdEnabled;

  set setIsFaceIdEnabled(bool value) {
    _isFaceIdEnabled = value;
    rebuildUi();
  }

  // save faceIdEnabled in sharedpreferences
  Future<void> saveFaceIdEnabled() async {
    // save faceIdEnabled in shared preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(Constants.faceIdEnabled, _isFaceIdEnabled);
  }

  // get faceIdEnabled
  Future<bool?> getFaceIdEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(Constants.faceIdEnabled);
  }

  // remove faceIdEnabled
  Future<void> removeFaceIdEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(Constants.faceIdEnabled);
    _isFaceIdEnabled = false;
    rebuildUi();
  }
}
