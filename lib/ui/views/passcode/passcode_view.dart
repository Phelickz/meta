import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/locator/locator.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/app/services/router_service.dart';
import 'package:meta_trader/app/utils/extension.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/passcode/passcode_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:stacked/stacked.dart';

@RoutePage()
class PasscodeView extends StackedView<PasscodeViewModel> {
  const PasscodeView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    PasscodeViewModel viewModel,
    Widget? child,
  ) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
      isBusy: viewModel.isBusy,
      // bodyPadding: EdgeInsets.symmetric(
      //   horizontal: McGyver.rsDoubleW(context, 8),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            verticalSpaceSmall(context),
            verticalSpaceMedium(context),
            verticalSpaceMedium(context),
            Container(
              height: McGyver.rsDoubleH(context, 30),
              width: McGyver.rsDoubleW(context, 70),
              padding: EdgeInsets.all(
                McGyver.rsDoubleH(context, 2),
              ),
              decoration: BoxDecoration(
                  color: isDarkMode
                      ? const Color(0xFF052844)
                      : const Color(0xFFD3ECFD),
                  borderRadius: BorderRadius.circular(
                    McGyver.rsDoubleH(context, 3),
                  )),
              child: SizedBox(
                  height: McGyver.rsDoubleH(context, 9.5),
                  width: McGyver.rsDoubleH(context, 9.5),
                  child: SvgPicture.asset("assets/images/shield_tick.svg")),
            ),
            verticalSpaceSmall(context),
            verticalSpaceMedium(context),
            // SizedBox(
            //     height: McGyver.rsDoubleH(context, 50),
            //     width: McGyver.rsDoubleW(context, 80),
            //     child: SvgPicture.asset("assets/images/shield_tick.svg")),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: McGyver.rsDoubleW(context, 4),
              ),
              child: Text(
                viewModel.currentPasscode != null &&
                        viewModel.currentPasscode!.isNotEmpty
                    ? LocaleKeys.securityWidget_passcode_disablePasscode.tr()
                    : LocaleKeys.securityWidget_passcode_enablePasscode.tr(),
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
            if (!viewModel.currentPasscode.isNullOrEmpty) ...[
              verticalSpaceMedium(context),
              CustomButtons.generalButton(
                context: context,
                onTap: () async {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        // backgroundColor:
                        //     isDarkMode ? const Color(0xff073961) : Colors.white,
                        title: Text(
                          LocaleKeys.securityWidget_passcode_disablePasscode
                              .tr(),
                          style: CustomThemeData.generateStyle(
                            fontSize: 18,
                            color: isDarkMode ? Colors.white : Colors.black87,
                          ),
                        ),
                        actions: <Widget>[
                          // usually buttons at the bottom of the dialog
                          TextButton(
                            child: Text(
                              LocaleKeys.cancel.tr(),
                              style: CustomThemeData.generateStyle(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            onPressed: () {
                              Navigator.maybePop(context);
                            },
                          ),
                          TextButton(
                            child: Text(
                              LocaleKeys.confirm.tr(),
                              style: CustomThemeData.generateStyle(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            onPressed: () {
                              viewModel.deletePasscode();
                              Navigator.maybePop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                text: LocaleKeys.securityWidget_passcode_disablePasscode.tr(),
              ),
              verticalSpaceXSmall(context),
              CustomButtons.outlineButton(
                context: context,
                onTap: () {
                  Navigator.pop(context);
                },
                text: LocaleKeys.securityWidget_passcode_quit.tr(),
                textColor: Theme.of(context).primaryColor,
              ),
              verticalSpaceMedium(context),
            ],
            if (viewModel.currentPasscode.isNullOrEmpty) ...[
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: McGyver.rsDoubleW(context, 4),
                ),
                child: Text(
                  LocaleKeys.securityWidget_passcode_passcodeDescription.tr(),
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
                  // _customColorsLockScreenButton(context, viewModel);
                  _showLockScreen(
                    context,
                    viewModel,
                    LocaleKeys.securityWidget_passcode_enterPasscode.tr(),
                    opaque: false,
                    first: true,
                    circleUIConfig: CircleUIConfig(
                        borderColor: isDarkMode ? Colors.white60 : Colors.black,
                        fillColor: Colors.blue,
                        circleSize: 30),
                    keyboardUIConfig: KeyboardUIConfig(
                      digitBorderWidth: 2,
                      primaryColor: isDarkMode ? Colors.white60 : Colors.black,
                      // keyboardSize: Size.fromHeight(400),
                      digitTextStyle: CustomThemeData.generateStyle(
                        fontSize: 30,
                        color: isDarkMode ? Colors.white60 : Colors.black,
                      ),
                    ),
                    cancelButton: const Icon(
                      Icons.arrow_back,
                      color: Colors.blue,
                    ),
                    // digits: ['一', '二', '三', '四', '五', '六', '七', '八', '九', '零'],
                  );
                },
                text: LocaleKeys.securityWidget_passcode_continue.tr(),
              ),
              verticalSpaceXSmall(context),
              CustomButtons.outlineButton(
                context: context,
                onTap: () {
                  Navigator.pop(context);
                },
                text: LocaleKeys.securityWidget_passcode_quit.tr(),
                textColor: Theme.of(context).primaryColor,
              ),
              verticalSpaceMedium(context),
            ],
          ],
        ),
      ),
    );
  }

  _showLockScreen(
    BuildContext context,
    PasscodeViewModel viewModel,
    String title, {
    required bool opaque,
    bool first = true,
    CircleUIConfig? circleUIConfig,
    KeyboardUIConfig? keyboardUIConfig,
    required Widget cancelButton,
    List<String>? digits,
  }) {
    bool isDarkMode = CustomThemeData.isDarkMode(context);
    Navigator.push(
        context,
        PageRouteBuilder(
          opaque: opaque,
          pageBuilder: (context, animation, secondaryAnimation) =>
              PasscodeScreen(
            title: Text(
              title,
              textAlign: TextAlign.center,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 2.8),
                fontWeight: FontWeight.w500,
                color: isDarkMode
                    ? const Color(0xFFF2F4F7)
                    : const Color(0xff475467),
              ),
            ),
            circleUIConfig: circleUIConfig,
            keyboardUIConfig: keyboardUIConfig,
            passwordEnteredCallback: (val) async {
              if (kDebugMode) {
                print(val);
              }

              if (first == true) {
                viewModel.setFirstPasscode = val;
                _showLockScreen(
                  context,
                  viewModel,
                  LocaleKeys.securityWidget_passcode_reenterPasscode.tr(),
                  opaque: false,
                  first: false,
                  circleUIConfig: CircleUIConfig(
                      borderColor: isDarkMode ? Colors.white60 : Colors.black,
                      fillColor: Colors.blue,
                      circleSize: 30),
                  keyboardUIConfig: KeyboardUIConfig(
                    digitBorderWidth: 2,
                    primaryColor: isDarkMode ? Colors.white60 : Colors.black,
                    // keyboardSize: Size.fromHeight(400),
                    digitTextStyle: CustomThemeData.generateStyle(
                      fontSize: 30,
                      color: isDarkMode ? Colors.white60 : Colors.black,
                    ),
                  ),
                  cancelButton: const Icon(
                    Icons.arrow_back,
                    color: Colors.blue,
                  ),
                  // digits: ['一', '二', '三', '四', '五', '六', '七', '八', '九', '零'],
                );
              } else {
                viewModel.setSecondPasscode = val;
                if (viewModel.firstPasscode == viewModel.secondPasscode) {
                  await viewModel.savePasscode();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const PasscodeSuccessful();
                  }));
                } else {
                  viewModel.snackBar.showSnackBar(LocaleKeys
                      .securityWidget_passcode_passcodeNotMatched
                      .tr());
                }
              }
            },
            cancelButton: cancelButton,
            deleteButton: const Text(
              'Delete',
              style: TextStyle(fontSize: 16, color: Colors.white),
              semanticsLabel: 'Delete',
            ),
            shouldTriggerVerification: viewModel.verificationNotifier.stream,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            cancelCallback: () {
              Navigator.maybePop(context);
            },
            digits: digits,
            passwordDigits: 6,
            // bottomWidget: _buildPasscodeRestoreButton(),
          ),
        ));
  }

  @override
  PasscodeViewModel viewModelBuilder(BuildContext context) =>
      PasscodeViewModel();
}

class PasscodeSuccessful extends StatelessWidget {
  const PasscodeSuccessful({super.key});

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
                LocaleKeys.securityWidget_passcode_passcodeSuccess,
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
                // router.router.replaceAll([const SecurityRoute()]);
                // final router = locator<RouterService>();
                router.router.pushAndPopUntil(
                  const SecurityRoute(),
                  predicate: (route) => false,
                );
              },
              text: LocaleKeys.securityWidget_passcode_continue.tr(),
            ),
            verticalSpaceXSmall(context),
            verticalSpaceMedium(context),
          ],
        ),
      ),
    );
  }
}
