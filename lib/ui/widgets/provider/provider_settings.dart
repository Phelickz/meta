import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/textfields/label_text_field.dart';
import 'package:meta_trader/ui/widgets/textfields/textfield.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';
import '../../views/provider/provider_view_model.dart';
import '../buttons/buttons.dart';

class ProviderSettingsPage extends StatelessWidget {
  final ProviderViewModel viewModel;
  const ProviderSettingsPage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            // horizontal: McGyver.rsDoubleW(context, 6),
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24.pHeight(context),
            ),
            LabelTextField(
              label: LocaleKeys.fundAccountWidget_onlineBankWidget_accountName
                  .tr(),
              hintText: viewModel.accountName,
              isEnabled: false,
            ),
            verticalSpaceXSmall(context),
            LabelTextField(
              onTap: () {
                viewModel.setProviderSettingsEnum =
                    ProviderSettingsEnum.changeNickName;
                viewModel.showCustomDialog(context);
              },
              isReadOnly: true,
              label: LocaleKeys.nickName.tr(),
              hintText: viewModel.nickname,
              suffixIcon: Transform.scale(
                  scale: 0.6, child: SvgPicture.asset(AssetManager.edit)),
            ),
            verticalSpaceXSmall(context),
            LabelTextField(
              onTap: () {
                viewModel.setProviderSettingsEnum =
                    ProviderSettingsEnum.changePassword;
                viewModel.showCustomDialog(context);
              },
              isReadOnly: true,
              label: LocaleKeys.password,
              hintText: viewModel.password,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.visibility_off),
              ),
            ),
            verticalSpaceXSmall(context),
            LabelTextField(
              onTap: () {
                viewModel.setProviderSettingsEnum =
                    ProviderSettingsEnum.updatePhoneNumber;
                viewModel.showCustomDialog(context);
              },
              isReadOnly: true,
              label: LocaleKeys.phoneNumber.tr(),
              hintText: viewModel.phoneNumber,
              suffixIcon: Transform.scale(
                  scale: 0.6, child: SvgPicture.asset(AssetManager.edit)),
            ),
            verticalSpaceXSmall(context),
            Text(
              LocaleKeys.strategyDescriptionText.tr(),
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.8),
                fontWeight: FontWeight.w500,
                color: isDarkMode
                    ? const Color(0xFFD0D5DD)
                    : const Color(
                        0xFF667085,
                      ),
              ),
            ),
            verticalSpaceXSmall(context),
            InkWell(
              onTap: () {
                viewModel.setProviderSettingsEnum =
                    ProviderSettingsEnum.editStrategyDescription;
                viewModel.showCustomDialog(context);
              },
              child: CustomTextFields(
                onTap: () {
                  viewModel.setProviderSettingsEnum =
                      ProviderSettingsEnum.editStrategyDescription;
                  viewModel.showCustomDialog(context);
                },
                isReadOnly: true,
                hintText: viewModel.strategyDescription,
                maxLines: 7,
                suffixIcon: InkWell(
                  onTap: () {
                    viewModel.setProviderSettingsEnum =
                        ProviderSettingsEnum.editStrategyDescription;
                    viewModel.showCustomDialog(context);
                  },
                  child: Transform.scale(
                      alignment: Alignment.topCenter,
                      scale: 0.6,
                      child: SvgPicture.asset(AssetManager.edit)),
                ),
              ),
            ),
            verticalSpaceSmall(context),
            LabelTextField(
              label: LocaleKeys
                  .providerWidget_providerSettings_desiredFeeCommission
                  .tr(),
              hintText: "${viewModel.desiredFee}%",
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios_outlined),
              ),
            ),
            SizedBox(
              height: 16.pHeight(context),
            ),
            LabelTextField(
              label: LocaleKeys.providerWidget_providerSettings_publicVisibility
                  .tr(),
              hintText: LocaleKeys
                  .providerWidget_providerSettings_visibilityPublic
                  .tr(),
              suffixIcon: Switch.adaptive(
                  value: viewModel.visibility,
                  onChanged: (bool visibility) {
                    viewModel.visibility = visibility;
                  }),
            ),
            SizedBox(
              height: 16.pHeight(context),
            ),
            SizedBox(
              height: 40.pHeight(context),
            ),
            CustomButtons.generalButton(
              context: context,
              onTap: () {},
              text: LocaleKeys.providerWidget_providerSettings_saveChanges.tr(),
              width: double.infinity,
              textSize: 1.8,
            ),
            SizedBox(
              height: 30.pHeight(context),
            )
          ],
        ),
      ),
    );
  }
}
