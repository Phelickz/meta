import 'package:flutter/material.dart';
import 'package:meta_trader/ui/widgets/security/passkey_tile.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../views/security/security_view_model.dart';
import '../buttons/buttons.dart';

class PasskeyPage extends StatelessWidget {
  final SecurityViewModel model;
  const PasskeyPage({super.key, required this.model});

  get viewModel => null;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                viewModel.goToAddPaymentMethodSucess();
              },
              text: 'Add A Passkey',
            ),
          ),
          verticalSpaceMedium(context),
        ],
      ),
    );
  }
}
