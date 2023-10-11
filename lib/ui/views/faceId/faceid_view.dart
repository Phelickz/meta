// ignore_for_file: file_names

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/locator/locator.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/services/router_service.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/faceId/faceId_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

import '../../../app/responsiveness/res.dart';
import 'package:local_auth/local_auth.dart';

import '../../../app/router/router.gr.dart';

@RoutePage()
class FaceIDView extends StackedView<FaceIDViewModel> {
  const FaceIDView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    FaceIDViewModel viewModel,
    Widget? child,
  ) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
      isBusy: viewModel.isBusy,
      bodyPadding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 0),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpaceSmall(context),
            verticalSpaceMedium(context),
            SizedBox(
              height: McGyver.rsDoubleH(context, 50),
              width: McGyver.rsDoubleW(context, 80),
              child: SvgPicture.asset(
                "assets/icons/faceId.svg",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: McGyver.rsDoubleW(context, 4),
              ),
              child: Text(
                LocaleKeys.securityWidget_faceId_enableFaceId.tr(),
                textAlign: TextAlign.center,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2.6),
                  fontWeight: FontWeight.w700,
                  color: isDarkMode
                      ? const Color(0xFFF2F4F7)
                      : const Color(0xff475467),
                ),
              ).tr(),
            ),
            verticalSpaceSmall(context),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: McGyver.rsDoubleW(context, 4),
              ),
              child: Text(
                LocaleKeys.securityWidget_faceId_faceIdDescription.tr(),
                textAlign: TextAlign.center,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.8),
                  fontWeight: FontWeight.w500,
                  color: isDarkMode
                      ? const Color(0xff98A2B3)
                      : const Color(0xFF667085),
                ),
              ),
            ),
            verticalSpaceMedium(context),
            CustomButtons.generalButton(
              context: context,
              onTap: () async {
                final LocalAuthentication auth = LocalAuthentication();
                // ···
                final bool canAuthenticateWithBiometrics =
                    await auth.canCheckBiometrics;
                final bool canAuthenticate = canAuthenticateWithBiometrics ||
                    await auth.isDeviceSupported();

                if (canAuthenticate == true) {
                  final bool didAuthenticate = await auth.authenticate(
                    localizedReason:
                        LocaleKeys.securityWidget_faceId_faceIdDescription,
                    options: const AuthenticationOptions(
                        biometricOnly: true, stickyAuth: true),
                  );

                  if (didAuthenticate) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FaceIDSuccessful()));
                  }
                } else {
                  //show error
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const FaceIDNotSupportedDialog();
                      });
                }
              },
              text: LocaleKeys.securityWidget_faceId_continue.tr(),
            ),
            verticalSpaceXSmall(context),
            CustomButtons.outlineButton(
              context: context,
              onTap: () {
                Navigator.pop(context);
              },
              text: LocaleKeys.securityWidget_faceId_quit.tr(),
              textColor: Theme.of(context).primaryColor,
            ),
            verticalSpaceMedium(context),
          ],
        ),
      ),
    );
  }

  @override
  FaceIDViewModel viewModelBuilder(BuildContext context) => FaceIDViewModel();
}

class FaceIDNotSupportedDialog extends StatelessWidget {
  const FaceIDNotSupportedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        height: 192.pHeight(context),
        width: 300.pWidth(context),
        padding: EdgeInsets.symmetric(
            vertical: 24.pHeight(context), horizontal: 12.pWidth(context)),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.securityWidget_faceId_faceIdNotSupported,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
            ).tr(),
            SizedBox(height: 12.pHeight(context)),
            Text(
              LocaleKeys.securityWidget_faceId_faceIdNotSupportedDescription,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium,
            ).tr(),
            SizedBox(height: 24.pWidth(context)),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 38.pHeight(context),
                width: 154.pWidth(context),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red)),
                child: Center(
                  child: Text(
                    LocaleKeys.close,
                    style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 2),
                        color: Colors.red,
                        fontWeight: FontWeight.w500),
                  ).tr(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FaceIDNotEnrolled extends StatelessWidget {
  const FaceIDNotEnrolled({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        height: 170.pHeight(context),
        width: 300.pWidth(context),
        padding: EdgeInsets.symmetric(
            vertical: 24.pHeight(context), horizontal: 12.pWidth(context)),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.securityWidget_faceId_faceIdNotSupported,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
            ).tr(),
            SizedBox(height: 12.pHeight(context)),
            Text(
              LocaleKeys.securityWidget_faceId_faceIdNotEnrolled,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium,
            ).tr(),
            SizedBox(height: 24.pWidth(context)),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 38.pHeight(context),
                width: 154.pWidth(context),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red)),
                child: Center(
                  child: Text(
                    LocaleKeys.close,
                    style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 2),
                        color: Colors.red,
                        fontWeight: FontWeight.w500),
                  ).tr(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FaceIDSuccessful extends StatelessWidget {
  const FaceIDSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
      isBusy: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpaceSmall(context),
            verticalSpaceMedium(context),
            SizedBox(
              height: McGyver.rsDoubleH(context, 50),
              width: McGyver.rsDoubleW(context, 80),
              child: isDarkMode
                  ? Image.asset(
                      "assets/images/success_illustration_dark.png",
                      fit: BoxFit.contain,
                    )
                  : Image.asset(
                      "assets/images/success_illustration_light.png",
                    ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: McGyver.rsDoubleW(context, 4),
              ),
              child: Text(
                LocaleKeys.securityWidget_faceId_faceIdSuccess,
                textAlign: TextAlign.center,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2.6),
                  fontWeight: FontWeight.w700,
                  color: isDarkMode
                      ? const Color(0xFFF2F4F7)
                      : const Color(0xff475467),
                ),
              ).tr(),
            ),
            verticalSpaceSmall(context),
            verticalSpaceMedium(context),
            CustomButtons.generalButton(
              context: context,
              onTap: () async {
                final router = locator<RouterService>();
                router.router.replaceAll([const BottomNavBarRoute()]);
              },
              text: LocaleKeys.securityWidget_faceId_exit.tr(),
            ),
            verticalSpaceXSmall(context),
            CustomButtons.outlineButton(
              context: context,
              onTap: () {
                final router = locator<RouterService>();
                router.router.replaceAll([const BottomNavBarRoute()]);
              },
              text: LocaleKeys.securityWidget_faceId_disableFaceId.tr(),
              textColor: Theme.of(context).primaryColor,
            ),
            verticalSpaceMedium(context),
          ],
        ),
      ),
    );
  }
}
