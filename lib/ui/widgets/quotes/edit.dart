import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/quotes/quotes_view_model.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';
import '../textfields/textfield.dart';

class EditPage extends StatelessWidget {
  final QuotesViewModel model;
  const EditPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return Column(
      children: [
        Container(
          color: isDarkMode
              ? const Color(0xff052844)
              : Theme.of(context).scaffoldBackgroundColor,
          width: double.infinity,
          height: 100,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: McGyver.textSize(context, 2),
              ),
              child: CustomTextFields(
                hintText: LocaleKeys.searchPairs.tr(),
                suffixIcon: Icon(
                  Icons.search,
                  color: isDarkMode ? Colors.white38 : Colors.black,
                ),
              ),
            ),
          ),
        ),
        verticalSpaceSmall(context),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: McGyver.textSize(context, 2),
            ),
            child: SizedBox(
              width: double.infinity,
              child: ListView.builder(
                  itemCount: model.availablePairs.length,
                  itemBuilder: (context, index) {
                    return Theme(
                      data: ThemeData(
                        unselectedWidgetColor:
                            isDarkMode ? Colors.white54 : Colors.black,
                      ),
                      child: CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity
                            .leading, // Checkbox on the left
                        title: Text(
                          model.availablePairs[index],
                          style: CustomThemeData.generateColoredStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              context: context),
                        ),
                        value: model.selectedOptions
                            .contains(model.availablePairs[index]),
                        onChanged: (value) =>
                            model.togglePair(model.availablePairs[index]),
                        secondary: Icon(
                          Icons.menu,
                          color: isDarkMode ? Colors.white54 : Colors.black,
                        ), // Trailing icon
                      ),
                    );
                  }),
            ),
          ),
        ),
      ],
    );
  }
}
