// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/profit_calculator/profit_calculator_view_model.dart';
import 'package:meta_trader/ui/widgets/appbar.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/profit_calculator/bottom_sheet_currency.dart';
import 'package:meta_trader/ui/widgets/profit_calculator/bottom_sheet_currency_pair.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:meta_trader/ui/widgets/textfields/textfield.dart';
import 'package:stacked/stacked.dart';
import '../../../app/responsiveness/res.dart';

@RoutePage()
class ProfitCalculatorView extends StackedView<ProfitCalculatorViewModel> {
  const ProfitCalculatorView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    ProfitCalculatorViewModel viewModel,
    Widget? child,
  ) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
      isBusy: viewModel.isBusy,
      bodyPadding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 0),
      ),
      appBar: globalAppBar(context, 'Profit Calculator', '', () {
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Profit (USD)',
                            style: CustomThemeData.generateStyle(
                                fontSize: 13,
                                color:
                                    isDarkMode ? Colors.white70 : Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/icons/refresh-2.svg',
                              color: isDarkMode
                                  ? const Color(0xff98A2B3)
                                  : Colors.white,
                            ),
                          )
                        ],
                      ),
                      verticalSpaceXXSmall(context),
                      Text(
                        '0',
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 2.5),
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? const Color(0xff98A2B3)
                              : Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              verticalSpaceSmall(context),
              Text(
                'Account Currency',
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.8),
                  color: isDarkMode
                      ? ColorManager.darkText
                      : ColorManager.lightText,
                ),
              ),
              verticalSpaceXXSmall(context),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ProfitBottomSheetCurrency(
                        viewModel: viewModel,
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
                  // width: 100,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: IgnorePointer(
                    ignoring: true,
                    child: CustomTextFields(
                      hintText: viewModel.selectedCurrency,
                      password: false,
                      suffixIconConstraints:
                          const BoxConstraints(minHeight: 30, minWidth: 30),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 13.0),
                        child: SvgPicture.asset(
                            'assets/icons/arrow-swap-horizontal.svg'),
                      ),
                    ),
                  ),
                ),
              ),
              verticalSpaceSmall(context),
              Text(
                'Currency Pair',
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.8),
                  color: isDarkMode
                      ? ColorManager.darkText
                      : ColorManager.lightText,
                ),
              ),
              verticalSpaceXXSmall(context),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ProfitBottomSheetCurrencyPair(
                        viewModel: viewModel,
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
                  // width: 100,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: IgnorePointer(
                    ignoring: true,
                    child: CustomTextFields(
                      hintText: viewModel.selectedCurrencyPair,
                      password: false,
                      suffixIconConstraints:
                          const BoxConstraints(minHeight: 30, minWidth: 30),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 13.0),
                        child: SvgPicture.asset(
                            'assets/icons/arrow-swap-horizontal.svg'),
                      ),
                    ),
                  ),
                ),
              ),
              verticalSpaceSmall(context),
              Text(
                'Buy or Sell',
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.8),
                  color: isDarkMode ? Colors.white70 : const Color(0xff667085),
                ),
              ),
              verticalSpaceXSmall(context),
              IgnorePointer(
                ignoring: true,
                child: CustomTextFields(
                  hintText: 'Buy',
                  password: false,
                  suffixIcon: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
              ),
              verticalSpaceSmall(context),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Opening price',
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 1.8),
                          color: isDarkMode
                              ? ColorManager.darkText
                              : ColorManager.lightText,
                        ),
                      ),
                      verticalSpaceXXSmall(context),
                      SizedBox(
                        width: McGyver.rsDoubleW(context, 40),
                        height: 60,
                        child: CustomTextFields(
                          hintText: '0',
                          textAlign: TextAlign.center,
                          controller: viewModel.openingPriceController,
                          prefixIcon: IconButton(
                            onPressed: () {
                              viewModel.setOpeningPrice =
                                  (viewModel.openingPrice - 1) < 0
                                      ? 0
                                      : (viewModel.openingPrice - 1);
                            },
                            icon: Icon(
                              Icons.remove,
                              color: isDarkMode ? Colors.white60 : Colors.black,
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              viewModel.setOpeningPrice =
                                  viewModel.openingPrice + 1;
                            },
                            icon: Icon(
                              Icons.add,
                              color: isDarkMode ? Colors.white60 : Colors.black,
                            ),
                          ),
                          password: false,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Closing Price',
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 1.8),
                          color: isDarkMode
                              ? ColorManager.darkText
                              : ColorManager.lightText,
                        ),
                      ),
                      verticalSpaceXXSmall(context),
                      SizedBox(
                        width: McGyver.rsDoubleW(context, 40),
                        height: 60,
                        child: CustomTextFields(
                          hintText: '0',
                          textAlign: TextAlign.center,
                          controller: viewModel.closingPriceController,
                          prefixIcon: IconButton(
                            onPressed: () {
                              viewModel.setClosingPrice =
                                  (viewModel.closingPrice - 1) < 0
                                      ? 0
                                      : (viewModel.closingPrice - 1);
                            },
                            icon: Icon(
                              Icons.remove,
                              color: isDarkMode ? Colors.white60 : Colors.black,
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              viewModel.setClosingPrice =
                                  viewModel.closingPrice + 1;
                            },
                            icon: Icon(
                              Icons.add,
                              color: isDarkMode ? Colors.white60 : Colors.black,
                            ),
                          ),
                          password: false,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              verticalSpaceSmall(context),
              Text(
                'Trade Size (units)',
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
              verticalSpaceMedium(context),
              CustomButtons.generalButton(
                context: context,
                onTap: () {},
                text: 'Calculate',
              ),
              verticalSpaceSmall(context),
            ],
          ),
        ),
      ),
    );
  }

  @override
  ProfitCalculatorViewModel viewModelBuilder(BuildContext context) =>
      ProfitCalculatorViewModel();
}
