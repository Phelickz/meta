import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/startup/startup_view_model.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

import '../../../app/responsiveness/res.dart';
import '../../widgets/startup/background.dart';

@RoutePage()
class StartupView extends StackedView<StartupViewModel> {
  const StartupView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
        isBusy: viewModel.isBusy,
        bodyPadding: EdgeInsets.symmetric(
          horizontal: McGyver.rsDoubleW(context, 0),
        ),
        body: Stack(
          children: [
            const BackgroundContainer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/launcher.png',
                    height: 100,
                  ),
                  // child: SvgPicture.asset(
                  //   'assets/images/logo.svg',
                  //   height: 50,
                  //   color: Colors.red,
                  // ),
                ),
                verticalSpaceXXSmall(context),
                Text(
                  'AioTrader',
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 2),
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? ColorManager.darkText
                        : ColorManager.lightText,
                  ),
                )
              ],
            )
          ],
        ));
  }

  @override
  StartupViewModel viewModelBuilder(BuildContext context) => StartupViewModel();
}
