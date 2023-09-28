import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/utils/asset_manager.dart';
import '../../../app/utils/theme.dart';
import '../../views/settings/settings_view_model.dart';

class UpdateReleasePage extends StatelessWidget {
  final SettingsViewModel model;

  const UpdateReleasePage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 6),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 400.pHeight(context),
            child: SvgPicture.asset(isDarkMode
                ? AssetManager.updateImageDark
                : AssetManager.updateImageLight),
          ),
          Text(LocaleKeys.settings_updateRelease_updateReleaseText,
              style: CustomThemeData.generateStyle(
                fontSize: 24,
                color: isDarkMode ? Colors.white : const Color(0xff667085),
                fontWeight: FontWeight.w400,
              )),
          SizedBox(height: 10.pHeight(context)),
          Expanded(
            child: SizedBox(
                width: 190.pWidth(context),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(LocaleKeys.settings_updateRelease_thisUpdate,
                        style: CustomThemeData.generateStyle(
                          fontSize: 16,
                          color: isDarkMode
                              ? Colors.white54
                              : const Color(0xff667085),
                          fontWeight: FontWeight.normal,
                        )),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: model.updateFeatures.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              SizedBox(
                                width: 190.pWidth(context),
                                child: Row(
                                  children: [
                                    const Text(
                                      '•',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5.pWidth(context),
                                    ),
                                    Expanded(
                                        child: Text(model.updateFeatures[index],
                                            style:
                                                CustomThemeData.generateStyle(
                                              fontSize: 16,
                                              color: isDarkMode
                                                  ? Colors.white54
                                                  : const Color(0xff667085),
                                              fontWeight: FontWeight.normal,
                                            )))
                                  ],
                                ),
                              ),
                              SizedBox(height: 2.pHeight(context))
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                )),
          ),
          CustomButtons.generalButton(
              context: context, onTap: () {}, text: LocaleKeys.update),
          CustomButtons.generalTextButton(
            context: context,
            onTap: () {},
            text: LocaleKeys.cancel,
          ),
        ],
      ),
    );
  }
}
