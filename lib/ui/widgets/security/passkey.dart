import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/ui/widgets/security/passkey_tile.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';
import '../../views/security/security_view_model.dart';
import '../buttons/buttons.dart';
import 'add_passkey_modal.dart';

class PasskeyPage extends StatelessWidget {
  final SecurityViewModel model;
  const PasskeyPage({super.key, required this.model});

  get viewModel => null;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    bool isEmpty = true;
    return !isEmpty
        ? Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (_, index) => const PasskeyTile(),
                    itemCount: 2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: McGyver.rsDoubleW(context, 6),
                  ),
                  child: CustomButtons.generalButton(
                    context: context,
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: isDarkMode
                              ? const Color(0xFF0C2031)
                              : const Color(0xFFFAFDFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  McGyver.rsDoubleH(context, 2)),
                              topRight: Radius.circular(
                                  McGyver.rsDoubleH(context, 2)),
                            ),
                          ),
                          context: context,
                          isDismissible: true,
                          enableDrag: true,
                          isScrollControlled: true,
                          builder: (context) {
                            return AddPasskeyModal(vm: model);
                          });
                    },
                    text: 'Add A Passkey',
                  ),
                ),
                verticalSpaceMedium(context),
              ],
            ),
          )
        : Expanded(
            child: Column(
              children: [
                verticalSpaceLarge(context),
                Container(
                  height: McGyver.rsDoubleH(context, 10),
                  width: McGyver.rsDoubleH(context, 10),
                  padding: EdgeInsets.all(
                    McGyver.rsDoubleH(context, 1.5),
                  ),
                  decoration: BoxDecoration(
                      color: isDarkMode
                          ? const Color(0xFF052844)
                          : const Color(0xFFD3ECFD),
                      borderRadius: BorderRadius.circular(
                        McGyver.rsDoubleH(context, 2),
                      )),
                  child: SizedBox(
                    height: McGyver.rsDoubleH(context, 8),
                    width: McGyver.rsDoubleH(context, 8),
                    child: SvgPicture.asset(
                      "assets/images/shield_security_empty.svg",
                    ),
                  ),
                ),
                verticalSpaceSmall(context),
                Text(
                  " Passkeys added Yet",
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? const Color(0xFFD0D5DD)
                        : const Color(0xFF98A2B3),
                  ),
                ),
                SizedBox(
                  height: McGyver.rsDoubleH(context, 48),
                ),
                CustomButtons.generalButton(
                  context: context,
                  onTap: () {
                    model.securityPageEnum = SecurityPageEnum.addPasskey;
                  },
                  text: 'Add A Passkey',
                ),
              ],
            ),
          );
  }
}
