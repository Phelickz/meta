import 'package:flutter/material.dart';
import 'package:meta_trader/app/core/custom_base_view_model.dart';
import 'package:meta_trader/ui/widgets/provider/components/provider_appbar.dart';
import 'package:meta_trader/ui/widgets/provider/provider_confirmation.dart';
import 'package:meta_trader/ui/widgets/provider/provider_dashboard.dart';
import 'package:meta_trader/ui/widgets/provider/provider_login.dart';
import 'package:meta_trader/ui/widgets/provider/provider_signup.dart';
import 'package:meta_trader/ui/widgets/provider/welcome.dart';

enum ProviderPageEnum { welcome, signUp, confirmation, login, dashboard}
class ProviderViewModel extends CustomBaseViewModel{
  ProviderViewModel();

  ProviderPageEnum _providerPageEnum = ProviderPageEnum.dashboard;
  ProviderPageEnum get providerPageEnum => _providerPageEnum;
  bool checkbox = false;

  final summaryOneTabSelectorNotifier  = ValueNotifier(0);
  final summaryTwoTabSelectorNotifier  = ValueNotifier(0);
  final performanceTabSelectorNotifier  = ValueNotifier(0);
  final followersTabSelectorNotifier  = ValueNotifier(0);
  final overviewTabSelectedNotifier = ValueNotifier(0);

  List<CandleData> getCandleData() {
    return [
      CandleData('3 Sept 20:14', 50000, 70000, 60000, 55000),
      CandleData('3 Sept 20:24', 60000, 80000, 70000, 65000),
      CandleData('3 Sept 21:37', 60000, 80000, 70000, 65000),
      CandleData('3 Sept 21:50', 70000, 90000, 85000, 70000),
      CandleData('3 Sept 21:58', 70000, 80000, 65000, 40000),
      CandleData('3 Sept 00:34', 70000, 90000, 75000, 60000),
      CandleData('3 Sept 00:38', 80000, 90000, 80000, 60000),
      CandleData('3 Sept 00:39', 40000, 60000, 50000, 45000),
      CandleData('3 Sept 01:00', 40000, 60000, 50000, 45000),
      // Add more data points as needed
    ];
  }


  
  set setProviderPageEnum(ProviderPageEnum e){
    _providerPageEnum = e;
    rebuildUi();
  }
  
  void setTabNotifiier(int value){
    overviewTabSelectedNotifier.value=value;
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
      case ProviderPageEnum.dashboard:
        return SingleChildScrollView(child: ProviderDashboardPage(viewModel: this));
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
      case ProviderPageEnum.dashboard:
        return ProviderAppbar.appBarTwo(this, context);
    }
  }
}

class CandleData {
  final String date;
  final double low;
  final double high;
  final double open;
  final double close;

  CandleData(this.date, this.low, this.high, this.open, this.close);
}