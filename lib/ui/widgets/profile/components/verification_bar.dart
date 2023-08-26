import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/profile/components/verification_status_indicator.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/utils/color_manager.dart';
import '../../../../app/utils/theme.dart';
import '../../../views/profile/profile_view_model.dart';

class VerificationBar extends StatelessWidget {
  final ProfileViewModel model;

  const VerificationBar({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal: 10.pWidth(context), vertical: 20.pHeight(context)),
          decoration: BoxDecoration(
            color: isDarkMode
                ? const Color(0xff052844)
                : Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 220.pWidth(context),
                    child: Column(
                      children: [
                        Align(
                          child: Text(
                            "Verify your account",
                            textAlign: TextAlign.left,
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.5),
                              fontWeight: FontWeight.w600,
                              color: isDarkMode
                                  ? ColorManager.darkText
                                  : ColorManager.lightText,
                            ),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(
                          height: 5.pHeight(context),
                        ),
                        SizedBox(
                          width: 220.pWidth(context),
                          child: Text(
                            "To make your first deposit, we would like to know you better. click ‘continue’ to get started",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomVerificationIndicator(model.verificationState, 2)
                ],
              ),
              CustomButtons.generalButton(
                  context: context, onTap: () {}, text: "Continue")
            ],
          ),
        ),
        SizedBox(
          height: 32.pHeight(context),
        )
      ],
    );
  }
}
