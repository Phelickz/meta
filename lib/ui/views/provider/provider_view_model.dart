import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/ui/widgets/provider/components/provider_appbar.dart';
import 'package:meta_trader/ui/widgets/provider/provider_confirmation.dart';
import 'package:meta_trader/ui/widgets/provider/provider_login.dart';
import 'package:meta_trader/ui/widgets/provider/provider_signup.dart';
import 'package:meta_trader/ui/widgets/provider/welcome.dart';

enum ProviderPageEnum { welcome, signUp, confirmation, login}
class ProviderViewModel extends CustomBaseViewModel{
  ProviderViewModel();

  ProviderPageEnum _providerPageEnum = ProviderPageEnum.login;
  ProviderPageEnum get providerPageEnum => _providerPageEnum;
  bool checkbox = false;
  
  set setProviderPageEnum(ProviderPageEnum e){
    _providerPageEnum = e;
    rebuildUi();
  }

  void toggleCheckbox(){
    checkbox = !checkbox;
    rebuildUi();
  }


  Widget returnPage() {
    switch(_providerPageEnum){
      case ProviderPageEnum.welcome:
        return WelcomePage(viewModel: this);
      case ProviderPageEnum.signUp:
        return SingleChildScrollView(child: ProviderSignUpPage(viewModel: this));
      case ProviderPageEnum.confirmation:
        return ProviderConfirmationPage(viewModel: this);
      case ProviderPageEnum.login:
        return ProviderLoginPage(viewModel: this);
    }
  }

  AppBar? returnAppBar(BuildContext context){
    switch(_providerPageEnum){
      case ProviderPageEnum.welcome:
        return null;
      case ProviderPageEnum.signUp:
        return ProviderAppbar.simpleAppBar(this, context, "Sign up as a Provider", "Enter your information",IconButton(onPressed: (){}, icon: Icon(Icons.info_outline, color: isDarkMode()?Colors.white:Colors.black,)));
      case ProviderPageEnum.confirmation:
        return null;
      case ProviderPageEnum.login:
        return ProviderAppbar.simpleAppBar(this, context, "Provider Login", "Approved provider registration",null);
    }
  }
}