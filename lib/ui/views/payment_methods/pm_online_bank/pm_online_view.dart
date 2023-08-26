import 'package:flutter/cupertino.dart';
import 'package:meta_trader/ui/widgets/textfields/label_text_field.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/responsiveness/size.dart';
import '../../../widgets/buttons/buttons.dart';
import '../payment_method_viewmodel.dart';

// @RoutePage()
class PmOnlineView extends StatelessWidget {
  const PmOnlineView({super.key, this.viewModel});
  final PaymentMethodViewModel? viewModel;

  @override
  // A builder function that gives us a ViewModel
  Widget build(
    BuildContext context,
  ) {
    return Column(
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
                    label: "Account Name",
                    hintText: "Susan Blake",
                    isEnabled: false,
                  ),
                  const LabelTextField(
                    label: "Account Number",
                    hintText: "23458755632",
                  ),
                  const LabelTextField(
                    label: "Bank Name",
                    hintText: "Enter bank name",
                  ),
                  const LabelTextField(
                    label: "Account opening branch (optional)",
                    hintText: "Enter bank branch information",
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
            text: 'Save Changes',
          ),
        ),
        verticalSpaceSmall(context),
        verticalSpaceXSmall(context),
      ],
    );
  }
}
