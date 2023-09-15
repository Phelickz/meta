import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/onboarding/onboarding_four.dart';
import 'package:meta_trader/ui/widgets/onboarding/onboarding_three.dart';
import 'package:meta_trader/ui/widgets/onboarding/onboarding_two.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/utils/theme.dart';
import '../../widgets/onboarding/onboarding_one.dart';
import '../../widgets/startup/background.dart';
import 'onboarding_view_model.dart';

@RoutePage()
class OnboardingView extends StackedView<OnboardingViewModel> {
  const OnboardingView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    OnboardingViewModel viewModel,
    Widget? child,
  ) {
    // getThemeManager(context).setThemeMode(ThemeMode.light);
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Skeleton(
        isBusy: viewModel.isBusy,
        bodyPadding: EdgeInsets.symmetric(
          horizontal: McGyver.rsDoubleW(context, 0),
        ),
        body: Stack(
          children: [
            const BackgroundContainer(),
            Column(
              children: [
                Expanded(
                  flex: Platform.isAndroid ? 14 : 10,
                  child: ValueListenableBuilder<int>(
                    valueListenable: viewModel.counter,
                    builder: (context, currentPage, child) {
                      return PageView.builder(
                        controller: viewModel.pageController,
                        onPageChanged: (int num) {
                          viewModel.incrementCounter(num, false);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          final onPage = index - currentPage;
                          final transitionValue = onPage.toDouble();
                          final opacity =
                              1 - transitionValue.abs().clamp(0.0, 1.0);

                          return Opacity(
                            opacity: opacity,
                            child: Transform.translate(
                              offset: Offset(
                                  transitionValue *
                                      MediaQuery.of(context).size.width,
                                  0),
                              child: [
                                const OnboardingOne(),
                                const OnboardingTwo(),
                                const OnboardingThree(),
                                const OnboardingFour(),
                              ][index],
                            ),
                          );
                        },
                        itemCount: 4, // Number of onboarding pages
                      );
                    },
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    onboardingCircle(viewModel, context, isDarkMode, 0),
                    horizontalSpaceXSmall(context),
                    onboardingCircle(viewModel, context, isDarkMode, 1),
                    horizontalSpaceXSmall(context),
                    onboardingCircle(viewModel, context, isDarkMode, 2),
                    horizontalSpaceXSmall(context),
                    onboardingCircle(viewModel, context, isDarkMode, 3),
                  ],
                ),
                const Spacer(
                  flex: 1,
                ),
                CustomButtons.generalButton(
                    context: context,
                    onTap: () {
                      if (viewModel.counter.value < 3) {
                        viewModel.incrementCounter(
                            viewModel.counter.value + 1, true);
                      } else {
                        viewModel.push(const AuthRoute());
                      }
                    },
                    text: 'Next'),
                Platform.isIOS
                    ? verticalSpaceMedium(context)
                    : verticalSpaceSmall(context)
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  OnboardingViewModel viewModelBuilder(BuildContext context) =>
      OnboardingViewModel();

  Container onboardingCircle(OnboardingViewModel viewModel,
      BuildContext context, bool isDarkMode, int value) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: viewModel.counter.value == value
            ? Theme.of(context).primaryColor
            : (isDarkMode ? const Color(0xff98A2B3) : const Color(0xffD0D5DD)),
      ),
    );
  }
}
