import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/widgets/textfields/textfield.dart';

class ProviderFormFields{
  static Widget simpleField(String title, String hintText){
    return Builder(
      builder: (context) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: CustomThemeData.generateColoredStyle(fontSize: 16, context: context,fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 16.pHeight(context),),
              CustomTextFields(
                hintText: hintText,
              )
            ],
          ),
        );
      }
    );
  }

  static Widget simpleFieldWithPassword(String title, String hintText){
    return Builder(
      builder: (context) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: CustomThemeData.generateColoredStyle(fontSize: 16, context: context,fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 16.pHeight(context),),
              CustomTextFields(
                hintText: hintText,
                password: true,
              )
            ],
          ),
        );
      }
    );
  }
  static Widget simpleFieldWithIcon(String title, String hintText, Widget icon){
    return Builder(
      builder: (context) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: CustomThemeData.generateColoredStyle(fontSize: 16, context: context,fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 16.pHeight(context),),
              CustomTextFields(
                hintText: hintText,
                suffixIcon: icon,
              )
            ],
          ),
        );
      }
    );
  }
}