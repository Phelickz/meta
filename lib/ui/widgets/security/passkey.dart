import 'package:flutter/material.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';
import '../../views/security/security_view_model.dart';
import '../buttons/buttons.dart';
import 'components/add_passkey_modal.dart';
import 'components/empty_passkey.dart';
import 'components/passkey_tile.dart';

class PasskeyPage extends StatelessWidget {
  final SecurityViewModel model;
  const PasskeyPage({super.key, required this.model});

  get viewModel => null;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return model.isPasskeyEmpty
        ? Expanded(
            child: Column(
              children: [
                verticalSpaceXSmall(context),
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
                      showAddPasskeyModal(context, isDarkMode);
                    },
                    text: 'Add A Passkey',
                  ),
                ),
                verticalSpaceMedium(context),
              ],
            ),
          )
        : EmptyPasskey(model: model);
  }

  void showAddPasskeyModal(BuildContext context, bool isDarkMode) {
    showModalBottomSheet(
        backgroundColor:
            isDarkMode ? const Color(0xFF0C2031) : const Color(0xFFFAFDFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(McGyver.rsDoubleH(context, 2)),
            topRight: Radius.circular(McGyver.rsDoubleH(context, 2)),
          ),
        ),
        context: context,
        isDismissible: true,
        enableDrag: true,
        isScrollControlled: true,
        builder: (context) {
          return AddPasskeyModal(vm: model);
        });
  }
}
