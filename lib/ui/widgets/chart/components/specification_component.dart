import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/chart/chart_view_model.dart';

class SpecificationComponent extends StatelessWidget {
  final ChartViewModel viewModel;
  const SpecificationComponent({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceXSmall(context),
          ValueListenableBuilder<bool>(
            valueListenable: viewModel.specificationStatus,
            builder: (context, value, child) => Visibility(
              visible: value,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: McGyver.rsDoubleW(context, 3),
                  vertical: McGyver.rsDoubleH(context, 1.2),
                ),
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? const Color(0xff052844)
                      : const Color(0xFF1570EF),
                  borderRadius:
                      BorderRadius.circular(McGyver.rsDoubleW(context, 2)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        LocaleKeys.chart_specification_marketIsOpen.tr(),
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 1.6),
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? const Color(0xFFD0D5DD)
                              : const Color(0xFFF2F4F7),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        viewModel.specificationStatus.value = false;
                      },
                      child: SvgPicture.asset("assets/images/close_circle.svg"),
                    )
                  ],
                ),
              ),
            ),
          ),
          verticalSpaceXSmall(context),
          Text(
            LocaleKeys.chart_specification_volumeLots.tr(),
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.9),
              fontWeight: FontWeight.bold,
              color: isDarkMode
                  ? const Color(0xFFD0D5DD)
                  : const Color(0xFF475467),
            ),
          ),
          verticalSpaceXXSmall(context),
          _twoText(
              context: context, left: LocaleKeys.minimum.tr(), right: "0.01"),
          verticalSpaceXXSmall(context),
          _twoText(
              context: context, left: LocaleKeys.maximum.tr(), right: "200"),
          verticalSpaceXXSmall(context),
          _twoText(context: context, left: LocaleKeys.step.tr(), right: "0.01"),
          verticalSpaceSmall(context),
          _twoTitleText(
              context: context,
              left: LocaleKeys.chart_specification_contractSize.tr(),
              right: "100"),
          verticalSpaceSmall(context),
          _twoTitleText(
              context: context,
              left: LocaleKeys.chart_specification_spreadUnits.tr(),
              right: "100"),
          verticalSpaceSmall(context),
          _twoTitleText(
              context: context,
              left: LocaleKeys.chart_specification_stopLevelPips.tr(),
              right: "100")
        ],
      ),
    );
  }

  Widget _twoText({
    required BuildContext context,
    required String left,
    required String right,
  }) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          left,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.5),
            fontWeight: FontWeight.w500,
            color:
                isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFF667085),
          ),
        ),
        Text(
          right,
          textAlign: TextAlign.right,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.5),
            fontWeight: FontWeight.w500,
            color: const Color(0xFF98A2B3),
          ),
        )
      ],
    );
  }

  Widget _twoTitleText({
    required BuildContext context,
    required String left,
    required String right,
  }) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          left,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.9),
            fontWeight: FontWeight.bold,
            color:
                isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFF475467),
          ),
        ),
        Text(
          right,
          textAlign: TextAlign.right,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.5),
            fontWeight: FontWeight.w500,
            color: const Color(0xFF98A2B3),
          ),
        )
      ],
    );
  }
}
