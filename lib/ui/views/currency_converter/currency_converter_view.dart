// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/constants.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/currency_converter/currency_converter_view_model.dart';
import 'package:meta_trader/ui/widgets/appbar.dart';
import 'package:meta_trader/ui/widgets/currency_converter/currency_bottom_sheet_currency.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:meta_trader/ui/widgets/textfields/textfield.dart';
import 'package:stacked/stacked.dart';
import '../../../app/responsiveness/res.dart';
import '../../../generated/locale_keys.g.dart';

@RoutePage()
class CurrencyConverterView extends StackedView<CurrencyConverterViewModel> {
  const CurrencyConverterView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    CurrencyConverterViewModel viewModel,
    Widget? child,
  ) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
      isBusy: viewModel.isBusy,
      bodyPadding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 0),
      ),
      appBar: globalAppBar(context, LocaleKeys.currencyConverter.tr(), '', () {
        Navigator.pop(context);
      }, []),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: McGyver.rsDoubleW(context, 5),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceSmall(context),
              Container(
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? const Color(0xff052844)
                      : Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(8),
                  border: isDarkMode
                      ? Border.all(
                          color: isDarkMode ? Colors.white24 : Colors.black12)
                      : null,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            viewModel.selectedCurrency ?? '',
                            style: CustomThemeData.generateStyle(
                              fontSize: 13,
                              color: isDarkMode ? Colors.white70 : Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          verticalSpaceSmall(context),
                          Text(
                            LocaleKeys.views_currencyConverter_twentyThree.tr(),
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 2.2),
                              fontWeight: FontWeight.bold,
                              color: isDarkMode
                                  ? const Color(
                                      0xff98A2B3,
                                    )
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Text(
                            viewModel.selectedCurrency2 ?? '',
                            style: CustomThemeData.generateStyle(
                                fontSize: 13,
                                color:
                                    isDarkMode ? Colors.white70 : Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          verticalSpaceSmall(context),
                          Text(
                            '1.0',
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 2.2),
                              fontWeight: FontWeight.bold,
                              color: isDarkMode
                                  ? const Color(0xff98A2B3)
                                  : Colors.white,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/icons/refresh-2.svg',
                              color: isDarkMode
                                  ? const Color(0xff98A2B3)
                                  : Colors.white,
                            ),
                          ),
                          verticalSpaceSmall(context),
                          verticalSpaceXSmall(context),
                          Text(
                            '',
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 0.3),
                              fontWeight: FontWeight.bold,
                              color: isDarkMode ? Colors.white : Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              verticalSpaceSmall(context),
              verticalSpaceSmall(context),
              verticalSpaceXXSmall(context),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.views_currencyConverter_currency1.tr(),
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 1.8),
                          color: isDarkMode
                              ? ColorManager.darkText
                              : ColorManager.lightText,
                        ),
                      ),
                      verticalSpaceXSmall(context),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return CurrencyConverterBottomSheetCurrency(
                                viewModel: viewModel,
                                currency2: false,
                              );
                            },
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 60,
                          width: McGyver.rsDoubleW(context, 40),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: IgnorePointer(
                            ignoring: true,
                            child: CustomTextFields(
                              hintText: viewModel.selectedCurrency,
                              password: false,
                              suffixIconConstraints: const BoxConstraints(
                                  minHeight: 30, minWidth: 30),
                              suffixIcon: Padding(
                                padding: Constants.getPadding(context, 13),
                                child: SvgPicture.asset(
                                    'assets/icons/arrow-swap-horizontal.svg'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.views_currencyConverter_currency2.tr(),
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 1.8),
                          color: isDarkMode
                              ? ColorManager.darkText
                              : ColorManager.lightText,
                        ),
                      ),
                      verticalSpaceXSmall(context),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return CurrencyConverterBottomSheetCurrency(
                                viewModel: viewModel,
                                currency2: true,
                              );
                            },
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 60,
                          width: McGyver.rsDoubleW(context, 40),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: IgnorePointer(
                            ignoring: true,
                            child: CustomTextFields(
                              hintText: viewModel.selectedCurrency2,
                              password: false,
                              suffixIconConstraints: const BoxConstraints(
                                  minHeight: 30, minWidth: 30),
                              suffixIcon: Padding(
                                padding: Constants.getPadding(context, 13),
                                child: SvgPicture.asset(
                                    'assets/icons/arrow-swap-horizontal.svg'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              verticalSpaceSmall(context),
              Text(
                LocaleKeys.views_currencyConverter_enterCurrency1.tr(),
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.8),
                  color: isDarkMode
                      ? ColorManager.darkText
                      : ColorManager.lightText,
                ),
              ),
              verticalSpaceXXSmall(context),
              const CustomTextFields(
                hintText: '0',
                password: false,
              ),
              verticalSpaceSmall(context),
              Text(
                LocaleKeys.views_currencyConverter_currency2.tr(),
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.8),
                  color: isDarkMode
                      ? ColorManager.darkText
                      : ColorManager.lightText,
                ),
              ),
              verticalSpaceXXSmall(context),
              const CustomTextFields(
                hintText: '0',
                password: false,
              ),
              verticalSpaceMedium(context),
              // CustomButtons.generalButton(
              //   context: context,
              //   onTap: () {},
              //   text: 'Calculate',
              // ),
              verticalSpaceSmall(context),
            ],
          ),
        ),
      ),
    );
  }

  @override
  CurrencyConverterViewModel viewModelBuilder(BuildContext context) =>
      CurrencyConverterViewModel();
}
