import 'package:flutter/material.dart';
import 'package:meta_trader/ui/views/startup/startup_view_model.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

import '../../../app/responsiveness/res.dart';
import '../../widgets/startup/background.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Skeleton(
        isBusy: viewModel.isBusy,
        bodyPadding: EdgeInsets.symmetric(
          horizontal: McGyver.rsDoubleW(context, 0),
        ),
        body: Stack(
          children: [
            const BackgroundContainer(),
            Align(
              alignment: Alignment.center,
              child: Image.asset('assets/images/logo.png'),
              // child: SvgPicture.asset(
              //   'assets/images/logo.svg',
              //   height: 50,
              //   color: Colors.red,
              // ),
            )
          ],
        ));
  }

  @override
  StartupViewModel viewModelBuilder(BuildContext context) => StartupViewModel();
}
