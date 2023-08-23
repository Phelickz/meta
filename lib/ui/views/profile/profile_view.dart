import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/ui/views/profile/profile_view_model.dart';
import 'package:meta_trader/ui/widgets/profile/profile_bar.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

@RoutePage(name: "ProfileRoute")
class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return Skeleton(
      isBusy: viewModel.isBusy,
      bodyPadding: EdgeInsets.zero,
      appBar: profileAppBar(
        viewModel.userName,
        viewModel.rank,
        viewModel.isVerified,
        context,
        viewModel,
      ),
      body: SafeArea(
        child: viewModel.returnPage(),
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();
}
