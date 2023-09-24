import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/internal_transfer/internal_transfer_view_model.dart';
import 'package:meta_trader/ui/widgets/auth/radio_button.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';

class SelectDestinationInternalTransfer extends StatelessWidget {
  const SelectDestinationInternalTransfer({super.key, required this.model});
  final InternalTransferViewModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 4),
      ),
      child: Column(
        children: [
          verticalSpaceXSmall(context),
          Expanded(
            child: ListView.separated(
              itemCount: 4,
              itemBuilder: (context, index) {
                return accountTile(
                  context,
                  model.account2 == index,
                  true,
                  (value) => model.setAccount2 = index,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return verticalSpaceSmall(context);
              },
            ),
          ),
          CustomButtons.generalButton(
            context: context,
            onTap: () {
              model.push(InternalTransferAmount(model: model));
            },
            text: LocaleKeys.next,
          ),
          verticalSpaceSmall(context),
        ],
      ),
    );
  }

  Widget accountTile(BuildContext context, bool value, bool groupValue,
      void Function(bool) onChanged) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Card(
        elevation: 0,
        color: !isDarkMode
            ? value == true
                ? const Color(0xffD3ECFD)
                : Colors.white
            : value == true
                ? const Color(0xff052844)
                : Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
          side: BorderSide(
            color: isDarkMode
                ? Theme.of(context).secondaryHeaderColor.withOpacity(0.3)
                : Theme.of(context).secondaryHeaderColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '3329617 - FXTM - Real',
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.2),
                              color: isDarkMode ? Colors.white : Colors.black45,
                            ),
                          ),
                          Text(
                            LocaleKeys.balance,
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.2),
                              color: isDarkMode ? Colors.white : Colors.black45,
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceXXSmall(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'vikij***@gmail.com',
                            style: CustomThemeData.generateStyle(
                                fontSize: McGyver.textSize(context, 1.7),
                                fontWeight: FontWeight.w700,
                                color: isDarkMode
                                    ? Colors.white
                                    : ColorManager.lightText),
                          ),
                          Text(
                            '12 000 000.00',
                            style: CustomThemeData.generateStyle(
                                fontSize: McGyver.textSize(context, 1.7),
                                fontWeight: FontWeight.w700,
                                color: isDarkMode
                                    ? Colors.white
                                    : ColorManager.lightText),
                          ),
                        ],
                      ),
                      verticalSpaceSmall(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: McGyver.rsDoubleW(context, 8),
                            height: McGyver.rsDoubleW(context, 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/logo.png'),
                              ),
                            ),
                          ),
                          Text(
                            LocaleKeys.lastActivity,
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.2),
                              fontWeight: FontWeight.normal,
                              color: isDarkMode ? Colors.white : Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              horizontalSpaceXSmall(context),
              Transform.scale(
                scale: 2,
                child: CustomRadioWidget(
                  value: value,
                  groupValue: groupValue,
                  onChanged: onChanged,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
