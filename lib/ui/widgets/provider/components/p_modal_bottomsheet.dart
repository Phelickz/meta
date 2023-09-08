import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/provider/provider_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/provider/components/provider_form_fields.dart';

class ProviderModalBottomsheet{
  static Widget tradeBottomSheet(ProviderViewModel viewModel){
    return Builder(
      builder: (context) {
        var isDarkMode = CustomThemeData.isDarkMode(context);
        return Container(
          height: 500.pWidth(context),
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20.pHeight(context), horizontal: 24.pWidth(context)),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Filter",
                style: CustomThemeData.generateColoredStyle(fontSize: 12, context: context),
              ),
              SizedBox(height: 10.pHeight(context),),
              ProviderFormFields.simpleFieldWithIcon("Start Date", "DD.MM.YYYY", Icon(Icons.calendar_month_outlined, size: 20 ,color: isDarkMode? const Color(0xFF98A2B3) : const Color(0xFF667085),)),
              SizedBox(height: 20.pHeight(context),),
              ProviderFormFields.simpleFieldWithIcon("End Date", "DD.MM.YYYY", Icon(Icons.calendar_month_outlined, size: 20 ,color: isDarkMode? const Color(0xFF98A2B3) : const Color(0xFF667085),)),
              SizedBox(height: 20.pHeight(context),),
              ProviderFormFields.simpleFieldWithIcon("Position", "Open Position", Icon(Icons.arrow_forward_ios, size: 20 ,color: isDarkMode? const Color(0xFF98A2B3) : const Color(0xFF667085), )),
              Row(
                children: [
                  Checkbox(value: viewModel.checkbox, onChanged: (_)=>viewModel.toggleCheckbox()),
                  Text(
                    "Profits",
                    style: CustomThemeData.generateColoredStyle(fontSize: 16, context: context, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(width: 28.pWidth(context)),
                  Checkbox(value: !viewModel.checkbox, onChanged: (_)=>viewModel.toggleCheckbox()),
                  Text(
                    "Loss",
                    style: CustomThemeData.generateColoredStyle(fontSize: 16, context: context, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const Spacer(),
              CustomButtons.generalButton(context: context, onTap: () => Navigator.of(context).pop(), text: "Filter", width: double.infinity, textSize: 1.8)
            ],
          ),
        );
      }
    );
  }

  static Widget followerBottomSheet(ProviderViewModel viewModel){
    return Builder(
      builder: (context) {
        var isDarkMode = CustomThemeData.isDarkMode(context);
        return Container(
          height: 500.pWidth(context),
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Filter",
                style: CustomThemeData.generateColoredStyle(fontSize: 14, context: context),
              ),
              SizedBox(height: 20.pHeight(context),),
              ProviderFormFields.simpleFieldWithIcon("Start Date", "DD.MM.YYYY", Icon(Icons.calendar_month_outlined, size: 20 ,color: isDarkMode? const Color(0xFF98A2B3) : const Color(0xFF667085),)),
              SizedBox(height: 20.pHeight(context),),
              ProviderFormFields.simpleFieldWithIcon("End Date", "DD.MM.YYYY", Icon(Icons.calendar_month_outlined, size: 20 ,color: isDarkMode? const Color(0xFF98A2B3) : const Color(0xFF667085),)),
              SizedBox(height: 20.pHeight(context),),
              ProviderFormFields.simpleFieldWithIcon("Select Country", "USA", Icon(Icons.arrow_forward_ios, size: 20 ,color: isDarkMode? const Color(0xFF98A2B3) : const Color(0xFF667085), )),
              Row(
                children: [
                  Checkbox(value: viewModel.checkbox, onChanged: (_)=>viewModel.toggleCheckbox()),
                  Text(
                    "Ascending",
                    style: CustomThemeData.generateColoredStyle(fontSize: 16, context: context, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(width: 28.pWidth(context)),
                  Checkbox(value: !viewModel.checkbox, onChanged: (_) => viewModel.toggleCheckbox()),
                  Text(
                    "Descending",
                    style: CustomThemeData.generateColoredStyle(fontSize: 16, context: context, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const Spacer(),
              CustomButtons.generalButton(context: context, onTap: () => Navigator.of(context).pop(), text: "Filter", width: double.infinity, textSize: 1.8)
            ],
          ),
        );
      }
    );
  }
}