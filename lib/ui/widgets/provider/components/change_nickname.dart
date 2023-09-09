import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/provider/provider_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';

import '../../../../app/responsiveness/res.dart';
import '../../textfields/label_text_field.dart';

class ChangeNickName extends StatelessWidget {
  final ProviderViewModel viewModel;
  const ChangeNickName({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 360.pHeight(context),
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 6),
      ),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 35.pHeight(context),
          ),
          Text(
            "Change NickName",
            style: CustomThemeData.generateColoredStyle(
                fontSize: 14, context: context),
          ),
          SizedBox(
            height: 20.pHeight(context),
          ),
          LabelTextField(label: "Nickname", hintText: "Enter new nickname"),
          SizedBox(
            height: 80.pHeight(context),
          ),
          CustomButtons.generalButton(
              context: context,
              onTap: () {
                Navigator.pop(context);
              },
              text: "confirm")
        ],
      ),
    );
  }
}
