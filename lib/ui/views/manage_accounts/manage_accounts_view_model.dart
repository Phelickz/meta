import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';

class ManageAccountViewModel extends CustomBaseViewModel {
  // ignore: non_constant_identifier_names
  List brokers_list = [
    {
      "type": "Real",
      "Balance": "50000",
      "email": "vikij***@gmail.com",
      "brokerImage": AssetManager.brokerLogo,
      "details": "3329617 - FXTM - Demo"
    },
    {
      "type": "Demo",
      "Balance": "120000",
      "email": "vikij***@gmail.com",
      "brokerImage": AssetManager.brokerLogo,
      "details": "3329617 - FXPro - Demo"
    },
    {
      "type": "Real",
      "Balance": "50000",
      "email": "vikij***@gmail.com",
      "brokerImage": AssetManager.brokerLogo,
      "details": "3329617 - FXTM - Demo"
    }
  ];

  List existingAccount = [
    {
      "title": "Deriv Limited",
      "subtile": "Deriv",
      "brokerLogoPath": AssetManager.brokerLogo
    },
    {
      "title": "FXTM ECN",
      "subtile": "ForexTime FXTM",
      "brokerLogoPath": AssetManager.brokerLogo
    },
    {
      "title": "FxPro",
      "subtile": "FxPro",
      "brokerLogoPath": AssetManager.brokerLogo
    },
    {
      "title": "Wonderinterest Trading Plc.",
      "subtile": "Wonderinterest",
      "brokerLogoPath": AssetManager.brokerLogo
    },
    {
      "title": "Pepperstone",
      "subtile": "Pepperstone",
      "brokerLogoPath": AssetManager.brokerLogo
    },
    {
      "title": "FXCM",
      "subtile": "Forex Capital Markets",
      "brokerLogoPath": AssetManager.brokerLogo
    },
  ];

  bool _savePassword = false;
  bool get savePassword => _savePassword;

  set setSavePassword(bool val) {
    _savePassword = !_savePassword;
    rebuildUi();
  }
}
