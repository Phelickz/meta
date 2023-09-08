import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/ui/widgets/textfields/label_text_field.dart';

import '../../../app/responsiveness/res.dart';
import '../../views/provider/provider_view_model.dart';
import '../buttons/buttons.dart';

class ProviderLoginPage extends StatelessWidget {
  final ProviderViewModel viewModel;
  const ProviderLoginPage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: McGyver.rsDoubleW(context, 6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24.pHeight(context),
            ),
            LabelTextField(
              label: "Account Name",
              hintText: viewModel.accountName,
              isEnabled: false,
            ),
            SizedBox(
              height: 16.pHeight(context),
            ),
            LabelTextField(
              label: "Nickname",
              hintText: viewModel.nickname,
              suffixIcon: SvgPicture.asset(AssetManager.edit),
            ),
            SizedBox(
              height: 16.pHeight(context),
            ),
            LabelTextField(
              label: "Password",
              hintText: viewModel.password,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.visibility_off),
              ),
            ),
            SizedBox(
              height: 16.pHeight(context),
            ),
            LabelTextField(
              label: "Phone Number",
              hintText: viewModel.password,
              suffixIcon: SvgPicture.asset(AssetManager.edit),
            ),
            SizedBox(
              height: 16.pHeight(context),
            ),
            LabelTextField(
              label: "Strategy Description",
              hintText: viewModel.strategyDescription,
              maxLines: 7,
              suffixIcon: SvgPicture.asset(AssetManager.edit),
            ),
            SizedBox(
              height: 16.pHeight(context),
            ),
            LabelTextField(
              label: "Desired Fees (Commission)",
              hintText: "${viewModel.desiredFee}%",
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios_outlined),
              ),
            ),
            SizedBox(
              height: 16.pHeight(context),
            ),
            LabelTextField(
              label: "Public Visibility",
              hintText: viewModel.strategyDescription,
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
              text: "Save changes",
              width: double.infinity,
              textSize: 1.8,
            ),
          ],
        ),
      ),
    );
  }
}
