import 'package:flutter/material.dart';

import '../../../app/utils/theme.dart';
import '../../views/help_and_support/help_and_support_view_model.dart';

class CustomerSupportEmpty extends StatelessWidget {
  final HelpAndSupportViewModel model;

  const CustomerSupportEmpty({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return Center();
  }
}
