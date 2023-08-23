import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';
import 'auth_view_model.dart';

@RoutePage(name: "AuthRoute")
class AuthView extends StackedView<AuthViewModel> {
  const AuthView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    AuthViewModel viewModel,
    Widget? child,
  ) {
    return Skeleton(
      isBusy: viewModel.isBusy,
      bodyPadding: EdgeInsets.zero,
      appBar: viewModel.returnAppBar(context),
      body: viewModel.returnPage(),
    );
  }

  @override
  AuthViewModel viewModelBuilder(BuildContext context) => AuthViewModel();
}
