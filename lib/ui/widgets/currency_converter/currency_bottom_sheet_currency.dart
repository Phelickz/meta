import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/currency_converter/currency_converter_view_model.dart';
import 'package:meta_trader/ui/widgets/auth/radio_button.dart';

class CurrencyConverterBottomSheetCurrency extends StatefulWidget {
  const CurrencyConverterBottomSheetCurrency({
    super.key,
    required this.viewModel,
    required this.currency2,
  });
  final CurrencyConverterViewModel viewModel;
  final bool currency2;

  @override
  State<CurrencyConverterBottomSheetCurrency> createState() =>
      _CurrencyConverterBottomSheetCurrencyState();
}

class _CurrencyConverterBottomSheetCurrencyState
    extends State<CurrencyConverterBottomSheetCurrency> {
  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          margin: EdgeInsets.zero,
          elevation: 1,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          color: isDarkMode
              ? Theme.of(context).scaffoldBackgroundColor
              : const Color(0xffF9FAFB),
          child: SizedBox(
            height: 180,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: McGyver.rsDoubleW(context, 5), vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceSmall(context),
                  Text(
                    'Select Account Currency',
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.8),
                      color: isDarkMode ? Colors.white : ColorManager.lightText,
                    ),
                  ),
                  verticalSpaceSmall(context),
                  Expanded(
                    flex: 3,
                    child: TextField(
                      style: CustomThemeData.generateStyle(
                        fontSize: 16,
                        color: isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: widget.viewModel.searchController,
                      onChanged: (String? value) {
                        if ((value ?? '').isNotEmpty) {
                          widget.viewModel.setTyping = true;
                        } else {
                          widget.viewModel.setTyping = false;
                        }
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: CustomThemeData.generateStyle(
                          fontSize: 15,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: widget.viewModel.isTyping
                            ? UnconstrainedBox(
                                child: GestureDetector(
                                  onTap: () {
                                    widget.viewModel.searchController.clear();
                                    widget.viewModel.setTyping = false;
                                  },
                                  child: SvgPicture.asset(
                                    'assets/images/close-square.svg',
                                    height: 25,
                                    width: 25,
                                    // ignore: deprecated_member_use
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                  ),
                                ),
                              )
                            : Icon(
                                Icons.search,
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // verticalSpaceSmall(context),
        // Divider(),
        Expanded(
          flex: 10,
          child: Container(
            color: isDarkMode
                ? Theme.of(context).scaffoldBackgroundColor
                : Colors.white,
            child: ListView.builder(
              itemCount: widget.currency2 == true
                  ? widget.viewModel.currency2.length
                  : widget.viewModel.currency.length,
              itemBuilder: (context, index) {
                return returnTile(
                    widget.currency2 == true
                        ? widget.viewModel.currency2[index]
                        : widget.viewModel.currency[index],
                    context,
                    widget.currency2 == true
                        ? (widget.viewModel.selectedCurrency2 ==
                            widget.viewModel.currency2[index])
                        : (widget.viewModel.selectedCurrency ==
                            widget.viewModel.currency[index]),
                    true, (p0) {
                  if (widget.currency2 == true) {
                    widget.viewModel.setSelectedCurrency2 =
                        widget.viewModel.currency2[index];
                  } else {
                    widget.viewModel.setSelectedCurrency =
                        widget.viewModel.currency[index];
                  }
                  setState(() {});
                  widget.viewModel.goBack();
                });
              },
            ),
          ),
        )
      ],
    );
  }

  Widget returnTile(String title, BuildContext context, bool value,
      bool groupValue, void Function(bool) onChanged) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return GestureDetector(
      // onTap: () {
      //   onChanged;
      // },
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: isDarkMode
            ? (value == true
                ? const Color(0xff052844)
                : Theme.of(context).scaffoldBackgroundColor)
            : (value == true
                ? Theme.of(context).primaryColor.withOpacity(0.2)
                : Colors.white),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10),
        //   side: BorderSide(
        //       color: Theme.of(context).secondaryHeaderColor, width: 1),
        // ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 7,
          ),
          child: ListTile(
            title: Text(
              title,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 2),
                fontWeight: FontWeight.bold,
                color:
                    isDarkMode ? Colors.white : Colors.black.withOpacity(0.7),
              ),
            ),
            trailing: Transform.scale(
              scale: 1.8,
              child: CustomRadioWidget(
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
