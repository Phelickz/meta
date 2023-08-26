import 'package:flutter/cupertino.dart';
import '../../../../app/responsiveness/res.dart';
import '../../../../app/responsiveness/size.dart';
import '../../../widgets/buttons/buttons.dart';
import '../../../widgets/dropdown/label_dropdown.dart';

import '../../../widgets/textfields/label_text_field.dart';
import '../payment_method_viewmodel.dart';

// @RoutePage()
class PmTetherView extends StatelessWidget {
  const PmTetherView({super.key, this.viewModel});
  final PaymentMethodViewModel? viewModel;

  @override
  // A builder function that gives us a ViewModel
  Widget build(
    BuildContext context,
  ) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: McGyver.rsDoubleW(context, 6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpaceXSmall(context),
                    const LabelTextField(
                      label: "Wallet Address",
                      hintText: "Enter  TetherUSD Wallet Address",
                    ),
                    LabelDropdown(
                      value: "BTC Beacon Chain (BEP2)",
                      label: "Choose Network",
                      options: const [
                        "BTC Beacon Chain (BEP2)",
                        "BTC Beacon Chain (BEP3)",
                      ],
                      onChanged: (val) {
                        // viewModel.onChanged(val);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: McGyver.rsDoubleW(context, 6),
            ),
            child: CustomButtons.generalButton(
              context: context,
              onTap: () {
                viewModel?.goToAddPaymentMethodSucess();
              },
              text: 'Save',
            ),
          ),
          verticalSpaceSmall(context),
          verticalSpaceXSmall(context),
        ],
      ),
    );
  }
}
