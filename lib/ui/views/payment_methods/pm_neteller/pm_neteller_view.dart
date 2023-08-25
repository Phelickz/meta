import 'package:flutter/cupertino.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/responsiveness/size.dart';
import '../../../../app/router/router.gr.dart';
import '../../../widgets/buttons/buttons.dart';
import '../../../widgets/textfields/label_text_field.dart';
import '../payment_method_viewmodel.dart';

// @RoutePage()
class PmNetellerView extends StatelessWidget {
  const PmNetellerView({super.key, this.viewModel});
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
                      label: "Email Address",
                      hintText: "Enter Email address",
                    ),
                    const LabelTextField(
                      label: "Pay ID",
                      hintText: "Enter Pay ID",
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
                viewModel?.push(const PmAddPaymentSuccessRoute());
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
