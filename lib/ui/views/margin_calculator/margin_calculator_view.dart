// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/constants.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/margin_calculator/margin_calculator_view_model.dart';
import 'package:meta_trader/ui/widgets/appbar.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/margin_calculator/margin_bottom_sheet_currency_pair.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:meta_trader/ui/widgets/textfields/textfield.dart';
import 'package:stacked/stacked.dart';
import '../../../app/responsiveness/res.dart';
import '../../widgets/margin_calculator/margin_bottom_sheet_currency.dart';

@RoutePage()
class MarginCalculatorView extends StackedView<MarginCalculatorViewModel> {
  const MarginCalculatorView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    MarginCalculatorViewModel viewModel,
    Widget? child,
  ) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
      isBusy: viewModel.isBusy,
      bodyPadding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 0),
      ),
      appBar: globalAppBar(context, LocaleKeys.marginCalculator.tr(), '', () {
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
                            LocaleKeys
                                .views_marginCalculatorView_requiredMargin,
                            style: CustomThemeData.generateStyle(
                                fontSize: 13,
                                color:
                                    isDarkMode ? Colors.white70 : Colors.white,
                                fontWeight: FontWeight.w500),
                          ).tr(args: ['(USD)']),
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
                LocaleKeys.accountCurrency,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.8),
                  color: isDarkMode
                      ? ColorManager.darkText
                      : ColorManager.lightText,
                ),
              ).tr(),
              verticalSpaceXXSmall(context),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return MarginBottomSheetCurrency(
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
                        padding: Constants.getPadding(context, 13),
                        child: SvgPicture.asset(
                            'assets/icons/arrow-swap-horizontal.svg'),
                      ),
                    ),
                  ),
                ),
              ),
              verticalSpaceSmall(context),
              Text(
                LocaleKeys.currencyPair,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.8),
                  color: isDarkMode
                      ? ColorManager.darkText
                      : ColorManager.lightText,
                ),
              ).tr(),
              verticalSpaceXXSmall(context),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return MarginBottomSheetCurrencyPair(
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
                        padding: Constants.getPadding(context, 13),
                        child: SvgPicture.asset(
                            'assets/icons/arrow-swap-horizontal.svg'),
                      ),
                    ),
                  ),
                ),
              ),
              verticalSpaceSmall(context),
              Text(
                LocaleKeys.tradeSize,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.8),
                  color: isDarkMode
                      ? ColorManager.darkText
                      : ColorManager.lightText,
                ),
              ).tr(),
              verticalSpaceXXSmall(context),
              const CustomTextFields(
                hintText: '0',
                password: false,
              ),
              verticalSpaceSmall(context),
              Text(
                LocaleKeys.leverage,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.8),
                  color: isDarkMode ? Colors.white70 : const Color(0xff667085),
                ),
              ).tr(),
              verticalSpaceXSmall(context),
              IgnorePointer(
                ignoring: true,
                child: CustomTextFields(
                  hintText: '1:100',
                  password: false,
                  suffixIcon: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
              ),
              verticalSpaceMedium(context),
              CustomButtons.generalButton(
                context: context,
                onTap: () {},
                text: LocaleKeys.calculate.tr(),
              ),
              verticalSpaceSmall(context),
            ],
          ),
        ),
      ),
    );
  }

  @override
  MarginCalculatorViewModel viewModelBuilder(BuildContext context) =>
      MarginCalculatorViewModel();
}
