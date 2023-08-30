import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/widgets/textfields/textfield.dart';

class ExistingAccountFormView extends StatelessWidget {
  final String header1, header2, header3;
  const ExistingAccountFormView({super.key, required this.header1, required this.header2, required this.header3});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(header1,
        style: CustomThemeData.generateStyle(
          fontSize: McGyver.textSize(context, 2.0),
          color: isDarkMode ? Colors.white : const Color(0xFF667085),
          fontWeight: FontWeight.w600
          ),
        ),
        SizedBox(height: 8.pHeight(context),),
        const CustomTextFields(
          hintText: "Enter your login ID",
        ),
        SizedBox(height: 16.pHeight(context),),
        Text(header2,
        style: CustomThemeData.generateStyle(
          fontSize: McGyver.textSize(context, 2.0),
          color: isDarkMode ? Colors.white : const Color(0xFF667085),
          fontWeight: FontWeight.w600
          ),
        ),
        SizedBox(height: 8.pHeight(context),),
        const CustomTextFields(
          hintText: "Password",
          password: true,
        ),
        SizedBox(height: 16.pHeight(context),),
        Text(header3,
        style: CustomThemeData.generateStyle(
          fontSize: McGyver.textSize(context, 2.0),
          color: isDarkMode ? Colors.white : const Color(0xFF667085),
          fontWeight: FontWeight.w600
          ),
        ),
        SizedBox(height: 8.pHeight(context),),
        const CustomTextFields(
          hintText: "DCFXPrime-Real",
        )
      ],
    );
  }
}


class ExistingAccountFormView2 extends StatelessWidget {
  const ExistingAccountFormView2({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Current Password",
        style: CustomThemeData.generateStyle(
          fontSize: McGyver.textSize(context, 2.0),
          color: isDarkMode ? Colors.white : const Color(0xFF667085),
          fontWeight: FontWeight.w600
          ),
        ),
        SizedBox(height: 8.pHeight(context),),
        const CustomTextFields(
          hintText: "Enter Current Password",
          password: true,
        ),
        SizedBox(height: 16.pHeight(context),),
        Text("New Password",
        style: CustomThemeData.generateStyle(
          fontSize: McGyver.textSize(context, 2.0),
          color: isDarkMode ? Colors.white : const Color(0xFF667085),
          fontWeight: FontWeight.w600
          ),
        ),
        SizedBox(height: 8.pHeight(context),),
        const CustomTextFields(
          hintText: "Enter new Password",
          password: true,
        ),
        SizedBox(height: 16.pHeight(context),),
        Text("Re-enter Password",
        style: CustomThemeData.generateStyle(
          fontSize: McGyver.textSize(context, 2.0),
          color: isDarkMode ? Colors.white : const Color(0xFF667085),
          fontWeight: FontWeight.w600
          ),
        ),
        SizedBox(height: 8.pHeight(context),),
        const CustomTextFields(
          hintText: "Re-enter new Password",
          password: true,
        )
      ],
    );
  }
}
