import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import '../../../app/responsiveness/res.dart';
import '../../../app/utils/theme.dart';
import '../../views/verification/verification_view_model.dart';
import '../auth/radio_button.dart';

class SelectIdentityPage extends StatelessWidget {
  final VerificationViewModel model;
  const SelectIdentityPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 5),
      ),
      child: Column(
        children: [
          verticalSpaceMedium(context),
          returnTile(
            LocaleKeys.nationalId,
            context,
            model.identityType == IdentityType.nationalIDCard,
            true,
            (value) {
              model.setRadio = 'IDcard';
              model.setIdentityTypeEnum = IdentityType.nationalIDCard;
            },
          ),
          verticalSpaceSmall(context),
          returnTile(
            LocaleKeys.verificationWidget_selectIdentity_validDriverL,
            context,
            model.identityType == IdentityType.driverLicense,
            true,
            (value) {
              model.setRadio = 'DriverLicense';
              model.setIdentityTypeEnum = IdentityType.driverLicense;
            },
          ),
          verticalSpaceSmall(context),
          returnTile(
            LocaleKeys.internationalPassport,
            context,
            model.identityType == IdentityType.internationalPassport,
            true,
            (value) {
              model.setRadio = LocaleKeys.passport;
              model.setIdentityTypeEnum = IdentityType.internationalPassport;
            },
          ),
          const Spacer(),
          CustomButtons.generalButton(
            context: context,
            onTap: () {
              model.setVerificationViewEnum =
                  VerificationPageEnum.identityVerificaitonSuccess;
            },
            text: LocaleKeys.next,
          ),
          verticalSpaceMedium(context),
        ],
      ),
    );
  }

  Widget returnTile(String title, BuildContext context, bool value,
      bool groupValue, void Function(bool) onChanged) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Card(
        elevation: 0,
        color: isDarkMode
            ? (value == true
                ? const Color(0xff052844)
                : Theme.of(context).scaffoldBackgroundColor)
            : (value == true
                ? Theme.of(context).primaryColor.withOpacity(0.2)
                : const Color(0xffF5FBFE)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
              color: Theme.of(context).secondaryHeaderColor, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 7,
          ),
          child: ListTile(
            title: Text(
              title,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 2),
                fontWeight: FontWeight.bold,
                color:
                    isDarkMode ? Colors.white : Colors.black.withOpacity(0.7),
              ),
            ),
            trailing: Transform.scale(
              scale: 1.8,
              child: CustomRadioWidget(
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
