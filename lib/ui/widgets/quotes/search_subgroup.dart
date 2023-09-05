import 'package:flutter/material.dart';
import 'package:meta_trader/ui/views/quotes/quotes_view_model.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';
import '../textfields/textfield.dart';

class SearchSubgroupPage extends StatelessWidget {
  final QuotesViewModel model;
  const SearchSubgroupPage({Key? key, required this.model}) : super(key: key);

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
                hintText: "Search pairs",
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
                  itemCount: model.symbolSubgroup.length,
                  itemBuilder: (context, index) {
                    final list = model.symbolSubgroup[index];
                    return CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity
                          .leading, // Checkbox on the left
                      title: Text(
                        list["title"],
                        style: CustomThemeData.generateColoredStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            context: context),
                      ),
                      subtitle: Text(
                        list["subtitle"],
                        style: CustomThemeData.generateColoredStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            context: context),
                      ),
                      value: model.selectedOptions.contains(list["title"]),
                      onChanged: (value) => model.togglePair(list["title"]),
                      secondary: Icon(Icons.arrow_forward_ios), // Trailing icon
                    );
                  }),
            ),
          ),
        ),
      ],
    );
  }
}
